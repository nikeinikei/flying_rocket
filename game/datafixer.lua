--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 3,["8"] = 4,["9"] = 6,["10"] = 2,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 14,["17"] = 8,["18"] = 16,["19"] = 17,["20"] = 18,["21"] = 20,["22"] = 16,["23"] = 23,["25"] = 25,["27"] = 25,["28"] = 27,["29"] = 28,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 32,["35"] = 34,["38"] = 37,["41"] = 42,["42"] = 43,["43"] = 43,["44"] = 43,["45"] = 43,["47"] = 46,["48"] = 47,["49"] = 48,["50"] = 49,["52"] = 51,["53"] = 51,["54"] = 52,["55"] = 53,["56"] = 54,["57"] = 55,["58"] = 55,["59"] = 55,["61"] = 57,["62"] = 58,["64"] = 60,["65"] = 60,["66"] = 60,["69"] = 51,["72"] = 64,["74"] = 66,["76"] = 26});
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
local versionHistory = {"0.0.1", "0.0.2", "0.0.3"}
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
            return true
        end
    end
end
return ____exports
