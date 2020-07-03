--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 5,["10"] = 6,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 13,["21"] = 15,["24"] = 18,["26"] = 8,["28"] = 22,["30"] = 22,["31"] = 24,["32"] = 24,["33"] = 24,["34"] = 24,["35"] = 23,["36"] = 22,["37"] = 28,["38"] = 22,["39"] = 27,["40"] = 22,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 33,["45"] = 22,["46"] = 32,["47"] = 22,["48"] = 38,["49"] = 39,["50"] = 40,["53"] = 43,["54"] = 37,["55"] = 22,["56"] = 47,["57"] = 46,["58"] = 22,["59"] = 51,["60"] = 52,["61"] = 54,["62"] = 55,["63"] = 56,["64"] = 57,["65"] = 59,["67"] = 62,["68"] = 63,["69"] = 50,["70"] = 22,["71"] = 67,["72"] = 68,["73"] = 69,["75"] = 72,["76"] = 73,["77"] = 74,["79"] = 77,["80"] = 79,["81"] = 66,["83"] = 83,["84"] = 84});
local ____exports = {}
local ____json = require("json")
local json = ____json.json
local ____datafixer = require("datafixer")
local DataFixer = ____datafixer.DataFixer
local fileName = "levels.json"
local levels
local function init()
    if love.filesystem.getInfo(fileName) then
        local contents, _size = love.filesystem.read(fileName)
        if contents then
            levels = json.decode(contents)
            levels = __TS__ArrayFilter(
                levels,
                function(____, level) return DataFixer.fixData(level) end
            )
        else
            levels = {}
        end
    else
        levels = {}
    end
end
____exports.Levels = {}
local Levels = ____exports.Levels
do
    function Levels.save()
        love.filesystem.write(
            fileName,
            json.encode(levels)
        )
    end
    function Levels.addLevel(level)
        __TS__ArrayPush(levels, level)
        Levels.save()
    end
    function Levels.removeLevel(level)
        levels = __TS__ArrayFilter(
            levels,
            function(____, l) return l ~= level end
        )
        Levels.save()
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
        if not DataFixer.fixData(level) then
            return false
        end
        table.insert(levels, level)
        return true
    end
end
init()
____exports.Levels.save()
return ____exports
