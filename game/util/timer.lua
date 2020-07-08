--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 3,["10"] = 7,["11"] = 8,["12"] = 9,["13"] = 7,["14"] = 12,["15"] = 12});
local ____exports = {}
local ____clock = require("util.clock")
local Clock = ____clock.Clock
____exports.Timer = __TS__Class()
local Timer = ____exports.Timer
Timer.name = "Timer"
function Timer.prototype.____constructor(self, time)
    self.clock = __TS__New(Clock)
    self.time = time
end
function Timer.prototype.update(self, dt)
end
return ____exports
