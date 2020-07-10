--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 9,["8"] = 9,["9"] = 9,["10"] = 9,["11"] = 16,["12"] = 9,["13"] = 18,["14"] = 18,["15"] = 18,["16"] = 18,["17"] = 19,["18"] = 19,["19"] = 19,["20"] = 19,["21"] = 23,["22"] = 24,["23"] = 24,["24"] = 24,["25"] = 24,["26"] = 25,["27"] = 25,["28"] = 25,["29"] = 25,["30"] = 16,["31"] = 31,["32"] = 32,["33"] = 31,["34"] = 35,["35"] = 36,["36"] = 37,["38"] = 35,["39"] = 41,["40"] = 42,["41"] = 43,["42"] = 41});
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
