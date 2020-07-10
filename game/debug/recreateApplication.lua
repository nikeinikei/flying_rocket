--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 10,["23"] = 11,["26"] = 10,["28"] = 14,["30"] = 15,["31"] = 16,["32"] = 22,["33"] = 17,["35"] = 19,["37"] = 21,["39"] = 29,["41"] = 31,["43"] = 33,["49"] = 18,["53"] = 20,["57"] = 22,["58"] = 23,["59"] = 24,["60"] = 25,["63"] = 28,["67"] = 30,["71"] = 32,["75"] = 34,["78"] = 37,["79"] = 15,["80"] = 14,["81"] = 41,["82"] = 43,["83"] = 44,["84"] = 45,["86"] = 48,["87"] = 49,["88"] = 50,["89"] = 51,["90"] = 52,["91"] = 53,["93"] = 54,["94"] = 54,["95"] = 55,["96"] = 56,["97"] = 57,["98"] = 58,["100"] = 60,["102"] = 54,["105"] = 63,["107"] = 66,["108"] = 40});
local ____exports = {}
local ____menu = require("menu")
local Menu = ____menu.Menu
local GameModeChooserGameState = ____menu.GameModeChooserGameState
local PreLevelEditorGameState = ____menu.PreLevelEditorGameState
local ____levelpicker = require("levelpicker")
local LevelPicker = ____levelpicker.LevelPicker
local ____playing = require("playing")
local Playing = ____playing.Playing
local ____levels = require("levels")
local Levels = ____levels.Levels
local ____settings = require("settings")
local Settings = ____settings.Settings
local ____json = require("json")
local json = ____json.json
local ____campaignLevelPicker = require("campaignLevelPicker")
local CampaignLevelPicker = ____campaignLevelPicker.CampaignLevelPicker
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
            return __TS__New(PreLevelEditorGameState, serialized.levelName)
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
