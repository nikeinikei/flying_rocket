--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 3,["9"] = 8,["10"] = 8,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 9,["16"] = 9,["17"] = 7,["18"] = 15,["19"] = 16,["20"] = 15,["21"] = 19,["22"] = 20,["23"] = 21,["25"] = 19,["26"] = 25,["27"] = 26,["28"] = 25});
local ____exports = {}
____exports.Lost = __TS__Class()
local Lost = ____exports.Lost
Lost.name = "Lost"
function Lost.prototype.____constructor(self)
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
