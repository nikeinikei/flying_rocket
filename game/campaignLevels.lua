--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 12,["8"] = 13,["9"] = 15,["10"] = 16,["11"] = 16,["12"] = 16,["13"] = 17,["14"] = 17,["15"] = 17,["16"] = 18,["17"] = 19,["19"] = 21,["22"] = 24,["24"] = 15,["25"] = 28,["26"] = 29,["27"] = 31,["28"] = 33,["29"] = 33,["30"] = 34,["31"] = 35,["32"] = 36,["34"] = 38,["36"] = 33,["37"] = 42,["38"] = 44,["39"] = 46,["40"] = 48,["41"] = 49,["42"] = 51,["43"] = 53,["44"] = 54,["45"] = 28,["47"] = 57,["49"] = 57,["50"] = 59,["51"] = 60,["52"] = 58,["53"] = 57,["54"] = 64,["55"] = 63,["57"] = 68});
local ____exports = {}
local ____json = require("json")
local json = ____json.json
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
end
init()
return ____exports
