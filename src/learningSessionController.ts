import { json } from "./json";
import { Level } from "./level";
import { GameController, GameInput, GameUpdate } from "./playing";

const threadCode = `
local ip, port = ...
print("ip", ip, "port", port)

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
    tcp:send(playingState)
end

print("closing")
tcp:close()
`;

export class LearningSession implements GameController {
    private thread: Thread;
    private inChannel: Channel;
    private outChannel: Channel;

    constructor() {
        this.inChannel = love.thread.getChannel("LearningSessionInChannel");
        this.outChannel = love.thread.getChannel("LearningSessionOutChannel");
        this.thread = love.thread.newThread(threadCode);
        this.thread.start("127.0.0.1", 5005);
    }

    end(): void {
        this.inChannel.push(false);
    }

    init(level: Level) {
        this.inChannel.push(json.encode(level));
    }

    sendUpdate(gameUpdate: GameUpdate) {
        this.inChannel.push(json.encode(gameUpdate));
    }

    defaultGameInput(): GameInput {
        return {
            pedal: 0,
            rotation: 0,
        };
    }

    getInput(): GameInput {
        const inputAsString = this.outChannel.pop();

        if (inputAsString == null) {
            return this.defaultGameInput();
        } else {
            return json.decode(inputAsString);
        }
    }
}
