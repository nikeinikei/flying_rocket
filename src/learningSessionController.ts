import { json } from "./json";
import { Level } from "./level";
import { GameController, GameInput } from "./playing";

const threadCode = `
require("love.image")
require("love.data")

local ip, port = ...

local inChannel = love.thread.getChannel("LearningSessionInChannel")
local outChannel = love.thread.getChannel("LearningSessionOutChannel")

local socket = require "socket"

local tcp = socket.tcp()
tcp:connect(ip, port)

local levelData = inChannel:demand()
tcp:send(levelData)

while true do
    local gameInput = tcp:receive("*l*")
    outChannel:push(gameInput)

    local playingState = inChannel:demand()
    if playingState == false then
        break
    end

    tcp:send(playingState:encode("png"):getString())
end

tcp:close()
`;

export class LearningSession implements GameController {
    private thread: Thread;
    private inChannel: Channel;
    private outChannel: Channel;
    private gameInputChannel: Channel;

    constructor() {
        this.inChannel = love.thread.getChannel("LearningSessionInChannel");
        this.outChannel = love.thread.getChannel("LearningSessionOutChannel");
        this.gameInputChannel = love.thread.newChannel();
        this.thread = love.thread.newThread(threadCode);
        this.thread.start("127.0.0.1", 5005);
    }

    end(): void {
        this.inChannel.push(false);
    }

    init(level: Level) {
        this.inChannel.push(json.encode(level));
    }

    update(dt: number) {
        let popped: any;
        while (popped = this.outChannel.pop()) {
            this.gameInputChannel.push(json.decode(popped));
        }
    }

    getGameUpdateChannel() {
        return this.inChannel;
    }

    getGameInputChannel() {
        return this.gameInputChannel;
    }
}
