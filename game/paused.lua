--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 5,["6"] = 5,["7"] = 5,["8"] = 9,["9"] = 10,["10"] = 11,["11"] = 9,["12"] = 14,["13"] = 15,["14"] = 16,["15"] = 14,["16"] = 19,["17"] = 20,["18"] = 21,["20"] = 19,["21"] = 25,["22"] = 26,["23"] = 27,["24"] = 28,["25"] = 29,["26"] = 30,["27"] = 31,["28"] = 31,["29"] = 31,["30"] = 31,["31"] = 31,["32"] = 31,["33"] = 31,["34"] = 25});
local ____exports = {}
____exports.Paused = __TS__Class()
local Paused = ____exports.Paused
Paused.name = "Paused"
function Paused.prototype.____constructor(self, playing, onUnpaused)
    self.playing = playing
    self.onUnpaused = onUnpaused
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
