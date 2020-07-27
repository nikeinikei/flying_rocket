--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 8,["20"] = 8,["21"] = 9,["22"] = 9,["23"] = 10,["24"] = 10,["25"] = 12,["27"] = 13,["30"] = 12,["32"] = 16,["34"] = 17,["35"] = 18,["36"] = 19,["37"] = 20,["38"] = 21,["39"] = 22,["40"] = 23,["41"] = 24,["42"] = 25,["43"] = 26,["46"] = 29,["47"] = 30,["48"] = 31,["49"] = 32,["50"] = 33,["51"] = 34,["52"] = 35,["53"] = 36,["54"] = 37,["55"] = 37,["56"] = 37,["57"] = 37,["59"] = 39,["61"] = 17,["62"] = 16,["63"] = 44,["64"] = 46,["65"] = 47,["66"] = 48,["68"] = 51,["69"] = 52,["70"] = 53,["71"] = 54,["72"] = 55,["73"] = 56,["75"] = 57,["76"] = 57,["77"] = 58,["78"] = 59,["79"] = 60,["80"] = 61,["82"] = 63,["84"] = 57,["87"] = 66,["89"] = 69,["90"] = 43});
local ____exports = {}
local ____campaignLevelPicker = require("campaignLevelPicker")
local CampaignLevelPicker = ____campaignLevelPicker.CampaignLevelPicker
local ____json = require("json")
local json = ____json.json
local ____level = require("level")
local newLevel = ____level.newLevel
local ____leveleditor = require("leveleditor")
local LevelEditor = ____leveleditor.LevelEditor
local ____levelpicker = require("levelpicker")
local LevelPicker = ____levelpicker.LevelPicker
local ____levels = require("fs.levels")
local Levels = ____levels.Levels
local ____menu = require("menu")
local GameModeChooserGameState = ____menu.GameModeChooserGameState
local Menu = ____menu.Menu
local PreLevelEditorGameState = ____menu.PreLevelEditorGameState
local ____playing = require("playing")
local Playing = ____playing.Playing
local ____settings = require("settings")
local Settings = ____settings.Settings
local function assertNever(o)
    error(
        __TS__New(Error, "this shouldn't occur"),
        0
    )
end
____exports.RecreateApplication = {}
local RecreateApplication = ____exports.RecreateApplication
do
    local function createStateFromSerialized(serialized)
        if serialized.name == "Menu" then
            return __TS__New(Menu)
        elseif serialized.name == "LevelPicker" then
            return __TS__New(LevelPicker, serialized.page)
        elseif serialized.name == "Playing" then
            local levels = Levels.getLevels()
            for ____, level in ipairs(levels) do
                if level.name == serialized.level then
                    return __TS__New(Playing, level)
                end
            end
            return nil
        elseif serialized.name == "GameModeChooserGameState" then
            return __TS__New(GameModeChooserGameState)
        elseif serialized.name == "CampaignLevelPicker" then
            return __TS__New(CampaignLevelPicker)
        elseif serialized.name == "PreLevelEditorGameState" then
            return __TS__New(PreLevelEditorGameState, serialized.levelName, serialized.isCampaignLevel)
        elseif serialized.name == "LevelEditor" then
            return __TS__New(
                LevelEditor,
                newLevel(serialized.levelName)
            )
        else
            assertNever(serialized)
        end
    end
    function RecreateApplication.attempt()
        local restartFilePath = Settings.getRestartFilePath()
        local file = io.open(restartFilePath, "r")
        if not file then
            return nil
        end
        local contents = file:read("*a")
        file:close()
        os.remove(restartFilePath)
        if contents then
            local serializeds = json.decode(contents)
            local states = {}
            do
                local i = #serializeds - 1
                while i >= 0 do
                    local serialized = serializeds[i + 1]
                    local deserialized = createStateFromSerialized(serialized)
                    if deserialized == nil then
                        return nil
                    else
                        __TS__ArrayPush(states, deserialized)
                    end
                    i = i - 1
                end
            end
            return states
        end
        return nil
    end
end
return ____exports
