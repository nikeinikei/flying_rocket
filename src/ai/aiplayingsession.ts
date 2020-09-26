import { GameState } from "../gamestate";
import { ScaledScreenshotter } from "../graphics/ScaledScreenshotter";
import { json } from "../json";
import { Level } from "../level";
import { AbstractPlaying, GameEndReason } from "../playing";
import { config } from "./config";

const threadCode = `
require("love.image")
require("love.data")

local ip, port = ...

local connectionUpdateChannel = love.thread.getChannel("AI_connectionUpdateChannel")
local gameinputChannel = love.thread.getChannel("AI_gameinputChannel")
local screenshotChannel = love.thread.getChannel("AI_screenshotChannel")
local endConnectionChannel = love.thread.getChannel("AI_endConnectionChannel")

local socket = require "socket"

local tcp = socket.tcp()
local result = tcp:connect(ip, port)
if result then
    connectionUpdateChannel:push(true)
else
    connectionUpdateChannel:push(false)
end

while true do
    local maybeEndConnection = endConnectionChannel:pop()
    if maybeEndConnection then
        tcp:send("\\"end\\"\\n")
        break
    end

    local screenShot = screenshotChannel:demand()
    local fileData = screenShot:encode("png")
    tcp:send(tostring(fileData:getSize()) .. "\\n")
    tcp:send(fileData:getString())

    local gameInput = tcp:receive("*l")
    gameinputChannel:push(gameInput)
end

tcp:close()
`;

export class AIPlayingSession extends AbstractPlaying {
    private thread: Thread;
    private connectionUpdateChannel: Channel;
    private gameInputChannel: Channel;
    private screenshotChannel: Channel;
    private endConnectionChannel: Channel;
    private connectionSuccessful: boolean;
    private screenShotter: ScaledScreenshotter;
    private currentGameInput: {
        pedal: number;
        rotation: number;
    };
    private physicsUpdateFramesCounter: number;

    constructor(level: Level) {
        super(level);
        this.connectionUpdateChannel = love.thread.getChannel("AI_connectionUpdateChannel");
        this.gameInputChannel = love.thread.getChannel("AI_gameinputChannel");
        this.screenshotChannel = love.thread.getChannel("AI_screenshotChannel");
        this.endConnectionChannel = love.thread.getChannel("AI_endConnectionChannel");
        this.thread = love.thread.newThread(threadCode);
        this.thread.start("127.0.0.1", 5006);
        this.connectionSuccessful = this.connectionUpdateChannel.demand();
        if (!this.connectionSuccessful) {
            love.window.showMessageBox("Connection Issues", "connection to recording server not successful", "error");
        }
        this.screenShotter = new ScaledScreenshotter(80, 80, () => {
            this.draw();
        });
        this.currentGameInput = {
            pedal: 0,
            rotation: 0,
        };
        this.physicsUpdateFramesCounter = 0;
    }

    update(dt: number) {
        if (!this.connectionSuccessful) {
            Application.popState();
        }

        const popped = this.gameInputChannel.pop();
        if (popped) {
            const gameInputString = popped as string;
            this.currentGameInput = json.decode(gameInputString);
        }

        super.update(dt);
    }

    physicsUpdate(dt: number) {
        this.setPedal(this.currentGameInput.pedal);
        this.setRotation(this.currentGameInput.rotation);

        super.physicsUpdate(dt);

        this.physicsUpdateFramesCounter++;
        if (this.physicsUpdateFramesCounter == config.frameQuotient) {
            this.screenshotChannel.push(this.screenShotter.captureScreenshot());
            this.physicsUpdateFramesCounter = 0;
        }
    }

    endGame(gameEndReason: GameEndReason, ...states: GameState[]) {
        this.endConnectionChannel.push("end");
        this.thread.wait();

        super.endGame(gameEndReason, ...states);
    }
}
