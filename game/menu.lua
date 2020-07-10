--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 17,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 24,["40"] = 25,["42"] = 27,["43"] = 28,["45"] = 30,["46"] = 31,["47"] = 32,["48"] = 33,["49"] = 34,["51"] = 40,["52"] = 42,["53"] = 43,["54"] = 43,["55"] = 43,["56"] = 43,["57"] = 44,["58"] = 45,["60"] = 43,["61"] = 42,["62"] = 42,["65"] = 51,["66"] = 53,["67"] = 54,["68"] = 54,["69"] = 54,["70"] = 54,["71"] = 55,["72"] = 56,["74"] = 54,["75"] = 53,["76"] = 53,["80"] = 23,["81"] = 23,["82"] = 64,["83"] = 65,["85"] = 68,["86"] = 69,["88"] = 71,["90"] = 17,["91"] = 75,["92"] = 76,["93"] = 75,["94"] = 79,["95"] = 80,["96"] = 80,["97"] = 80,["98"] = 80,["99"] = 79,["100"] = 83,["101"] = 84,["102"] = 85,["103"] = 86,["105"] = 88,["106"] = 83,["107"] = 91,["108"] = 92,["109"] = 93,["111"] = 91,["112"] = 98,["113"] = 98,["114"] = 98,["116"] = 103,["117"] = 103,["118"] = 103,["119"] = 103,["120"] = 103,["121"] = 103,["122"] = 103,["123"] = 103,["124"] = 104,["125"] = 104,["126"] = 104,["127"] = 103,["128"] = 103,["129"] = 106,["130"] = 106,["131"] = 106,["132"] = 106,["133"] = 106,["134"] = 106,["135"] = 106,["136"] = 106,["137"] = 107,["138"] = 107,["139"] = 107,["140"] = 106,["141"] = 106,["142"] = 102,["143"] = 111,["144"] = 112,["145"] = 111,["146"] = 115,["147"] = 116,["148"] = 115,["149"] = 119,["150"] = 120,["151"] = 119,["152"] = 123,["153"] = 124,["154"] = 125,["156"] = 123,["157"] = 130,["158"] = 131,["159"] = 131,["160"] = 133,["161"] = 134,["162"] = 134,["163"] = 134,["164"] = 131,["165"] = 130,["166"] = 137,["167"] = 137,["168"] = 139,["169"] = 140,["170"] = 140,["171"] = 140,["172"] = 137,["173"] = 130,["174"] = 143,["175"] = 143,["176"] = 145,["177"] = 146,["178"] = 147,["179"] = 143,["180"] = 130,["181"] = 130,["182"] = 130,["183"] = 156,["184"] = 156,["185"] = 156,["187"] = 160,["188"] = 162,["189"] = 163,["190"] = 165,["191"] = 166,["192"] = 168,["194"] = 169,["195"] = 169,["196"] = 170,["197"] = 170,["198"] = 170,["199"] = 170,["200"] = 169,["203"] = 159,["204"] = 183,["205"] = 184,["206"] = 183,["207"] = 187,["208"] = 188,["209"] = 187,["210"] = 191,["211"] = 192,["212"] = 193,["214"] = 191});
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
____exports.PreLevelEditorGameState = __TS__Class()
local PreLevelEditorGameState = ____exports.PreLevelEditorGameState
PreLevelEditorGameState.name = "PreLevelEditorGameState"
function PreLevelEditorGameState.prototype.____constructor(self, levelName)
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
function GameModeChooserGameState.prototype.____constructor(self)
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
function Menu.prototype.____constructor(self)
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
