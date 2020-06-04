--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 3,["8"] = 4,["9"] = 6,["10"] = 2,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 14,["17"] = 8,["18"] = 21,["19"] = 23,["20"] = 24,["21"] = 25,["22"] = 26,["23"] = 27,["24"] = 28,["25"] = 29,["27"] = 31,["30"] = 34,["33"] = 38,["34"] = 39,["35"] = 40,["36"] = 41,["38"] = 43,["39"] = 43,["40"] = 44,["41"] = 45,["42"] = 46,["43"] = 47,["44"] = 47,["45"] = 47,["47"] = 49,["48"] = 50,["50"] = 52,["51"] = 52,["52"] = 52,["55"] = 43,["58"] = 56,["60"] = 58,["62"] = 23});
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
