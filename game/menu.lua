--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 11,["24"] = 11,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 19,["30"] = 14,["31"] = 17,["32"] = 21,["34"] = 21,["38"] = 21,["39"] = 22,["40"] = 23,["41"] = 24,["42"] = 25,["43"] = 27,["44"] = 28,["45"] = 29,["47"] = 32,["48"] = 33,["50"] = 35,["52"] = 19,["53"] = 39,["54"] = 14,["55"] = 41,["56"] = 42,["57"] = 43,["58"] = 44,["59"] = 45,["60"] = 46,["63"] = 49,["64"] = 39,["65"] = 52,["66"] = 53,["67"] = 52,["68"] = 56,["69"] = 57,["70"] = 57,["71"] = 57,["72"] = 57,["73"] = 57,["74"] = 56,["75"] = 64,["76"] = 65,["77"] = 66,["78"] = 67,["80"] = 69,["81"] = 64,["82"] = 72,["83"] = 73,["84"] = 74,["86"] = 76,["87"] = 77,["88"] = 79,["89"] = 80,["91"] = 82,["92"] = 83,["94"] = 85,["95"] = 86,["96"] = 87,["97"] = 88,["99"] = 94,["100"] = 96,["101"] = 97,["102"] = 97,["103"] = 97,["106"] = 100,["107"] = 102,["108"] = 103,["109"] = 103,["110"] = 103,["115"] = 72,["116"] = 111,["117"] = 111,["118"] = 111,["119"] = 111,["121"] = 111,["122"] = 117,["123"] = 117,["124"] = 117,["125"] = 117,["126"] = 117,["127"] = 117,["128"] = 117,["129"] = 117,["130"] = 118,["131"] = 118,["132"] = 118,["133"] = 117,["134"] = 117,["135"] = 120,["136"] = 120,["137"] = 120,["138"] = 120,["139"] = 120,["140"] = 120,["141"] = 120,["142"] = 120,["143"] = 121,["144"] = 121,["145"] = 121,["146"] = 120,["147"] = 120,["148"] = 115,["149"] = 125,["150"] = 126,["151"] = 125,["152"] = 129,["153"] = 130,["154"] = 129,["155"] = 133,["156"] = 134,["157"] = 133,["158"] = 137,["159"] = 138,["160"] = 139,["162"] = 137,["163"] = 144,["164"] = 145,["165"] = 145,["166"] = 147,["167"] = 148,["168"] = 148,["169"] = 148,["170"] = 145,["171"] = 144,["172"] = 151,["173"] = 151,["174"] = 153,["175"] = 154,["176"] = 154,["177"] = 154,["178"] = 151,["179"] = 144,["180"] = 157,["181"] = 157,["182"] = 159,["183"] = 160,["184"] = 157,["185"] = 144,["186"] = 144,["187"] = 166,["188"] = 167,["190"] = 173,["191"] = 173,["192"] = 173,["193"] = 173,["195"] = 173,["196"] = 178,["197"] = 180,["198"] = 181,["199"] = 183,["200"] = 184,["201"] = 186,["203"] = 187,["204"] = 187,["205"] = 188,["206"] = 188,["207"] = 188,["208"] = 188,["209"] = 187,["212"] = 176,["213"] = 201,["214"] = 202,["215"] = 201,["216"] = 205,["217"] = 206,["218"] = 205,["219"] = 209,["220"] = 210,["221"] = 209,["222"] = 213,["223"] = 214,["224"] = 215,["226"] = 213});
local ____exports = {}
local ____campaignLevelPicker = require("campaignLevelPicker")
local CampaignLevelPicker = ____campaignLevelPicker.CampaignLevelPicker
local ____campaignLevels = require("campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local ____gui = require("gui")
local Button = ____gui.Button
local TextInput = ____gui.TextInput
local Toggle = ____gui.Toggle
local ____level = require("level")
local newLevel = ____level.newLevel
local ____leveleditor = require("leveleditor")
local LevelEditor = ____leveleditor.LevelEditor
local ____levelpicker = require("levelpicker")
local LevelPicker = ____levelpicker.LevelPicker
local ____levels = require("levels")
local Levels = ____levels.Levels
local ____settings = require("settings")
local Settings = ____settings.Settings
____exports.PreLevelEditorGameState = __TS__Class()
local PreLevelEditorGameState = ____exports.PreLevelEditorGameState
PreLevelEditorGameState.name = "PreLevelEditorGameState"
__TS__ClassExtends(PreLevelEditorGameState, GameState)
function PreLevelEditorGameState.prototype.____constructor(self, levelName, isCampaignLevel)
    GameState.prototype.____constructor(self)
    self.isCampaignLevel = nil
    self.isCampaignLevel = (function(____lhs)
        if ____lhs == nil then
            return nil
        else
            return ____lhs
        end
    end)(isCampaignLevel)
    local textInputWidth = 1200
    local textInputHeight = 600
    local x = (love.graphics.getWidth() / 2) - (textInputWidth / 2)
    local y = (love.graphics.getHeight() / 2) - (textInputHeight / 2)
    self.textInput = __TS__New(TextInput, x, y, textInputWidth, textInputHeight, "level name")
    if levelName then
        self.textInput:setText(levelName)
    end
    if Settings.isDevelopment() then
        self.toggle = __TS__New(Toggle, 10, 10, 40, 40)
    else
        self.toggle = nil
    end
end
function PreLevelEditorGameState.prototype.onActive(self, data)
    GameState.prototype.onActive(self, data)
    if data then
        local level = data
        if self.isCampaignLevel == true then
            CampaignLevels.addLevel(level)
        elseif self.isCampaignLevel == false then
            Levels.addLevel(level)
        end
    end
    Application.popState()
end
function PreLevelEditorGameState.prototype.getName(self)
    return "PreLevelEditorGameState"
end
function PreLevelEditorGameState.prototype.serialize(self)
    return {
        name = "PreLevelEditorGameState",
        levelName = self.textInput:getText(),
        isCampaignLevel = self.isCampaignLevel
    }
end
function PreLevelEditorGameState.prototype.getObjects(self)
    local objects = {self.textInput}
    if self.toggle then
        __TS__ArrayPush(objects, self.toggle)
    end
    return objects
end
function PreLevelEditorGameState.prototype.keypressed(self, key)
    if key == "escape" then
        Application.popState()
    end
    if key == "return" then
        local name = self.textInput:getText()
        if #name == 0 then
            love.window.showMessageBox("Invalid Level Name", "empty string is not allowed.", "error")
        else
            if Levels.nameUsed(name) then
                love.window.showMessageBox("Invalid Level Name", "level name already in use", "error")
            else
                if self.toggle and self.toggle:isOn() then
                    local index = tonumber(name)
                    if not index then
                        love.window.showMessageBox("Invalid level name", "when creating a campaign level the name must be the index of the campaign", "error")
                    else
                        local level = newLevel(name)
                        self.isCampaignLevel = true
                        Application.pushState(
                            __TS__New(LevelEditor, level)
                        )
                    end
                else
                    local level = newLevel(name)
                    self.isCampaignLevel = false
                    Application.pushState(
                        __TS__New(LevelEditor, level)
                    )
                end
            end
        end
    end
end
____exports.GameModeChooserGameState = __TS__Class()
local GameModeChooserGameState = ____exports.GameModeChooserGameState
GameModeChooserGameState.name = "GameModeChooserGameState"
__TS__ClassExtends(GameModeChooserGameState, GameState)
function GameModeChooserGameState.prototype.____constructor(self)
    GameState.prototype.____constructor(self)
    self.campaignButton = __TS__New(
        Button,
        50,
        50,
        400,
        100,
        "Campaign",
        function()
            Application.pushState(
                __TS__New(CampaignLevelPicker)
            )
        end
    )
    self.customGameButton = __TS__New(
        Button,
        50,
        200,
        400,
        100,
        "Custom",
        function()
            Application.pushState(
                __TS__New(LevelPicker)
            )
        end
    )
end
function GameModeChooserGameState.prototype.getName(self)
    return "GameModeChooserGameState"
end
function GameModeChooserGameState.prototype.serialize(self)
    return {name = "GameModeChooserGameState"}
end
function GameModeChooserGameState.prototype.getObjects(self)
    return {self.campaignButton, self.customGameButton}
end
function GameModeChooserGameState.prototype.keypressed(self, key)
    if key == "escape" then
        Application.popState()
    end
end
local buttonSchemes = {
    {
        name = "Play",
        callback = function()
            Application.pushState(
                __TS__New(____exports.GameModeChooserGameState)
            )
        end
    },
    {
        name = "Level Editor",
        callback = function()
            Application.pushState(
                __TS__New(____exports.PreLevelEditorGameState)
            )
        end
    },
    {
        name = "Options",
        callback = function()
            love.window.showMessageBox("Not implemented", "Options are currently not available")
        end
    }
}
if not Settings.isWeb() then
    __TS__ArrayPush(buttonSchemes, {name = "Exit", callback = love.event.quit})
end
____exports.Menu = __TS__Class()
local Menu = ____exports.Menu
Menu.name = "Menu"
__TS__ClassExtends(Menu, GameState)
function Menu.prototype.____constructor(self)
    GameState.prototype.____constructor(self)
    self.buttons = {}
    local buttonHeight = 70
    local buttonWidth = 400
    local startY = 150
    local buttonPadding = (love.graphics.getHeight() * 0.7) / #buttonSchemes
    local x = (love.graphics.getWidth() / 2) - (buttonWidth / 2)
    do
        local i = 0
        while i < #buttonSchemes do
            __TS__ArrayPush(
                self.buttons,
                __TS__New(Button, x, startY + (i * buttonPadding), buttonWidth, buttonHeight, buttonSchemes[i + 1].name, buttonSchemes[i + 1].callback)
            )
            i = i + 1
        end
    end
end
function Menu.prototype.getName(self)
    return "Menu"
end
function Menu.prototype.serialize(self)
    return {name = "Menu"}
end
function Menu.prototype.getObjects(self)
    return self.buttons
end
function Menu.prototype.keypressed(self, key)
    if (key == "escape") and (not Settings.isWeb()) then
        love.event.quit(0)
    end
end
return ____exports
