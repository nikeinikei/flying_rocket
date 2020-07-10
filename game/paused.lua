--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 6,["8"] = 6,["9"] = 6,["10"] = 6,["11"] = 10,["12"] = 6,["13"] = 12,["14"] = 13,["15"] = 10,["16"] = 16,["17"] = 17,["18"] = 16,["19"] = 20,["20"] = 21,["21"] = 22,["22"] = 20,["23"] = 25,["24"] = 26,["25"] = 27,["27"] = 25,["28"] = 31,["29"] = 32,["30"] = 33,["31"] = 34,["32"] = 35,["33"] = 36,["34"] = 37,["35"] = 37,["36"] = 37,["37"] = 37,["38"] = 37,["39"] = 37,["40"] = 37,["41"] = 31});
local ____exports = {}
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
____exports.Paused = __TS__Class()
local Paused = ____exports.Paused
Paused.name = "Paused"
__TS__ClassExtends(Paused, GameState)
function Paused.prototype.____constructor(self, playing, onUnpaused)
    GameState.prototype.____constructor(self)
    self.playing = playing
    self.onUnpaused = onUnpaused
end
function Paused.prototype.getName(self)
    return "Paused"
end
function Paused.prototype.resume(self)
    Application.popState()
    self.onUnpaused()
end
function Paused.prototype.keypressed(self, key)
    if key == "escape" then
        self:resume()
    end
end
function Paused.prototype.draw(self)
    love.graphics.setColor(1, 1, 1, 1)
    self.playing:draw()
    local grey = 0.8
    love.graphics.setColor(grey, grey, grey, grey)
    love.graphics.origin()
    love.graphics.rectangle(
        "fill",
        0,
        0,
        love.graphics.getWidth(),
        love.graphics.getHeight()
    )
end
return ____exports
