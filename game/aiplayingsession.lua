--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 8,["12"] = 48,["13"] = 48,["14"] = 48,["15"] = 48,["16"] = 61,["17"] = 48,["18"] = 63,["19"] = 64,["20"] = 65,["21"] = 66,["22"] = 67,["23"] = 68,["24"] = 69,["25"] = 70,["26"] = 71,["28"] = 73,["29"] = 73,["30"] = 73,["31"] = 73,["32"] = 73,["33"] = 74,["34"] = 73,["35"] = 73,["36"] = 76,["37"] = 61,["38"] = 82,["39"] = 83,["40"] = 84,["42"] = 87,["43"] = 88,["44"] = 89,["45"] = 90,["47"] = 48,["48"] = 82,["49"] = 96,["50"] = 97,["51"] = 98,["52"] = 48,["53"] = 102,["54"] = 102,["55"] = 102,["56"] = 96,["57"] = 105,["58"] = 105,["59"] = 106,["60"] = 107,["61"] = 48,["63"] = 109,["64"] = 109,["66"] = 105});
local ____exports = {}
local ____playing = require("playing")
local AbstractPlaying = ____playing.AbstractPlaying
local ____json = require("json")
local json = ____json.json
local ____ScaledScreenshotter = require("graphics.ScaledScreenshotter")
local ScaledScreenshotter = ____ScaledScreenshotter.ScaledScreenshotter
local threadCode = "\nrequire(\"love.image\")\nrequire(\"love.data\")\n\nlocal ip, port = ...\n\nlocal connectionUpdateChannel = love.thread.getChannel(\"AI_connectionUpdateChannel\")\nlocal gameinputChannel = love.thread.getChannel(\"AI_gameinputChannel\")\nlocal screenshotChannel = love.thread.getChannel(\"AI_screenshotChannel\")\nlocal endConnectionChannel = love.thread.getChannel(\"AI_endConnectionChannel\")\n\nlocal socket = require \"socket\"\n\nlocal tcp = socket.tcp()\nlocal result = tcp:connect(ip, port)\nif result then\n    connectionUpdateChannel:push(true)\nelse\n    connectionUpdateChannel:push(false)\nend\n\nwhile true do\n    local maybeEndConnection = endConnectionChannel:pop()\n    if maybeEndConnection then\n        tcp:send(\"\\\"end\\\"\\n\")\n        break\n    end\n\n    local screenShot = screenshotChannel:demand()\n    local fileData = screenShot:encode(\"png\")\n    tcp:send(tostring(fileData:getSize()) .. \"\\n\")\n    tcp:send(fileData:getString())\n\n    local gameInput = tcp:receive(\"*l\")\n    gameinputChannel:push(gameInput)\nend\n\ntcp:close()\n"
____exports.AIPlayingSession = __TS__Class()
local AIPlayingSession = ____exports.AIPlayingSession
AIPlayingSession.name = "AIPlayingSession"
__TS__ClassExtends(AIPlayingSession, AbstractPlaying)
function AIPlayingSession.prototype.____constructor(self, level)
    AbstractPlaying.prototype.____constructor(self, level)
    self.connectionUpdateChannel = love.thread.getChannel("AI_connectionUpdateChannel")
    self.gameInputChannel = love.thread.getChannel("AI_gameinputChannel")
    self.screenshotChannel = love.thread.getChannel("AI_screenshotChannel")
    self.endConnectionChannel = love.thread.getChannel("AI_endConnectionChannel")
    self.thread = love.thread.newThread(threadCode)
    self.thread:start("127.0.0.1", 5006)
    self.connectionSuccessful = self.connectionUpdateChannel:demand()
    if not self.connectionSuccessful then
        love.window.showMessageBox("Connection Issues", "connection to recording server not successful", "error")
    end
    self.screenShotter = __TS__New(
        ScaledScreenshotter,
        80,
        80,
        function()
            self:draw()
        end
    )
    self.currentGameInput = {pedal = 0, rotation = 0}
end
function AIPlayingSession.prototype.update(self, dt)
    if not self.connectionSuccessful then
        Application.popState()
    end
    local popped = self.gameInputChannel:pop()
    if popped then
        local gameInputString = popped
        self.currentGameInput = json.decode(gameInputString)
    end
    AbstractPlaying.prototype.update(self, dt)
end
function AIPlayingSession.prototype.physicsUpdate(self, dt)
    self:setPedal(self.currentGameInput.pedal)
    self:setRotation(self.currentGameInput.rotation)
    AbstractPlaying.prototype.physicsUpdate(self, dt)
    self.screenshotChannel:push(
        self.screenShotter:captureScreenshot()
    )
end
function AIPlayingSession.prototype.endGame(self, gameEndReason, ...)
    local states = {...}
    self.endConnectionChannel:push("end")
    self.thread:wait()
    AbstractPlaying.prototype.endGame(
        self,
        gameEndReason,
        unpack(states)
    )
end
return ____exports
