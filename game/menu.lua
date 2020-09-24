--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 12,["24"] = 12,["25"] = 15,["26"] = 15,["27"] = 15,["28"] = 15,["29"] = 20,["30"] = 15,["31"] = 18,["32"] = 22,["34"] = 22,["38"] = 22,["39"] = 23,["40"] = 24,["41"] = 25,["42"] = 26,["43"] = 28,["44"] = 29,["45"] = 30,["47"] = 33,["48"] = 34,["50"] = 36,["52"] = 20,["53"] = 40,["54"] = 15,["55"] = 42,["56"] = 43,["57"] = 44,["58"] = 45,["59"] = 46,["60"] = 47,["63"] = 50,["64"] = 40,["65"] = 53,["66"] = 54,["67"] = 53,["68"] = 57,["69"] = 58,["70"] = 58,["71"] = 58,["72"] = 58,["73"] = 58,["74"] = 57,["75"] = 65,["76"] = 66,["77"] = 67,["78"] = 68,["80"] = 70,["81"] = 65,["82"] = 73,["83"] = 74,["84"] = 75,["86"] = 77,["87"] = 78,["88"] = 80,["89"] = 81,["91"] = 83,["92"] = 84,["94"] = 86,["95"] = 87,["96"] = 88,["97"] = 89,["99"] = 95,["100"] = 97,["101"] = 98,["102"] = 98,["103"] = 98,["106"] = 101,["107"] = 103,["108"] = 104,["109"] = 104,["110"] = 104,["115"] = 73,["116"] = 112,["117"] = 112,["118"] = 112,["119"] = 112,["121"] = 112,["122"] = 118,["123"] = 118,["124"] = 118,["125"] = 118,["126"] = 118,["127"] = 118,["128"] = 118,["129"] = 118,["130"] = 119,["131"] = 119,["132"] = 119,["133"] = 118,["134"] = 118,["135"] = 121,["136"] = 121,["137"] = 121,["138"] = 121,["139"] = 121,["140"] = 121,["141"] = 121,["142"] = 121,["143"] = 122,["144"] = 122,["145"] = 122,["146"] = 121,["147"] = 121,["148"] = 116,["149"] = 126,["150"] = 127,["151"] = 126,["152"] = 130,["153"] = 131,["154"] = 130,["155"] = 134,["156"] = 135,["157"] = 134,["158"] = 138,["159"] = 139,["160"] = 140,["162"] = 138,["163"] = 145,["164"] = 146,["165"] = 146,["166"] = 148,["167"] = 149,["168"] = 149,["169"] = 149,["170"] = 146,["171"] = 145,["172"] = 152,["173"] = 152,["174"] = 154,["175"] = 155,["176"] = 155,["177"] = 155,["178"] = 152,["179"] = 145,["180"] = 158,["181"] = 158,["182"] = 160,["183"] = 161,["184"] = 158,["185"] = 145,["186"] = 145,["187"] = 166,["188"] = 167,["190"] = 173,["191"] = 173,["192"] = 173,["193"] = 173,["195"] = 173,["196"] = 178,["197"] = 180,["198"] = 181,["199"] = 183,["200"] = 184,["201"] = 186,["203"] = 187,["204"] = 187,["205"] = 188,["206"] = 188,["207"] = 188,["208"] = 188,["209"] = 187,["212"] = 176,["213"] = 201,["214"] = 202,["215"] = 201,["216"] = 205,["217"] = 206,["218"] = 205,["219"] = 209,["220"] = 210,["221"] = 209,["222"] = 213,["223"] = 214,["224"] = 215,["226"] = 213});
local ____exports = {}
local ____campaignLevelPicker = require("campaignLevelPicker")
local CampaignLevelPicker = ____campaignLevelPicker.CampaignLevelPicker
local ____campaignLevels = require("fs.campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
local ____levels = require("fs.levels")
local Levels = ____levels.Levels
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
