--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 3,["8"] = 3,["9"] = 5,["10"] = 5,["11"] = 7,["12"] = 47,["13"] = 47,["14"] = 47,["15"] = 47,["16"] = 60,["17"] = 47,["18"] = 62,["19"] = 63,["20"] = 64,["21"] = 65,["22"] = 66,["23"] = 67,["24"] = 68,["25"] = 69,["26"] = 70,["28"] = 72,["29"] = 72,["30"] = 72,["31"] = 72,["32"] = 72,["33"] = 73,["34"] = 72,["35"] = 72,["36"] = 75,["37"] = 60,["38"] = 81,["39"] = 82,["40"] = 83,["42"] = 86,["43"] = 87,["44"] = 88,["45"] = 89,["47"] = 47,["48"] = 81,["49"] = 95,["50"] = 96,["51"] = 97,["52"] = 47,["53"] = 101,["54"] = 101,["55"] = 101,["56"] = 95,["57"] = 104,["58"] = 104,["59"] = 105,["60"] = 106,["61"] = 47,["63"] = 108,["64"] = 108,["66"] = 104});
local ____exports = {}
local ____ScaledScreenshotter = require("graphics.ScaledScreenshotter")
local ScaledScreenshotter = ____ScaledScreenshotter.ScaledScreenshotter
local ____json = require("json")
local json = ____json.json
local ____playing = require("playing")
local AbstractPlaying = ____playing.AbstractPlaying
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
