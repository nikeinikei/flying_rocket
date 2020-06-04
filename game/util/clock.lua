--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 3,["9"] = 8,["10"] = 9,["11"] = 7,["12"] = 12,["13"] = 13,["14"] = 12,["15"] = 16,["16"] = 17,["17"] = 18,["19"] = 20,["21"] = 16,["22"] = 24,["23"] = 25,["24"] = 26,["25"] = 27,["26"] = 24,["27"] = 30,["28"] = 31,["29"] = 32,["30"] = 33,["31"] = 30});
local ____exports = {}
____exports.Clock = __TS__Class()
local Clock = ____exports.Clock
Clock.name = "Clock"
function Clock.prototype.____constructor(self)
    self.startTime = love.timer.getTime()
    self.pauseTime = nil
end
function Clock.prototype.pause(self)
    self.pauseTime = love.timer.getTime()
end
function Clock.prototype.getElapsed(self)
    if self.pauseTime then
        return self.pauseTime - self.startTime
    else
        return love.timer.getTime() - self.startTime
    end
end
function Clock.prototype.resume(self)
    local elapsed = self:getElapsed()
    self.startTime = love.timer.getTime() - elapsed
    self.pauseTime = nil
end
function Clock.prototype.restart(self)
    local elapsed = self:getElapsed()
    self.startTime = love.timer.getTime()
    return elapsed
end
return ____exports
