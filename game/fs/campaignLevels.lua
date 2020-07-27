--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 4,["11"] = 6,["12"] = 47,["13"] = 48,["14"] = 50,["15"] = 50,["16"] = 51,["17"] = 52,["18"] = 53,["20"] = 55,["22"] = 57,["23"] = 50,["24"] = 60,["25"] = 60,["26"] = 60,["27"] = 61,["28"] = 61,["29"] = 61,["30"] = 47,["31"] = 6,["32"] = 7,["33"] = 9,["34"] = 11,["35"] = 12,["36"] = 13,["38"] = 11,["39"] = 19,["40"] = 20,["41"] = 20,["42"] = 20,["43"] = 21,["44"] = 21,["45"] = 21,["46"] = 22,["47"] = 23,["49"] = 25,["52"] = 28,["54"] = 31,["55"] = 32,["56"] = 33,["57"] = 34,["58"] = 35,["60"] = 37,["61"] = 38,["64"] = 42,["65"] = 43,["67"] = 19,["69"] = 64,["71"] = 64,["72"] = 66,["73"] = 67,["74"] = 65,["75"] = 64,["76"] = 71,["77"] = 73,["78"] = 74,["79"] = 70,["80"] = 64,["81"] = 78,["82"] = 79,["83"] = 77,["84"] = 64,["85"] = 83,["86"] = 84,["87"] = 85,["89"] = 88,["90"] = 89,["91"] = 90,["93"] = 93,["94"] = 94,["95"] = 95,["97"] = 98,["98"] = 99,["99"] = 100,["101"] = 103,["102"] = 104,["103"] = 105,["104"] = 82});
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
        file:close()
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
        if res == false then
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
