--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 14,["12"] = 38,["13"] = 39,["14"] = 41,["15"] = 43,["16"] = 43,["17"] = 44,["18"] = 45,["19"] = 46,["21"] = 48,["23"] = 43,["24"] = 52,["25"] = 54,["26"] = 56,["27"] = 58,["28"] = 59,["29"] = 61,["30"] = 63,["31"] = 64,["32"] = 38,["33"] = 14,["34"] = 15,["35"] = 17,["36"] = 18,["37"] = 18,["38"] = 18,["39"] = 19,["40"] = 19,["41"] = 19,["42"] = 20,["43"] = 21,["45"] = 23,["48"] = 26,["50"] = 29,["51"] = 30,["53"] = 33,["54"] = 34,["56"] = 17,["58"] = 67,["60"] = 67,["61"] = 69,["62"] = 70,["63"] = 68,["64"] = 67,["65"] = 74,["66"] = 73,["67"] = 67,["68"] = 78,["69"] = 79,["71"] = 82,["72"] = 83,["73"] = 84,["75"] = 87,["76"] = 88,["77"] = 89,["79"] = 92,["80"] = 93,["81"] = 94,["83"] = 97,["84"] = 98,["85"] = 99,["86"] = 77,["88"] = 103});
local ____exports = {}
local ____json = require("json")
local json = ____json.json
local ____settings = require("settings")
local Settings = ____settings.Settings
local ____datafixer = require("datafixer")
local DataFixer = ____datafixer.DataFixer
local fileName, levels, save
function save()
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
fileName = "campaignLevels.json"
levels = {}
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
    for k, v in pairs(levels) do
        local res = DataFixer.fixData(v)
    end
    if Settings.isDevelopment() then
        save()
    end
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
        if not DataFixer.fixData(level) then
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
