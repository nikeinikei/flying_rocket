--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["19"] = 9,["21"] = 10,["22"] = 11,["23"] = 17,["24"] = 12,["26"] = 14,["28"] = 16,["30"] = 24,["36"] = 13,["40"] = 15,["44"] = 17,["45"] = 18,["46"] = 19,["47"] = 20,["50"] = 23,["54"] = 25,["57"] = 28,["58"] = 10,["59"] = 9,["60"] = 32,["61"] = 34,["62"] = 35,["63"] = 36,["65"] = 39,["66"] = 40,["67"] = 41,["68"] = 42,["69"] = 43,["70"] = 44,["72"] = 45,["73"] = 45,["74"] = 46,["75"] = 47,["76"] = 48,["77"] = 49,["79"] = 51,["81"] = 45,["84"] = 54,["86"] = 57,["87"] = 31});
local ____exports = {}
local ____menu = require("menu")
local Menu = ____menu.Menu
local GameModeChooserGameState = ____menu.GameModeChooserGameState
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
____exports.RecreateApplication = {}
local RecreateApplication = ____exports.RecreateApplication
do
    local function createStateFromSerialized(serialized)
        local ____switch4 = serialized.name
        local levels
        if ____switch4 == "Menu" then
            goto ____switch4_case_0
        elseif ____switch4 == "LevelPicker" then
            goto ____switch4_case_1
        elseif ____switch4 == "Playing" then
            goto ____switch4_case_2
        elseif ____switch4 == "GameModeChooserGameState" then
            goto ____switch4_case_3
        end
        goto ____switch4_end
        ::____switch4_case_0::
        do
            return __TS__New(Menu)
        end
        ::____switch4_case_1::
        do
            return __TS__New(LevelPicker)
        end
        ::____switch4_case_2::
        do
            levels = Levels.getLevels()
            for ____, level in ipairs(levels) do
                if level.name == serialized.level then
                    return __TS__New(Playing, level)
                end
            end
            return nil
        end
        ::____switch4_case_3::
        do
            return __TS__New(GameModeChooserGameState)
        end
        ::____switch4_end::
        return nil
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
