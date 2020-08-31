import { json } from "./json";
import { Level } from "./level";
import { Playing, GameEndReason } from "./playing";
import { GameState } from "./gamestate";
import { KeyConstant } from "love.keyboard";
import { ScaledScreenshotter } from "./graphics/ScaledScreenshotter";

const threadCode = `
require("love.image")
require("love.data")
require("love.timer")

local ip, port = ...

local gameinputChannel = love.thread.getChannel("gameinputChannel")
local screenshotChannel = love.thread.getChannel("screenshotChannel")

local socket = require "socket"

local tcp = socket.tcp()
tcp:connect(ip, port)

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
    private gameinputChannel: Channel;
    private screenshotChannel: Channel;
    private screenShotter: ScaledScreenshotter;

    constructor(level: Level) {
        super(level);
        this.gameinputChannel = love.thread.getChannel("gameinputChannel");
        this.screenshotChannel = love.thread.getChannel("screenshotChannel");
        this.thread = love.thread.newThread(threadCode);
        this.thread.start("127.0.0.1", 5005);
        this.screenShotter = new ScaledScreenshotter(80, 80, () => {
            this.draw();
        })
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

        const pedal = this.getPedal();
        const rotation = this.getRotation();
        const input = {
            pedal,
            rotation
        };
        this.gameinputChannel.push(json.encode(input));
        this.screenshotChannel.push(this.screenShotter.captureScreenshot());
    }

    keypressed(key: KeyConstant) {
        if (key == "l") {
            this.lose();
        } else {
            super.keypressed(key);
        }
    }
}
