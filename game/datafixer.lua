--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 3,["8"] = 4,["9"] = 6,["10"] = 2,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 14,["17"] = 8,["18"] = 17,["19"] = 19,["20"] = 20,["21"] = 21,["22"] = 22,["23"] = 23,["24"] = 24,["25"] = 25,["27"] = 27,["30"] = 30,["33"] = 35,["34"] = 36,["35"] = 36,["36"] = 36,["37"] = 36,["39"] = 39,["40"] = 40,["41"] = 41,["42"] = 42,["44"] = 44,["45"] = 44,["46"] = 45,["47"] = 46,["48"] = 47,["49"] = 48,["50"] = 48,["51"] = 48,["53"] = 50,["54"] = 51,["56"] = 53,["57"] = 53,["58"] = 53,["61"] = 44,["64"] = 57,["66"] = 59,["68"] = 19});
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
local versionHistory = {"0.0.1", "0.0.2"}
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
