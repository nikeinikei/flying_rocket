--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 4,["11"] = 14,["12"] = 15,["13"] = 17,["14"] = 18,["15"] = 18,["16"] = 18,["17"] = 19,["18"] = 19,["19"] = 19,["20"] = 20,["21"] = 21,["23"] = 23,["26"] = 26,["28"] = 17,["29"] = 30,["30"] = 31,["31"] = 33,["32"] = 35,["33"] = 35,["34"] = 36,["35"] = 37,["36"] = 38,["37"] = 39,["39"] = 41,["41"] = 35,["42"] = 45,["43"] = 47,["44"] = 49,["45"] = 51,["46"] = 52,["47"] = 54,["48"] = 56,["49"] = 57,["50"] = 30,["52"] = 60,["54"] = 60,["55"] = 62,["56"] = 63,["57"] = 61,["58"] = 60,["59"] = 67,["60"] = 66,["61"] = 60,["62"] = 71,["63"] = 72,["65"] = 75,["66"] = 76,["67"] = 77,["69"] = 80,["70"] = 81,["71"] = 82,["73"] = 85,["74"] = 86,["75"] = 87,["77"] = 90,["78"] = 91,["79"] = 92,["80"] = 70,["82"] = 96});
local ____exports = {}
local ____datafixer = require("datafixer")
local fixData = ____datafixer.fixData
local ____json = require("json")
local json = ____json.json
local ____settings = require("settings")
local Settings = ____settings.Settings
local fileName = "campaignLevels.json"
local levels = {}
local function init()
    if love.filesystem.getInfo(
        "res/" .. tostring(fileName)
    ) then
        local contents, _size = love.filesystem.read(
            "res/" .. tostring(fileName)
        )
        if contents then
            levels = json.decode(contents)
        else
            error("this shouldn't happen")
        end
    else
        error("no campaign levels found. Is the game corrupted?")
    end
end
local function save()
    local jsonified = json.encode(levels)
    local lfs = require("lfs")
    local writeLevelsToFile
    writeLevelsToFile = function()
        local file = io.open(fileName, "w")
        if file then
            file:write(jsonified)
            file:close()
        else
            error("file doesn't exist")
        end
    end
    lfs.chdir("res")
    writeLevelsToFile()
    lfs.chdir("..")
    lfs.chdir("game")
    lfs.chdir("res")
    writeLevelsToFile()
    lfs.chdir("..")
    lfs.chdir("..")
end
____exports.CampaignLevels = {}
local CampaignLevels = ____exports.CampaignLevels
do
    function CampaignLevels.addLevel(level)
        levels[level.name] = level
        save()
    end
    function CampaignLevels.getLevels()
        return levels
    end
    function CampaignLevels.importLevelFromFile(file)
        if not Settings.isDevelopment() then
            return nil
        end
        local contents, _size = file:read()
        if not contents then
            return nil
        end
        local level = json.decode(contents)
        if not fixData(level) then
            return nil
        end
        local asNumber = tonumber(level.name)
        if not asNumber then
            return nil
        end
        levels[level.name] = level
        save()
        return asNumber
    end
end
init()
return ____exports