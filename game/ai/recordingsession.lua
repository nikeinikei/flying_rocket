--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 7,["10"] = 7,["11"] = 7,["12"] = 8,["13"] = 8,["14"] = 10,["15"] = 55,["16"] = 55,["17"] = 55,["18"] = 55,["19"] = 64,["20"] = 55,["21"] = 66,["22"] = 67,["23"] = 68,["24"] = 69,["25"] = 70,["26"] = 71,["27"] = 72,["28"] = 73,["30"] = 75,["32"] = 77,["33"] = 77,["34"] = 77,["35"] = 77,["36"] = 77,["37"] = 78,["38"] = 77,["39"] = 77,["40"] = 80,["41"] = 64,["42"] = 83,["43"] = 84,["44"] = 85,["46"] = 55,["47"] = 83,["48"] = 91,["49"] = 92,["50"] = 93,["51"] = 94,["52"] = 95,["53"] = 96,["54"] = 97,["56"] = 100,["57"] = 102,["58"] = 103,["59"] = 104,["61"] = 91,["62"] = 108,["63"] = 55,["64"] = 111,["65"] = 112,["66"] = 113,["67"] = 115,["68"] = 116,["69"] = 117,["70"] = 121,["71"] = 121,["72"] = 121,["73"] = 122,["74"] = 122,["75"] = 122,["77"] = 108,["78"] = 126,["79"] = 127,["80"] = 128,["82"] = 55,["84"] = 126});
local ____exports = {}
local ____ScaledScreenshotter = require("graphics.ScaledScreenshotter")
local ScaledScreenshotter = ____ScaledScreenshotter.ScaledScreenshotter
local ____json = require("json")
local json = ____json.json
local ____playing = require("playing")
local GameEndReason = ____playing.GameEndReason
local Playing = ____playing.Playing
local ____config = require("ai.config")
local config = ____config.config
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
    self.physicsUpdatrFramesCounter = 0
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
    self.physicsUpdatrFramesCounter = self.physicsUpdatrFramesCounter + 1
    if self.physicsUpdatrFramesCounter == config.frameQuotient then
        self.physicsUpdatrFramesCounter = 0
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
end
function RecordingSession.prototype.keypressed(self, key)
    if key == "l" then
        self:lose()
    else
        Playing.prototype.keypressed(self, key)
    end
end
return ____exports
