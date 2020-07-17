--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 1});
local ____exports = {}
function ____exports.updateSmoothValue(currentValue, targetValue, rate, dt)
    return currentValue + (((targetValue - currentValue) * rate) * dt)
end
return ____exports
