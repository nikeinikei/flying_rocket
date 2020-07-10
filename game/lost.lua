--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 5,["8"] = 5,["9"] = 5,["10"] = 5,["12"] = 5,["13"] = 11,["14"] = 11,["15"] = 11,["16"] = 11,["17"] = 12,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 9,["22"] = 18,["23"] = 19,["24"] = 18,["25"] = 22,["26"] = 23,["27"] = 24,["29"] = 22,["30"] = 28,["31"] = 29,["32"] = 28});
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
