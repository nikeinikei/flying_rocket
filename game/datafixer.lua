--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 3,["8"] = 4,["9"] = 6,["10"] = 2,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 14,["17"] = 8,["18"] = 16,["19"] = 17,["20"] = 18,["21"] = 20,["22"] = 16,["23"] = 22,["24"] = 23,["25"] = 24,["26"] = 26,["27"] = 22,["28"] = 29,["30"] = 31,["32"] = 31,["33"] = 33,["34"] = 34,["35"] = 35,["36"] = 36,["37"] = 37,["38"] = 38,["40"] = 40,["43"] = 43,["46"] = 48,["47"] = 49,["48"] = 49,["49"] = 49,["50"] = 49,["52"] = 52,["53"] = 53,["54"] = 54,["55"] = 55,["57"] = 57,["58"] = 57,["59"] = 58,["60"] = 59,["61"] = 60,["62"] = 61,["63"] = 61,["64"] = 61,["66"] = 63,["67"] = 64,["69"] = 66,["70"] = 66,["71"] = 66,["74"] = 57,["77"] = 70,["79"] = 72,["81"] = 32});
local ____exports = {}
local fixers = {}
fixers["->0.0.1"] = function(data)
    data.dataVersion = "0.0.1"
    data.terrainPoints = data.terrainPoints._items
    return true
end
fixers["0.0.1->0.0.2"] = function(data)
    data.dataVersion = "0.0.2"
    local points = data.terrainPoints
    local newTerrainPoints = {points}
    data.terrainPoints = newTerrainPoints
    return true
end
fixers["0.0.2->0.0.3"] = function(data)
    data.dataVersion = "0.0.3"
    data.refuelStations = {}
    return true
end
fixers["0.0.3->0.0.4"] = function(data)
    data.dataVersion = "0.0.4"
    data.groundTerrain = {}
    return true
end
local versionHistory = {"0.0.1", "0.0.2", "0.0.3", "0.0.4"}
____exports.DataFixer = {}
local DataFixer = ____exports.DataFixer
do
    function DataFixer.fixData(data)
        if data.dataVersion == nil then
            local fixer = fixers["->0.0.1"]
            if fixer then
                local success = fixer(data)
                if not success then
                    return false
                else
                    print("[data fixer] successful transformation, no undefined->0.0.1")
                end
            else
                return false
            end
        end
        if data.dataVersion == "0.0.2" then
            data.terrainPoints = __TS__ArrayFilter(
                data.terrainPoints,
                function(____, terrain) return #terrain >= 4 end
            )
        end
        local currentVersion = versionHistory[#versionHistory]
        if data.dataVersion ~= currentVersion then
            local oldDataVersionIndex = __TS__ArrayIndexOf(versionHistory, data.dataVersion)
            local currentDataVersionIndex = __TS__ArrayIndexOf(versionHistory, currentVersion)
            do
                local i = oldDataVersionIndex
                while i < currentDataVersionIndex do
                    local fixerKey = (tostring(versionHistory[i + 1]) .. "->") .. tostring(versionHistory[(i + 1) + 1])
                    local fixer = fixers[fixerKey]
                    if not fixer then
                        error(
                            "fixer not found for " .. tostring(fixerKey)
                        )
                    else
                        if not fixer(data) then
                            return false
                        else
                            print(
                                "[data fixer] successful transformation, " .. tostring(fixerKey)
                            )
                        end
                    end
                    i = i + 1
                end
            end
            return true
        else
            return nil
        end
    end
end
return ____exports
