--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 5,["8"] = 37,["9"] = 37,["10"] = 37,["12"] = 44,["13"] = 45,["14"] = 46,["15"] = 47,["16"] = 48,["17"] = 43,["18"] = 51,["19"] = 52,["20"] = 51,["21"] = 55,["22"] = 56,["23"] = 56,["24"] = 56,["25"] = 55,["26"] = 59,["27"] = 60,["29"] = 61,["30"] = 61,["31"] = 61,["32"] = 62,["33"] = 62,["34"] = 62,["36"] = 59,["37"] = 66,["38"] = 67,["39"] = 66,["40"] = 70,["41"] = 71,["42"] = 70});
local ____exports = {}
local ____json = require("json")
local json = ____json.json
local threadCode = "\nrequire(\"love.image\")\nrequire(\"love.data\")\n\nlocal ip, port = ...\n\nlocal inChannel = love.thread.getChannel(\"LearningSessionInChannel\")\nlocal outChannel = love.thread.getChannel(\"LearningSessionOutChannel\")\n\nlocal socket = require \"socket\"\n\nlocal tcp = socket.tcp()\ntcp:connect(ip, port)\n\nlocal levelData = inChannel:demand()\ntcp:send(levelData)\n\nwhile true do\n    local gameInput = tcp:receive(\"*l*\")\n    outChannel:push(gameInput)\n\n    local playingState = inChannel:demand()\n    if playingState == false then\n        break\n    end\n\n    tcp:send(playingState:encode(\"png\"):getString())\nend\n\ntcp:close()\n"
____exports.LearningSession = __TS__Class()
local LearningSession = ____exports.LearningSession
LearningSession.name = "LearningSession"
function LearningSession.prototype.____constructor(self)
    self.inChannel = love.thread.getChannel("LearningSessionInChannel")
    self.outChannel = love.thread.getChannel("LearningSessionOutChannel")
    self.gameInputChannel = love.thread.newChannel()
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
function LearningSession.prototype.update(self, dt)
    local popped
    while (function()
        popped = self.outChannel:pop()
        return popped
    end)() do
        self.gameInputChannel:push(
            json.decode(popped)
        )
    end
end
function LearningSession.prototype.getGameUpdateChannel(self)
    return self.inChannel
end
function LearningSession.prototype.getGameInputChannel(self)
    return self.gameInputChannel
end
return ____exports
