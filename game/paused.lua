--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 5,["6"] = 5,["7"] = 5,["8"] = 9,["9"] = 10,["10"] = 11,["11"] = 9,["12"] = 14,["13"] = 15,["14"] = 14,["15"] = 18,["16"] = 19,["17"] = 20,["18"] = 18,["19"] = 23,["20"] = 24,["21"] = 25,["23"] = 23,["24"] = 29,["25"] = 30,["26"] = 31,["27"] = 32,["28"] = 33,["29"] = 34,["30"] = 35,["31"] = 35,["32"] = 35,["33"] = 35,["34"] = 35,["35"] = 35,["36"] = 35,["37"] = 29});
local ____exports = {}
____exports.Paused = __TS__Class()
local Paused = ____exports.Paused
Paused.name = "Paused"
function Paused.prototype.____constructor(self, playing, onUnpaused)
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
