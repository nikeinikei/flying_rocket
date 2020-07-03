--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 3,["8"] = 4,["9"] = 6,["10"] = 2,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 14,["17"] = 8,["18"] = 16,["19"] = 17,["20"] = 18,["21"] = 20,["22"] = 16,["23"] = 23,["24"] = 25,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 29,["29"] = 30,["30"] = 31,["32"] = 33,["35"] = 36,["38"] = 41,["39"] = 42,["40"] = 42,["41"] = 42,["42"] = 42,["44"] = 45,["45"] = 46,["46"] = 47,["47"] = 48,["49"] = 50,["50"] = 50,["51"] = 51,["52"] = 52,["53"] = 53,["54"] = 54,["55"] = 54,["56"] = 54,["58"] = 56,["59"] = 57,["61"] = 59,["62"] = 59,["63"] = 59,["66"] = 50,["69"] = 63,["71"] = 65,["73"] = 25});
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
function ____exports.fixData(data)
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
return ____exports
