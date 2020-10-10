--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 3,["8"] = 3,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 8,["14"] = 48,["15"] = 48,["16"] = 48,["17"] = 48,["18"] = 62,["19"] = 48,["20"] = 64,["21"] = 65,["22"] = 66,["23"] = 67,["24"] = 68,["25"] = 69,["26"] = 70,["27"] = 71,["28"] = 72,["30"] = 74,["31"] = 74,["32"] = 74,["33"] = 74,["34"] = 74,["35"] = 75,["36"] = 74,["37"] = 74,["38"] = 77,["39"] = 81,["40"] = 82,["41"] = 82,["42"] = 82,["43"] = 62,["44"] = 85,["45"] = 86,["46"] = 87,["47"] = 88,["48"] = 89,["49"] = 90,["51"] = 92,["53"] = 85,["54"] = 96,["55"] = 97,["56"] = 98,["58"] = 48,["59"] = 96,["60"] = 104,["61"] = 105,["62"] = 106,["63"] = 107,["64"] = 108,["66"] = 109,["68"] = 112,["69"] = 113,["70"] = 48,["71"] = 117,["72"] = 118,["73"] = 118,["74"] = 118,["75"] = 119,["77"] = 104,["78"] = 123,["79"] = 123,["80"] = 124,["81"] = 125,["82"] = 125,["83"] = 125,["84"] = 126,["85"] = 48,["87"] = 128,["88"] = 128,["90"] = 123});
local ____exports = {}
local ____ScaledScreenshotter = require("graphics.ScaledScreenshotter")
local ScaledScreenshotter = ____ScaledScreenshotter.ScaledScreenshotter
local ____json = require("json")
local json = ____json.json
local ____playing = require("playing")
local AbstractPlaying = ____playing.AbstractPlaying
local ____config = require("ai.config")
local config = ____config.config
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
    self.physicsUpdateFramesCounter = 0
    self.screenshotChannel:push(
        self.screenShotter:captureScreenshot()
    )
end
function AIPlayingSession.prototype.pollGameInput(self)
    local popped = self.gameInputChannel:pop()
    if popped then
        local gameInputString = popped
        self.currentGameInput = json.decode(gameInputString)
        return true
    else
        return false
    end
end
function AIPlayingSession.prototype.update(self, dt)
    if not self.connectionSuccessful then
        Application.popState()
    end
    AbstractPlaying.prototype.update(self, dt)
end
function AIPlayingSession.prototype.physicsUpdate(self, dt)
    self.physicsUpdateFramesCounter = self.physicsUpdateFramesCounter + 1
    if self.physicsUpdateFramesCounter == config.frameQuotient then
        self.clock:pause()
        while not self:pollGameInput() do
        end
        self.clock:resume()
    end
    self:setPedal(self.currentGameInput.pedal)
    self:setRotation(self.currentGameInput.rotation)
    AbstractPlaying.prototype.physicsUpdate(self, dt)
    if self.physicsUpdateFramesCounter == config.frameQuotient then
        self.screenshotChannel:push(
            self.screenShotter:captureScreenshot()
        )
        self.physicsUpdateFramesCounter = 0
    end
end
function AIPlayingSession.prototype.endGame(self, gameEndReason, ...)
    local states = {...}
    self.endConnectionChannel:push("end")
    self.screenshotChannel:push(
        self.screenShotter:captureScreenshot()
    )
    self.thread:wait()
    AbstractPlaying.prototype.endGame(
        self,
        gameEndReason,
        unpack(states)
    )
end
return ____exports
