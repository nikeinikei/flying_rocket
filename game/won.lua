--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 8,["8"] = 8,["9"] = 8,["10"] = 8,["11"] = 15,["12"] = 8,["13"] = 17,["14"] = 17,["15"] = 17,["16"] = 17,["17"] = 18,["18"] = 18,["19"] = 18,["20"] = 18,["21"] = 22,["22"] = 23,["23"] = 23,["24"] = 23,["25"] = 23,["26"] = 24,["27"] = 24,["28"] = 24,["29"] = 24,["30"] = 15,["31"] = 30,["32"] = 31,["33"] = 30,["34"] = 34,["35"] = 35,["36"] = 36,["38"] = 34,["39"] = 40,["40"] = 41,["41"] = 42,["42"] = 40});
local ____exports = {}
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
____exports.Won = __TS__Class()
local Won = ____exports.Won
Won.name = "Won"
__TS__ClassExtends(Won, GameState)
function Won.prototype.____constructor(self, metrics)
    GameState.prototype.____constructor(self)
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
