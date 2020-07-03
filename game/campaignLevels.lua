--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 14,["12"] = 49,["13"] = 50,["14"] = 52,["15"] = 52,["16"] = 53,["17"] = 54,["18"] = 55,["20"] = 57,["22"] = 52,["23"] = 61,["24"] = 61,["25"] = 61,["26"] = 62,["27"] = 62,["28"] = 62,["29"] = 49,["30"] = 14,["31"] = 15,["32"] = 17,["33"] = 19,["34"] = 20,["35"] = 21,["37"] = 19,["38"] = 25,["39"] = 26,["40"] = 26,["41"] = 26,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 28,["46"] = 29,["48"] = 31,["51"] = 34,["53"] = 37,["54"] = 38,["55"] = 39,["56"] = 40,["59"] = 44,["60"] = 45,["62"] = 25,["64"] = 65,["66"] = 65,["67"] = 67,["68"] = 68,["69"] = 66,["70"] = 65,["71"] = 72,["72"] = 74,["73"] = 75,["74"] = 71,["75"] = 65,["76"] = 79,["77"] = 80,["78"] = 78,["79"] = 65,["80"] = 84,["81"] = 85,["82"] = 86,["84"] = 89,["85"] = 90,["86"] = 91,["88"] = 94,["89"] = 95,["90"] = 96,["92"] = 99,["93"] = 100,["94"] = 101,["96"] = 104,["97"] = 105,["98"] = 106,["99"] = 83});
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
