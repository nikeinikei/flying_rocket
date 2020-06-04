--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 5,["10"] = 6,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 13,["21"] = 15,["24"] = 18,["26"] = 8,["27"] = 22,["28"] = 23,["29"] = 23,["30"] = 23,["31"] = 23,["32"] = 22,["33"] = 26,["34"] = 27,["36"] = 29,["38"] = 29,["39"] = 31,["40"] = 32,["41"] = 30,["42"] = 29,["43"] = 36,["44"] = 36,["45"] = 36,["46"] = 36,["47"] = 37,["48"] = 35,["49"] = 29,["50"] = 41,["51"] = 42,["52"] = 43,["55"] = 46,["56"] = 40,["57"] = 29,["58"] = 50,["59"] = 49,["60"] = 29,["61"] = 54,["62"] = 55,["63"] = 57,["64"] = 58,["65"] = 59,["66"] = 60,["67"] = 62,["69"] = 65,["70"] = 66,["71"] = 53,["72"] = 29,["73"] = 70,["74"] = 71,["75"] = 72,["77"] = 75,["78"] = 76,["79"] = 77,["81"] = 80,["82"] = 82,["83"] = 69});
local ____exports = {}
local ____datafixer = require("datafixer")
local fixData = ____datafixer.fixData
local ____json = require("json")
local json = ____json.json
local fileName = "levels.json"
local levels
local function init()
    if love.filesystem.getInfo(fileName) then
        local contents, _size = love.filesystem.read(fileName)
        if contents then
            levels = json.decode(contents)
            levels = __TS__ArrayFilter(
                levels,
                function(____, level) return fixData(level) end
            )
        else
            levels = {}
        end
    else
        levels = {}
    end
end
local function save()
    love.filesystem.write(
        fileName,
        json.encode(levels)
    )
end
init()
save()
____exports.Levels = {}
local Levels = ____exports.Levels
do
    function Levels.addLevel(level)
        __TS__ArrayPush(levels, level)
        save()
    end
    function Levels.removeLevel(level)
        levels = __TS__ArrayFilter(
            levels,
            function(____, l) return l ~= level end
        )
        save()
    end
    function Levels.nameUsed(name)
        for ____, level in ipairs(levels) do
            if level.name == name then
                return true
            end
        end
        return false
    end
    function Levels.getLevels()
        return levels
    end
    function Levels.exportLevel(level)
        local jsonified = json.encode(level)
        local levelName = level.name
        local fileName = tostring(levelName) .. ".json"
        local counter = 1
        while love.filesystem.getInfo(fileName) do
            fileName = ((tostring(levelName) .. "(") .. tostring(counter)) .. ").json"
            counter = counter + 1
        end
        love.filesystem.write(fileName, jsonified)
        return fileName
    end
    function Levels.importLevelFromFile(file)
        local contents, _size = file:read()
        if not contents then
            return false
        end
        local level = json.decode(contents)
        if not fixData(level) then
            return false
        end
        table.insert(levels, level)
        return true
    end
end
return ____exports
