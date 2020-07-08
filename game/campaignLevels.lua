--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 4,["11"] = 6,["12"] = 47,["13"] = 48,["14"] = 50,["15"] = 50,["16"] = 51,["17"] = 52,["18"] = 53,["20"] = 55,["22"] = 50,["23"] = 59,["24"] = 59,["25"] = 59,["26"] = 60,["27"] = 60,["28"] = 60,["29"] = 47,["30"] = 6,["31"] = 7,["32"] = 9,["33"] = 11,["34"] = 12,["35"] = 13,["37"] = 11,["38"] = 19,["39"] = 20,["40"] = 20,["41"] = 20,["42"] = 21,["43"] = 21,["44"] = 21,["45"] = 22,["46"] = 23,["48"] = 25,["51"] = 28,["53"] = 31,["54"] = 32,["55"] = 33,["56"] = 34,["57"] = 35,["59"] = 37,["60"] = 38,["63"] = 42,["64"] = 43,["66"] = 19,["68"] = 63,["70"] = 63,["71"] = 65,["72"] = 66,["73"] = 64,["74"] = 63,["75"] = 70,["76"] = 72,["77"] = 73,["78"] = 69,["79"] = 63,["80"] = 77,["81"] = 78,["82"] = 76,["83"] = 63,["84"] = 82,["85"] = 83,["86"] = 84,["88"] = 87,["89"] = 88,["90"] = 89,["92"] = 92,["93"] = 93,["94"] = 94,["96"] = 97,["97"] = 98,["98"] = 99,["100"] = 102,["101"] = 103,["102"] = 104,["103"] = 81});
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
    local changed = false
    for k, v in pairs(levels) do
        local res = DataFixer.fixData(v)
        if res ~= nil then
            changed = true
        end
        if not res then
            error("campaign levels are corrupt, please message the developer.")
        end
    end
    if changed and Settings.isDevelopment() then
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
