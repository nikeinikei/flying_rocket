--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 14,["12"] = 49,["13"] = 50,["14"] = 52,["15"] = 54,["16"] = 54,["17"] = 55,["18"] = 56,["19"] = 57,["21"] = 59,["23"] = 54,["24"] = 63,["25"] = 65,["26"] = 67,["27"] = 69,["28"] = 70,["29"] = 72,["30"] = 74,["31"] = 75,["32"] = 49,["33"] = 14,["34"] = 15,["35"] = 17,["36"] = 19,["37"] = 20,["38"] = 21,["40"] = 19,["41"] = 25,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 27,["46"] = 27,["47"] = 27,["48"] = 28,["49"] = 29,["51"] = 31,["54"] = 34,["56"] = 37,["57"] = 38,["58"] = 39,["59"] = 40,["62"] = 44,["63"] = 45,["65"] = 25,["67"] = 78,["69"] = 78,["70"] = 80,["71"] = 81,["72"] = 79,["73"] = 78,["74"] = 85,["75"] = 87,["76"] = 88,["77"] = 84,["78"] = 78,["79"] = 92,["80"] = 93,["81"] = 91,["82"] = 78,["83"] = 97,["84"] = 98,["85"] = 99,["87"] = 102,["88"] = 103,["89"] = 104,["91"] = 107,["92"] = 108,["93"] = 109,["95"] = 112,["96"] = 113,["97"] = 114,["99"] = 117,["100"] = 118,["101"] = 119,["102"] = 96});
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
local isInit = false
local function assertInit()
    if not isInit then
        error("campaign levels are not initialized, CampaignLevels.init() has to be called in love.load before pushing the first state")
    end
end
local function internal_init()
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
        if not res then
            error("campaign levels are corrupt, please message the developer.")
        end
    end
    if Settings.isDevelopment() then
        save()
    end
end
____exports.CampaignLevels = {}
local CampaignLevels = ____exports.CampaignLevels
do
    function CampaignLevels.init()
        internal_init()
        isInit = true
    end
    function CampaignLevels.addLevel(level)
        assertInit()
        levels[level.name] = level
        save()
    end
    function CampaignLevels.getLevels()
        assertInit()
        return levels
    end
    function CampaignLevels.importLevelFromFile(file)
        assertInit()
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
return ____exports
