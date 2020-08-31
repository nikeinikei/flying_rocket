--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 6,["11"] = 6,["12"] = 8,["13"] = 47,["14"] = 47,["15"] = 47,["16"] = 47,["17"] = 53,["18"] = 47,["19"] = 55,["20"] = 56,["21"] = 57,["22"] = 58,["23"] = 59,["24"] = 59,["25"] = 59,["26"] = 59,["27"] = 59,["28"] = 60,["29"] = 59,["30"] = 59,["31"] = 53,["32"] = 64,["33"] = 65,["34"] = 66,["35"] = 67,["36"] = 68,["37"] = 69,["38"] = 70,["40"] = 73,["41"] = 75,["42"] = 76,["43"] = 77,["45"] = 64,["46"] = 81,["47"] = 47,["48"] = 84,["49"] = 85,["50"] = 86,["51"] = 90,["52"] = 90,["53"] = 90,["54"] = 91,["55"] = 91,["56"] = 91,["57"] = 81,["58"] = 94,["59"] = 95,["60"] = 96,["62"] = 47,["64"] = 94});
local ____exports = {}
local ____json = require("json")
local json = ____json.json
local ____playing = require("playing")
local Playing = ____playing.Playing
local GameEndReason = ____playing.GameEndReason
local ____ScaledScreenshotter = require("graphics.ScaledScreenshotter")
local ScaledScreenshotter = ____ScaledScreenshotter.ScaledScreenshotter
local threadCode = "\nrequire(\"love.image\")\nrequire(\"love.data\")\nrequire(\"love.timer\")\n\nlocal ip, port = ...\n\nlocal gameinputChannel = love.thread.getChannel(\"gameinputChannel\")\nlocal screenshotChannel = love.thread.getChannel(\"screenshotChannel\")\n\nlocal socket = require \"socket\"\n\nlocal tcp = socket.tcp()\ntcp:connect(ip, port)\n\nwhile true do\n::loopStart::\n    local gameInput = gameinputChannel:demand()\n    if gameInput == \"won\" or gameInput == \"lost\"then\n        tcp:send(\"\\\"\" .. gameInput .. \"\\\"\\n\")\n        goto loopStart\n    elseif gameInput == \"quit\" then\n        tcp:send(\"\\\"\" .. gameInput .. \"\\\"\\n\")\n        break\n    end\n    tcp:send(gameInput .. \"\\n\")\n\n    local screenShot = screenshotChannel:demand()\n    local fileData = screenShot:encode(\"png\")\n    tcp:send(tostring(fileData:getSize()) .. \"\\n\")\n    tcp:send(fileData:getString())\nend\n\ntcp:close()\n"
____exports.RecordingSession = __TS__Class()
local RecordingSession = ____exports.RecordingSession
RecordingSession.name = "RecordingSession"
__TS__ClassExtends(RecordingSession, Playing)
function RecordingSession.prototype.____constructor(self, level)
    Playing.prototype.____constructor(self, level)
    self.gameinputChannel = love.thread.getChannel("gameinputChannel")
    self.screenshotChannel = love.thread.getChannel("screenshotChannel")
    self.thread = love.thread.newThread(threadCode)
    self.thread:start("127.0.0.1", 5005)
    self.screenShotter = __TS__New(
        ScaledScreenshotter,
        80,
        80,
        function()
            self:draw()
        end
    )
end
function RecordingSession.prototype.endGame(self, gameEndReason, ...)
    if gameEndReason == GameEndReason.Won then
        self.gameinputChannel:push("won")
    elseif gameEndReason == GameEndReason.Lost then
        self.gameinputChannel:push("lost")
    elseif gameEndReason == GameEndReason.Quit then
        self.gameinputChannel:push("quit")
    end
    self:reset()
    if gameEndReason == GameEndReason.Quit then
        self.thread:wait()
        Application.popState()
    end
end
function RecordingSession.prototype.physicsUpdate(self, dt)
    Playing.prototype.physicsUpdate(self, dt)
    local pedal = self:getPedal()
    local rotation = self:getRotation()
    local input = {pedal = pedal, rotation = rotation}
    self.gameinputChannel:push(
        json.encode(input)
    )
    self.screenshotChannel:push(
        self.screenShotter:captureScreenshot()
    )
end
function RecordingSession.prototype.keypressed(self, key)
    if key == "l" then
        self:lose()
    else
        Playing.prototype.keypressed(self, key)
    end
end
return ____exports
