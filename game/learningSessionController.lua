--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 5,["8"] = 35,["9"] = 35,["10"] = 35,["12"] = 41,["13"] = 42,["14"] = 43,["15"] = 44,["16"] = 40,["17"] = 47,["18"] = 48,["19"] = 47,["20"] = 51,["21"] = 52,["22"] = 52,["23"] = 52,["24"] = 51,["25"] = 55,["26"] = 56,["27"] = 56,["28"] = 56,["29"] = 55,["30"] = 59,["31"] = 60,["32"] = 59,["33"] = 66,["34"] = 67,["35"] = 69,["36"] = 70,["38"] = 72,["40"] = 66});
local ____exports = {}
local ____json = require("json")
local json = ____json.json
local threadCode = "\nlocal ip, port = ...\nprint(\"ip\", ip, \"port\", port)\n\nlocal inChannel = love.thread.getChannel(\"LearningSessionInChannel\")\nlocal outChannel = love.thread.getChannel(\"LearningSessionOutChannel\")\n\nlocal socket = require \"socket\"\n\nlocal tcp = socket.tcp()\ntcp:connect(ip, port)\n\nlocal levelData = inChannel:demand()\ntcp:send(levelData)\n\nwhile true do\n    local gameInput = tcp:receive(\"*l*\")\n    outChannel:push(gameInput)\n\n    local playingState = inChannel:demand()\n    if playingState == false then\n        break\n    end\n    tcp:send(playingState)\nend\n\nprint(\"closing\")\ntcp:close()\n"
____exports.LearningSession = __TS__Class()
local LearningSession = ____exports.LearningSession
LearningSession.name = "LearningSession"
function LearningSession.prototype.____constructor(self)
    self.inChannel = love.thread.getChannel("LearningSessionInChannel")
    self.outChannel = love.thread.getChannel("LearningSessionOutChannel")
    self.thread = love.thread.newThread(threadCode)
    self.thread:start("127.0.0.1", 5005)
end
LearningSession.prototype["end"] = function(self)
    self.inChannel:push(false)
end
function LearningSession.prototype.init(self, level)
    self.inChannel:push(
        json.encode(level)
    )
end
function LearningSession.prototype.sendUpdate(self, gameUpdate)
    self.inChannel:push(
        json.encode(gameUpdate)
    )
end
function LearningSession.prototype.defaultGameInput(self)
    return {pedal = 0, rotation = 0}
end
function LearningSession.prototype.getInput(self)
    local inputAsString = self.outChannel:pop()
    if inputAsString == nil then
        return self:defaultGameInput()
    else
        return json.decode(inputAsString)
    end
end
return ____exports
