--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 12,["7"] = 13,["8"] = 12});
local ____exports = {}
local currentDataVersion = "0.0.3"
function ____exports.newLevel(name)
    return {dataVersion = currentDataVersion, name = name, rocketLandingLocation = nil, rocketStartingLocation = nil, terrainPoints = {}, refuelStations = {}}
end
return ____exports
