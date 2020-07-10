--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 4,["12"] = 4,["13"] = 10,["14"] = 10,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 11,["20"] = 11,["21"] = 8,["22"] = 17,["23"] = 18,["24"] = 17,["25"] = 21,["26"] = 22,["27"] = 23,["29"] = 21,["30"] = 27,["31"] = 28,["32"] = 27});
local ____exports = {}
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
____exports.Lost = __TS__Class()
local Lost = ____exports.Lost
Lost.name = "Lost"
__TS__ClassExtends(Lost, GameState)
function Lost.prototype.____constructor(self)
    GameState.prototype.____constructor(self)
    self.text = love.graphics.newText(
        love.graphics.newFont(40),
        "You lost"
    )
    self.textPosition = {
        x = (love.graphics.getWidth() - self.text:getWidth()) / 2,
        y = (love.graphics.getHeight() - self.text:getHeight()) / 2
    }
end
function Lost.prototype.getName(self)
    return "Lost"
end
function Lost.prototype.keypressed(self, key)
    if key == "escape" then
        Application.popState()
    end
end
function Lost.prototype.draw(self)
    love.graphics.draw(self.text, self.textPosition.x, self.textPosition.y)
end
return ____exports
