import { KeyConstant } from "love.keyboard";

import { GameState } from "../gamestate";
import { ScaledScreenshotter } from "../graphics/ScaledScreenshotter";
import { json } from "../json";
import { Level } from "../level";
import { GameEndReason, Playing } from "../playing";
import { config } from "./config";

const threadCode = `
require("love.image")
require("love.data")
require("love.timer")

local ip, port = ...

local connectionUpdateChannel = love.thread.getChannel("RC_connectionUpdateChannel")
local gameinputChannel = love.thread.getChannel("RC_gameinputChannel")
local screenshotChannel = love.thread.getChannel("RC_screenshotChannel")

local socket = require "socket"

local tcp = socket.tcp()
local result = tcp:connect(ip, port)
if result then
    connectionUpdateChannel:push(true)
else
    connectionUpdateChannel:push(false)
end

while true do
::loopStart::
    local gameInput = gameinputChannel:demand()
    if gameInput == "won" or gameInput == "lost"then
        tcp:send("\\"" .. gameInput .. "\\"\\n")
        goto loopStart
    elseif gameInput == "quit" then
        tcp:send("\\"" .. gameInput .. "\\"\\n")
        break
    end
    tcp:send(gameInput .. "\\n")

    local screenShot = screenshotChannel:demand()
    local fileData = screenShot:encode("png")
    tcp:send(tostring(fileData:getSize()) .. "\\n")
    tcp:send(fileData:getString())
end

tcp:close()
`;

/**
 * Learning Session uses the normal player input but sends all the frames and input to the server
 */
export class RecordingSession extends Playing {
    private thread: Thread;
    private connectionUpdateChannel: Channel;
    private gameinputChannel: Channel;
    private screenshotChannel: Channel;
    private screenShotter: ScaledScreenshotter;
    private connectionSuccessful: boolean;
    private physicsUpdatrFramesCounter: number;

    constructor(level: Level) {
        super(level);
        this.connectionUpdateChannel = love.thread.getChannel("RC_connectionUpdateChannel");
        this.gameinputChannel = love.thread.getChannel("RC_gameinputChannel");
        this.screenshotChannel = love.thread.getChannel("RC_screenshotChannel");
        this.thread = love.thread.newThread(threadCode);
        this.thread.start("127.0.0.1", 5005);
        this.connectionSuccessful = this.connectionUpdateChannel.demand() as boolean;
        if (this.connectionSuccessful) {
            print("connection successful");
        } else {
            love.window.showMessageBox("Connection issues", "connection to recording server not successful", "error");
        }
        this.screenShotter = new ScaledScreenshotter(80, 80, () => {
            this.draw();
        });
        this.physicsUpdatrFramesCounter = 0;
    }

    update(dt: number) {
        if (this.connectionSuccessful == false) {
            Application.popState();
        }

        super.update(dt);
    }

    endGame(gameEndReason: GameEndReason, ..._states: GameState[]) {
        if (gameEndReason == GameEndReason.Won) {
            this.gameinputChannel.push("won");
        } else if (gameEndReason == GameEndReason.Lost) {
            this.gameinputChannel.push("lost");
        } else if (gameEndReason == GameEndReason.Quit) {
            this.gameinputChannel.push("quit");
        }

        this.reset();

        if (gameEndReason == GameEndReason.Quit) {
            this.thread.wait();
            Application.popState();
        }
    }

    physicsUpdate(dt: number) {
        super.physicsUpdate(dt);

        this.physicsUpdatrFramesCounter++;
        if (this.physicsUpdatrFramesCounter == config.frameQuotient) {
            this.physicsUpdatrFramesCounter = 0;

            const pedal = this.getPedal();
            const rotation = this.getRotation();
            const input = {
                pedal,
                rotation,
            };
            this.gameinputChannel.push(json.encode(input));
            this.screenshotChannel.push(this.screenShotter.captureScreenshot());
        }
    }

    keypressed(key: KeyConstant) {
        if (key == "l") {
            this.lose();
        } else {
            super.keypressed(key);
        }
    }
}
