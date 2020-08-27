import { json } from "./json";
import { Level } from "./level";
import { Playing } from "./playing";

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
    local gameInput = gameinputChannel:demand()
    if gameInput == false then
        tcp:send(tostring(0))
        break
    end
    tcp:send(gameInput)

    local screenShot = screenshotChannel:demand()
    local fileData = screenShot:encode("png")
    tcp:send(tostring(fileData:getSize()))
    tcp:send(fileData:getString())
    love.timer.sleep(0.001) --probably something I'm doing wrong with networking here, but I'm not quite sure what exactly. Just having this sleep is good enough :)
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

    constructor(level: Level) {
        super(level);
        this.gameinputChannel = love.thread.getChannel("gameinputChannel");
        this.screenshotChannel = love.thread.getChannel("screenshotChannel");
        this.thread = love.thread.newThread(threadCode);
        this.thread.start("127.0.0.1", 5005);
    }

    endGame() {
        super.endGame();

        this.gameinputChannel.push(false);
        this.thread.wait();
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

        love.graphics.captureScreenshot(this.screenshotChannel);
    }
}
