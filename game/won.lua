--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 7,["6"] = 7,["7"] = 7,["8"] = 14,["9"] = 15,["10"] = 15,["11"] = 15,["12"] = 15,["13"] = 16,["14"] = 16,["15"] = 16,["16"] = 16,["17"] = 20,["18"] = 21,["19"] = 21,["20"] = 21,["21"] = 21,["22"] = 22,["23"] = 22,["24"] = 22,["25"] = 22,["26"] = 14,["27"] = 28,["28"] = 29,["29"] = 28,["30"] = 32,["31"] = 33,["32"] = 34,["34"] = 32,["35"] = 38,["36"] = 39,["37"] = 40,["38"] = 38});
local ____exports = {}
____exports.Won = __TS__Class()
local Won = ____exports.Won
Won.name = "Won"
function Won.prototype.____constructor(self, metrics)
    self.text = love.graphics.newText(
        love.graphics.newFont(40),
        "Congratulations, you won!"
    )
    self.textPosition = {
        x = (love.graphics.getWidth() - self.text:getWidth()) / 2,
        y = (love.graphics.getHeight() - self.text:getHeight()) / 2
    }
    self.metrics = metrics
    self.timeTakenText = love.graphics.newText(
        love.graphics.newFont(40),
        tostring(self.metrics.timeTaken)
    )
    self.timeTakenTextPosition = {
        x = (love.graphics.getWidth() - self.timeTakenText:getWidth()) / 2,
        y = self.textPosition.y + 40
    }
end
function Won.prototype.getName(self)
    return "Won"
end
function Won.prototype.keypressed(self, key)
    if key == "escape" then
        Application.popState()
    end
end
function Won.prototype.draw(self)
    love.graphics.draw(self.text, self.textPosition.x, self.textPosition.y)
    love.graphics.draw(self.timeTakenText, self.timeTakenTextPosition.x, self.timeTakenTextPosition.y)
end
return ____exports
