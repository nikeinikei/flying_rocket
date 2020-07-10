--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 12,["24"] = 12,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 19,["30"] = 14,["31"] = 17,["32"] = 21,["33"] = 22,["34"] = 23,["35"] = 24,["36"] = 26,["37"] = 26,["38"] = 26,["39"] = 26,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 27,["45"] = 28,["47"] = 30,["48"] = 31,["50"] = 33,["51"] = 34,["52"] = 35,["53"] = 36,["55"] = 42,["56"] = 44,["57"] = 45,["58"] = 45,["59"] = 45,["62"] = 50,["63"] = 52,["64"] = 53,["65"] = 53,["66"] = 53,["70"] = 26,["71"] = 26,["72"] = 60,["73"] = 61,["75"] = 64,["76"] = 65,["78"] = 67,["80"] = 19,["81"] = 71,["82"] = 72,["83"] = 14,["84"] = 74,["85"] = 75,["86"] = 76,["87"] = 77,["88"] = 78,["89"] = 79,["90"] = 80,["91"] = 81,["94"] = 84,["95"] = 71,["96"] = 87,["97"] = 88,["98"] = 87,["99"] = 91,["100"] = 92,["101"] = 92,["102"] = 92,["103"] = 92,["104"] = 91,["105"] = 95,["106"] = 96,["107"] = 97,["108"] = 98,["110"] = 100,["111"] = 95,["112"] = 103,["113"] = 104,["114"] = 105,["116"] = 103,["117"] = 110,["118"] = 110,["119"] = 110,["120"] = 110,["122"] = 110,["123"] = 116,["124"] = 116,["125"] = 116,["126"] = 116,["127"] = 116,["128"] = 116,["129"] = 116,["130"] = 116,["131"] = 117,["132"] = 117,["133"] = 117,["134"] = 116,["135"] = 116,["136"] = 119,["137"] = 119,["138"] = 119,["139"] = 119,["140"] = 119,["141"] = 119,["142"] = 119,["143"] = 119,["144"] = 120,["145"] = 120,["146"] = 120,["147"] = 119,["148"] = 119,["149"] = 114,["150"] = 124,["151"] = 125,["152"] = 124,["153"] = 128,["154"] = 129,["155"] = 128,["156"] = 132,["157"] = 133,["158"] = 132,["159"] = 136,["160"] = 137,["161"] = 138,["163"] = 136,["164"] = 143,["165"] = 144,["166"] = 144,["167"] = 146,["168"] = 147,["169"] = 147,["170"] = 147,["171"] = 144,["172"] = 143,["173"] = 150,["174"] = 150,["175"] = 152,["176"] = 153,["177"] = 153,["178"] = 153,["179"] = 150,["180"] = 143,["181"] = 156,["182"] = 156,["183"] = 158,["184"] = 159,["185"] = 160,["186"] = 156,["187"] = 143,["188"] = 143,["189"] = 143,["190"] = 169,["191"] = 169,["192"] = 169,["193"] = 169,["195"] = 169,["196"] = 174,["197"] = 176,["198"] = 177,["199"] = 179,["200"] = 180,["201"] = 182,["203"] = 183,["204"] = 183,["205"] = 184,["206"] = 184,["207"] = 184,["208"] = 184,["209"] = 183,["212"] = 172,["213"] = 197,["214"] = 198,["215"] = 197,["216"] = 201,["217"] = 202,["218"] = 201,["219"] = 205,["220"] = 206,["221"] = 205,["222"] = 209,["223"] = 210,["224"] = 211,["226"] = 209});
local ____exports = {}
local ____campaignLevelPicker = require("campaignLevelPicker")
local CampaignLevelPicker = ____campaignLevelPicker.CampaignLevelPicker
local ____campaignLevels = require("campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
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
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
____exports.PreLevelEditorGameState = __TS__Class()
local PreLevelEditorGameState = ____exports.PreLevelEditorGameState
PreLevelEditorGameState.name = "PreLevelEditorGameState"
__TS__ClassExtends(PreLevelEditorGameState, GameState)
function PreLevelEditorGameState.prototype.____constructor(self, levelName)
    GameState.prototype.____constructor(self)
    self.isCampaignLevel = nil
    local textInputWidth = 1200
    local textInputHeight = 600
    local x = (love.graphics.getWidth() / 2) - (textInputWidth / 2)
    local y = (love.graphics.getHeight() / 2) - (textInputHeight / 2)
    self.textInput = __TS__New(
        TextInput,
        x,
        y,
        textInputWidth,
        textInputHeight,
        "level name",
        function(name)
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
    )
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
    print("PreLevelEditorGameState#onActive")
    GameState.prototype.onActive(self, data)
    if data then
        local level = data
        if self.isCampaignLevel == true then
            print("saving campaign level")
            CampaignLevels.addLevel(level)
        elseif self.isCampaignLevel == false then
            print("saving normal level")
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
        levelName = self.textInput:getText()
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
            error("oh no, options aren't there")
            love.window.showMessageBox("Not implemented", "Options are currently not available")
        end
    },
    {name = "Exit", callback = love.event.quit}
}
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
    if key == "escape" then
        love.event.quit(0)
    end
end
return ____exports
