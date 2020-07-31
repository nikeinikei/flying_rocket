--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 5,["10"] = 31,["11"] = 31,["12"] = 31,["13"] = 31,["15"] = 31,["16"] = 39,["17"] = 40,["18"] = 41,["19"] = 36,["20"] = 44,["21"] = 45,["22"] = 47,["23"] = 48,["25"] = 50,["27"] = 44,["28"] = 54,["29"] = 55,["30"] = 55,["31"] = 55,["32"] = 54,["33"] = 58,["34"] = 59,["35"] = 60,["37"] = 58,["38"] = 64,["39"] = 65,["40"] = 64,["41"] = 68,["42"] = 69,["43"] = 68,["44"] = 72,["45"] = 73,["46"] = 72});
local ____exports = {}
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local ____json = require("json")
local json = ____json.json
local threadCode = "\nlocal ip, port = ...\nprint(\"ip\", ip, \"port\", port)\n\nlocal inChannel = love.thread.getChannel(\"LearningSessionInChannel\")\nlocal outChannel = love.thread.getChannel(\"LearningSessionOutChannel\")\n\nlocal socket = require \"socket\"\n\nlocal tcp = socket.tcp()\ntcp:connect(ip, port)\n\nwhile true do\n    local playingState = inChannel:demand()\n    if playingState == false then\n        break\n    end\n    tcp:send(playingState)\n\n    local gameInput = tcp:receive()\n    outChannel:push(gameInput)\nend\n\ntcp:close()\n"
____exports.LearningSession = __TS__Class()
local LearningSession = ____exports.LearningSession
LearningSession.name = "LearningSession"
__TS__ClassExtends(LearningSession, GameState)
function LearningSession.prototype.____constructor(self)
    GameState.prototype.____constructor(self)
    self.thread = love.thread.newThread(threadCode)
    self.inChannel = love.thread.getChannel("LearningSessionInChannel")
    self.outChannel = love.thread.getChannel("LearningSessionOutChannel")
end
function LearningSession.prototype.getInput(self)
    local inputAsString = self.outChannel:pop()
    if inputAsString == nil then
        return nil
    else
        return json.decode(inputAsString)
    end
end
function LearningSession.prototype.updateGame(self, playingState)
    self.inChannel:push(
        json.encode(playingState)
    )
end
function LearningSession.prototype.keypressed(self, key)
    if key == "escape" then
        Application.popState()
    end
end
function LearningSession.prototype.getName(self)
    return "LearningSession"
end
function LearningSession.prototype.enter(self)
    self.thread:start()
end
function LearningSession.prototype.leave(self)
    self.thread:wait()
end
return ____exports
