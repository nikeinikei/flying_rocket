--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 5,["10"] = 6,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["15"] = 12,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 14,["20"] = 15,["21"] = 13,["22"] = 13,["24"] = 18,["27"] = 21,["29"] = 8,["31"] = 25,["33"] = 25,["34"] = 27,["35"] = 27,["36"] = 27,["37"] = 27,["38"] = 26,["39"] = 25,["40"] = 31,["41"] = 25,["42"] = 30,["43"] = 25,["44"] = 36,["45"] = 36,["46"] = 36,["47"] = 36,["48"] = 25,["49"] = 35,["50"] = 25,["51"] = 41,["52"] = 42,["53"] = 43,["56"] = 46,["57"] = 40,["58"] = 25,["59"] = 50,["60"] = 49,["61"] = 25,["62"] = 54,["63"] = 55,["64"] = 57,["65"] = 58,["66"] = 59,["67"] = 60,["68"] = 62,["70"] = 65,["71"] = 66,["72"] = 53,["73"] = 25,["74"] = 70,["75"] = 71,["76"] = 72,["78"] = 75,["79"] = 76,["80"] = 77,["82"] = 80,["83"] = 82,["84"] = 69,["86"] = 86,["87"] = 87});
local ____exports = {}
local ____datafixer = require("datafixer")
local DataFixer = ____datafixer.DataFixer
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
                function(____, level)
                    local res = DataFixer.fixData(level)
                    return (res == nil) or (res == true)
                end
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
