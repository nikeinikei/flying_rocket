--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 6,["11"] = 6,["12"] = 8,["13"] = 53,["14"] = 53,["15"] = 53,["16"] = 53,["17"] = 61,["18"] = 53,["19"] = 63,["20"] = 64,["21"] = 65,["22"] = 66,["23"] = 67,["24"] = 68,["25"] = 69,["26"] = 70,["28"] = 72,["30"] = 74,["31"] = 74,["32"] = 74,["33"] = 74,["34"] = 74,["35"] = 75,["36"] = 74,["37"] = 74,["38"] = 61,["39"] = 79,["40"] = 80,["41"] = 81,["43"] = 53,["44"] = 79,["45"] = 87,["46"] = 88,["47"] = 89,["48"] = 90,["49"] = 91,["50"] = 92,["51"] = 93,["53"] = 96,["54"] = 98,["55"] = 99,["56"] = 100,["58"] = 87,["59"] = 104,["60"] = 53,["61"] = 107,["62"] = 108,["63"] = 109,["64"] = 113,["65"] = 113,["66"] = 113,["67"] = 114,["68"] = 114,["69"] = 114,["70"] = 104,["71"] = 117,["72"] = 118,["73"] = 119,["75"] = 53,["77"] = 117});
local ____exports = {}
local ____json = require("json")
local json = ____json.json
local ____playing = require("playing")
local Playing = ____playing.Playing
local GameEndReason = ____playing.GameEndReason
local ____ScaledScreenshotter = require("graphics.ScaledScreenshotter")
local ScaledScreenshotter = ____ScaledScreenshotter.ScaledScreenshotter
local threadCode = "\nrequire(\"love.image\")\nrequire(\"love.data\")\nrequire(\"love.timer\")\n\nlocal ip, port = ...\n\nlocal connectionUpdateChannel = love.thread.getChannel(\"RC_connectionUpdateChannel\")\nlocal gameinputChannel = love.thread.getChannel(\"RC_gameinputChannel\")\nlocal screenshotChannel = love.thread.getChannel(\"RC_screenshotChannel\")\n\nlocal socket = require \"socket\"\n\nlocal tcp = socket.tcp()\nlocal result = tcp:connect(ip, port)\nif result then\n    connectionUpdateChannel:push(true)\nelse\n    connectionUpdateChannel:push(false)\nend\n\nwhile true do\n::loopStart::\n    local gameInput = gameinputChannel:demand()\n    if gameInput == \"won\" or gameInput == \"lost\"then\n        tcp:send(\"\\\"\" .. gameInput .. \"\\\"\\n\")\n        goto loopStart\n    elseif gameInput == \"quit\" then\n        tcp:send(\"\\\"\" .. gameInput .. \"\\\"\\n\")\n        break\n    end\n    tcp:send(gameInput .. \"\\n\")\n\n    local screenShot = screenshotChannel:demand()\n    local fileData = screenShot:encode(\"png\")\n    tcp:send(tostring(fileData:getSize()) .. \"\\n\")\n    tcp:send(fileData:getString())\nend\n\ntcp:close()\n"
____exports.RecordingSession = __TS__Class()
local RecordingSession = ____exports.RecordingSession
RecordingSession.name = "RecordingSession"
__TS__ClassExtends(RecordingSession, Playing)
function RecordingSession.prototype.____constructor(self, level)
    Playing.prototype.____constructor(self, level)
    self.connectionUpdateChannel = love.thread.getChannel("RC_connectionUpdateChannel")
    self.gameinputChannel = love.thread.getChannel("RC_gameinputChannel")
    self.screenshotChannel = love.thread.getChannel("RC_screenshotChannel")
    self.thread = love.thread.newThread(threadCode)
    self.thread:start("127.0.0.1", 5005)
    self.connectionSuccessful = self.connectionUpdateChannel:demand()
    if self.connectionSuccessful then
        print("connection successful")
    else
        love.window.showMessageBox("Connection issues", "connection to recording server not successful", "error")
    end
    self.screenShotter = __TS__New(
        ScaledScreenshotter,
        80,
        80,
        function()
            self:draw()
        end
    )
end
function RecordingSession.prototype.update(self, dt)
    if self.connectionSuccessful == false then
        Application.popState()
    end
    Playing.prototype.update(self, dt)
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
