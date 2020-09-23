--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 9,["7"] = 10,["8"] = 9,["9"] = 22,["10"] = 23,["11"] = 23,["12"] = 25,["13"] = 25,["14"] = 23,["15"] = 23,["16"] = 22,["17"] = 29,["18"] = 30,["19"] = 31,["20"] = 32,["21"] = 32,["22"] = 32,["23"] = 32,["25"] = 34,["26"] = 29,["27"] = 47,["28"] = 48,["29"] = 47,["30"] = 56,["31"] = 57,["32"] = 58,["33"] = 59,["34"] = 59,["35"] = 59,["36"] = 59,["37"] = 59,["38"] = 59,["40"] = 61,["41"] = 56,["42"] = 64,["43"] = 65,["44"] = 66,["45"] = 67,["46"] = 67,["47"] = 67,["48"] = 67,["50"] = 69,["51"] = 64,["52"] = 72,["53"] = 73,["54"] = 73,["55"] = 73,["56"] = 73,["57"] = 73,["58"] = 73,["59"] = 73,["60"] = 73,["61"] = 73,["62"] = 72,["63"] = 84,["64"] = 85,["65"] = 84});
local ____exports = {}
local currentDataVersion = "0.0.4"
local function copyGroundTerrainColor(color)
    return {r = color.r, g = color.g, b = color.b}
end
local function copyGroundTerrain(groundTerrain)
    return {
        color = copyGroundTerrainColor(groundTerrain.color),
        points = {
            unpack(groundTerrain.points)
        }
    }
end
local function copyGroundTerrains(groundTerrains)
    local copy = {}
    for ____, terrain in ipairs(groundTerrains) do
        __TS__ArrayPush(
            copy,
            copyGroundTerrain(terrain)
        )
    end
    return copy
end
local function copyRectangle(rect)
    return {x = rect.x, y = rect.y, w = rect.w, h = rect.h}
end
local function copyTerrainPoints(terrainPoints)
    local copy = {}
    for ____, terrain in ipairs(terrainPoints) do
        __TS__ArrayPush(
            copy,
            {
                unpack(terrain)
            }
        )
    end
    return copy
end
local function copyRefuelStations(rectangles)
    local copy = {}
    for ____, rect in ipairs(rectangles) do
        __TS__ArrayPush(
            copy,
            copyRectangle(rect)
        )
    end
    return copy
end
function ____exports.copyLevel(level)
    return {
        dataVersion = level.dataVersion,
        name = level.name,
        terrainPoints = copyTerrainPoints(level.terrainPoints),
        rocketLandingLocation = (level.rocketLandingLocation and copyRectangle(level.rocketLandingLocation)) or nil,
        rocketStartingLocation = (level.rocketStartingLocation and copyRectangle(level.rocketStartingLocation)) or nil,
        groundTerrain = copyGroundTerrains(level.groundTerrain),
        refuelStations = copyRefuelStations(level.refuelStations)
    }
end
function ____exports.newLevel(name)
    return {dataVersion = currentDataVersion, name = name, rocketLandingLocation = nil, rocketStartingLocation = nil, terrainPoints = {}, groundTerrain = {}, refuelStations = {}}
end
return ____exports
