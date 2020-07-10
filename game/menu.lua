--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 12,["24"] = 12,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 18,["30"] = 14,["31"] = 20,["32"] = 21,["33"] = 22,["34"] = 23,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 25,["39"] = 25,["40"] = 25,["41"] = 25,["42"] = 25,["43"] = 26,["44"] = 27,["46"] = 29,["47"] = 30,["49"] = 32,["50"] = 33,["51"] = 34,["52"] = 35,["53"] = 36,["55"] = 42,["56"] = 44,["57"] = 45,["58"] = 45,["59"] = 45,["60"] = 45,["61"] = 46,["62"] = 47,["64"] = 45,["65"] = 44,["66"] = 44,["69"] = 53,["70"] = 55,["71"] = 56,["72"] = 56,["73"] = 56,["74"] = 56,["75"] = 57,["76"] = 58,["78"] = 56,["79"] = 55,["80"] = 55,["84"] = 25,["85"] = 25,["86"] = 66,["87"] = 67,["89"] = 70,["90"] = 71,["92"] = 73,["94"] = 18,["95"] = 77,["96"] = 78,["97"] = 77,["98"] = 81,["99"] = 82,["100"] = 82,["101"] = 82,["102"] = 82,["103"] = 81,["104"] = 85,["105"] = 86,["106"] = 87,["107"] = 88,["109"] = 90,["110"] = 85,["111"] = 93,["112"] = 94,["113"] = 95,["115"] = 93,["116"] = 100,["117"] = 100,["118"] = 100,["119"] = 100,["121"] = 100,["122"] = 106,["123"] = 106,["124"] = 106,["125"] = 106,["126"] = 106,["127"] = 106,["128"] = 106,["129"] = 106,["130"] = 107,["131"] = 107,["132"] = 107,["133"] = 106,["134"] = 106,["135"] = 109,["136"] = 109,["137"] = 109,["138"] = 109,["139"] = 109,["140"] = 109,["141"] = 109,["142"] = 109,["143"] = 110,["144"] = 110,["145"] = 110,["146"] = 109,["147"] = 109,["148"] = 104,["149"] = 114,["150"] = 115,["151"] = 114,["152"] = 118,["153"] = 119,["154"] = 118,["155"] = 122,["156"] = 123,["157"] = 122,["158"] = 126,["159"] = 127,["160"] = 128,["162"] = 126,["163"] = 133,["164"] = 134,["165"] = 134,["166"] = 136,["167"] = 137,["168"] = 137,["169"] = 137,["170"] = 134,["171"] = 133,["172"] = 140,["173"] = 140,["174"] = 142,["175"] = 143,["176"] = 143,["177"] = 143,["178"] = 140,["179"] = 133,["180"] = 146,["181"] = 146,["182"] = 148,["183"] = 149,["184"] = 150,["185"] = 146,["186"] = 133,["187"] = 133,["188"] = 133,["189"] = 159,["190"] = 159,["191"] = 159,["192"] = 159,["194"] = 159,["195"] = 164,["196"] = 166,["197"] = 167,["198"] = 169,["199"] = 170,["200"] = 172,["202"] = 173,["203"] = 173,["204"] = 174,["205"] = 174,["206"] = 174,["207"] = 174,["208"] = 173,["211"] = 162,["212"] = 187,["213"] = 188,["214"] = 187,["215"] = 191,["216"] = 192,["217"] = 191,["218"] = 195,["219"] = 196,["220"] = 195,["221"] = 199,["222"] = 200,["223"] = 201,["225"] = 199});
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
                    Application.popState()
                    if self.toggle and self.toggle:isOn() then
                        local index = tonumber(name)
                        if not index then
                            love.window.showMessageBox("Invalid level name", "when creating a campaign level the name must be the index of the campaign", "error")
                        else
                            local level = newLevel(name)
                            Application.pushState(
                                __TS__New(
                                    LevelEditor,
                                    level,
                                    function(level)
                                        if level then
                                            CampaignLevels.addLevel(level)
                                        end
                                    end
                                )
                            )
                        end
                    else
                        local level = newLevel(name)
                        Application.pushState(
                            __TS__New(
                                LevelEditor,
                                level,
                                function(level)
                                    if level then
                                        Levels.addLevel(level)
                                    end
                                end
                            )
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
