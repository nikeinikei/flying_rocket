--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 8,["20"] = 8,["21"] = 9,["22"] = 9,["23"] = 10,["24"] = 10,["25"] = 12,["27"] = 13,["30"] = 12,["32"] = 16,["34"] = 17,["35"] = 18,["36"] = 24,["37"] = 19,["39"] = 21,["41"] = 23,["43"] = 31,["45"] = 33,["47"] = 35,["49"] = 37,["55"] = 20,["59"] = 22,["63"] = 24,["64"] = 25,["65"] = 26,["66"] = 27,["69"] = 30,["73"] = 32,["77"] = 34,["81"] = 36,["85"] = 38,["86"] = 38,["87"] = 38,["88"] = 38,["91"] = 41,["92"] = 17,["93"] = 16,["94"] = 45,["95"] = 47,["96"] = 48,["97"] = 49,["99"] = 52,["100"] = 53,["101"] = 54,["102"] = 55,["103"] = 56,["104"] = 57,["106"] = 58,["107"] = 58,["108"] = 59,["109"] = 60,["110"] = 61,["111"] = 62,["113"] = 64,["115"] = 58,["118"] = 67,["120"] = 70,["121"] = 44});
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
local ____levels = require("levels")
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
        local ____switch5 = serialized.name
        local levels
        if ____switch5 == "Menu" then
            goto ____switch5_case_0
        elseif ____switch5 == "LevelPicker" then
            goto ____switch5_case_1
        elseif ____switch5 == "Playing" then
            goto ____switch5_case_2
        elseif ____switch5 == "GameModeChooserGameState" then
            goto ____switch5_case_3
        elseif ____switch5 == "CampaignLevelPicker" then
            goto ____switch5_case_4
        elseif ____switch5 == "PreLevelEditorGameState" then
            goto ____switch5_case_5
        elseif ____switch5 == "LevelEditor" then
            goto ____switch5_case_6
        end
        goto ____switch5_end
        ::____switch5_case_0::
        do
            return __TS__New(Menu)
        end
        ::____switch5_case_1::
        do
            return __TS__New(LevelPicker, serialized.page)
        end
        ::____switch5_case_2::
        do
            levels = Levels.getLevels()
            for ____, level in ipairs(levels) do
                if level.name == serialized.level then
                    return __TS__New(Playing, level)
                end
            end
            return nil
        end
        ::____switch5_case_3::
        do
            return __TS__New(GameModeChooserGameState)
        end
        ::____switch5_case_4::
        do
            return __TS__New(CampaignLevelPicker)
        end
        ::____switch5_case_5::
        do
            return __TS__New(PreLevelEditorGameState, serialized.levelName, serialized.isCampaignLevel)
        end
        ::____switch5_case_6::
        do
            return __TS__New(
                LevelEditor,
                newLevel(serialized.levelName)
            )
        end
        ::____switch5_end::
        assertNever(serialized)
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
