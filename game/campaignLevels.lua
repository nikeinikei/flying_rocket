--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 4,["11"] = 14,["12"] = 51,["13"] = 52,["14"] = 54,["15"] = 54,["16"] = 55,["17"] = 56,["18"] = 57,["20"] = 59,["22"] = 54,["23"] = 63,["24"] = 63,["25"] = 63,["26"] = 64,["27"] = 64,["28"] = 64,["29"] = 51,["30"] = 14,["31"] = 15,["32"] = 17,["33"] = 19,["34"] = 20,["35"] = 21,["37"] = 19,["38"] = 27,["39"] = 28,["40"] = 28,["41"] = 28,["42"] = 29,["43"] = 29,["44"] = 29,["45"] = 30,["46"] = 31,["48"] = 33,["51"] = 36,["53"] = 39,["54"] = 40,["55"] = 41,["56"] = 42,["59"] = 46,["60"] = 47,["62"] = 27,["64"] = 67,["66"] = 67,["67"] = 69,["68"] = 70,["69"] = 68,["70"] = 67,["71"] = 74,["72"] = 76,["73"] = 77,["74"] = 73,["75"] = 67,["76"] = 81,["77"] = 82,["78"] = 80,["79"] = 67,["80"] = 86,["81"] = 87,["82"] = 88,["84"] = 91,["85"] = 92,["86"] = 93,["88"] = 96,["89"] = 97,["90"] = 98,["92"] = 101,["93"] = 102,["94"] = 103,["96"] = 106,["97"] = 107,["98"] = 108,["99"] = 85});
local ____exports = {}
local ____datafixer = require("datafixer")
local DataFixer = ____datafixer.DataFixer
local ____json = require("json")
local json = ____json.json
local ____settings = require("settings")
local Settings = ____settings.Settings
local fileName, levels, save
function save()
    local jsonified = json.encode(levels)
    local writeLevelsToFile
    writeLevelsToFile = function(path)
        local file = io.open(path, "w")
        if file then
            file:write(jsonified)
        else
            error("file doesn't exist")
        end
    end
    writeLevelsToFile(
        "res/" .. tostring(fileName)
    )
    writeLevelsToFile(
        "game/res/" .. tostring(fileName)
    )
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
