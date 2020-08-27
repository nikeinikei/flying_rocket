--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 5,["10"] = 41,["11"] = 41,["12"] = 41,["13"] = 41,["14"] = 46,["15"] = 41,["16"] = 48,["17"] = 49,["18"] = 50,["19"] = 51,["20"] = 46,["21"] = 54,["22"] = 41,["23"] = 57,["24"] = 58,["25"] = 54,["26"] = 61,["27"] = 41,["28"] = 64,["29"] = 65,["30"] = 66,["31"] = 70,["32"] = 70,["33"] = 70,["34"] = 72,["35"] = 61});
local ____exports = {}
local ____json = require("json")
local json = ____json.json
local ____playing = require("playing")
local Playing = ____playing.Playing
local threadCode = "\nrequire(\"love.image\")\nrequire(\"love.data\")\nrequire(\"love.timer\")\n\nlocal ip, port = ...\n\nlocal gameinputChannel = love.thread.getChannel(\"gameinputChannel\")\nlocal screenshotChannel = love.thread.getChannel(\"screenshotChannel\")\n\nlocal socket = require \"socket\"\n\nlocal tcp = socket.tcp()\ntcp:connect(ip, port)\n\nwhile true do\n    local gameInput = gameinputChannel:demand()\n    if gameInput == false then\n        tcp:send(tostring(0))\n        break\n    end\n    tcp:send(gameInput)\n\n    local screenShot = screenshotChannel:demand()\n    local fileData = screenShot:encode(\"png\")\n    tcp:send(tostring(fileData:getSize()))\n    tcp:send(fileData:getString())\n    love.timer.sleep(0.001) --probably something I'm doing wrong with networking here, but I'm not quite sure what exactly. Just having this sleep is good enough :)\nend\n\ntcp:close()\n"
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
end
function RecordingSession.prototype.endGame(self)
    Playing.prototype.endGame(self)
    self.gameinputChannel:push(false)
    self.thread:wait()
end
function RecordingSession.prototype.physicsUpdate(self, dt)
    Playing.prototype.physicsUpdate(self, dt)
    local pedal = self:getPedal()
    local rotation = self:getRotation()
    local input = {pedal = pedal, rotation = rotation}
    self.gameinputChannel:push(
        json.encode(input)
    )
    love.graphics.captureScreenshot(self.screenshotChannel)
end
return ____exports
