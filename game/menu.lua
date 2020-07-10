--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 17,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 24,["40"] = 25,["42"] = 27,["43"] = 28,["45"] = 30,["46"] = 31,["47"] = 32,["48"] = 33,["49"] = 34,["51"] = 40,["52"] = 42,["53"] = 43,["54"] = 43,["55"] = 43,["56"] = 43,["57"] = 44,["58"] = 45,["60"] = 43,["61"] = 42,["62"] = 42,["65"] = 51,["66"] = 53,["67"] = 54,["68"] = 54,["69"] = 54,["70"] = 54,["71"] = 55,["72"] = 56,["74"] = 54,["75"] = 53,["76"] = 53,["80"] = 23,["81"] = 23,["82"] = 64,["83"] = 65,["85"] = 68,["86"] = 69,["88"] = 71,["90"] = 17,["91"] = 75,["92"] = 76,["93"] = 76,["94"] = 76,["95"] = 76,["96"] = 75,["97"] = 79,["98"] = 80,["99"] = 81,["100"] = 82,["102"] = 84,["103"] = 79,["104"] = 87,["105"] = 88,["106"] = 89,["108"] = 87,["109"] = 94,["110"] = 94,["111"] = 94,["113"] = 99,["114"] = 99,["115"] = 99,["116"] = 99,["117"] = 99,["118"] = 99,["119"] = 99,["120"] = 99,["121"] = 100,["122"] = 100,["123"] = 100,["124"] = 99,["125"] = 99,["126"] = 102,["127"] = 102,["128"] = 102,["129"] = 102,["130"] = 102,["131"] = 102,["132"] = 102,["133"] = 102,["134"] = 103,["135"] = 103,["136"] = 103,["137"] = 102,["138"] = 102,["139"] = 98,["140"] = 107,["141"] = 108,["142"] = 107,["143"] = 111,["144"] = 112,["145"] = 111,["146"] = 115,["147"] = 116,["148"] = 117,["150"] = 115,["151"] = 122,["152"] = 123,["153"] = 123,["154"] = 125,["155"] = 126,["156"] = 126,["157"] = 126,["158"] = 123,["159"] = 122,["160"] = 129,["161"] = 129,["162"] = 131,["163"] = 132,["164"] = 132,["165"] = 132,["166"] = 129,["167"] = 122,["168"] = 135,["169"] = 135,["170"] = 137,["171"] = 138,["172"] = 139,["173"] = 135,["174"] = 122,["175"] = 122,["176"] = 122,["177"] = 148,["178"] = 148,["179"] = 148,["181"] = 152,["182"] = 154,["183"] = 155,["184"] = 157,["185"] = 158,["186"] = 160,["188"] = 161,["189"] = 161,["190"] = 162,["191"] = 162,["192"] = 162,["193"] = 162,["194"] = 161,["197"] = 151,["198"] = 175,["199"] = 176,["200"] = 175,["201"] = 179,["202"] = 180,["203"] = 179,["204"] = 183,["205"] = 184,["206"] = 185,["208"] = 183});
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
