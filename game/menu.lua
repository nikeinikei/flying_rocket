--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 11,["22"] = 11,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 19,["28"] = 21,["29"] = 21,["30"] = 21,["31"] = 21,["32"] = 21,["33"] = 21,["34"] = 21,["35"] = 21,["36"] = 22,["37"] = 23,["39"] = 25,["40"] = 26,["42"] = 28,["43"] = 29,["44"] = 30,["45"] = 31,["46"] = 32,["48"] = 38,["49"] = 46,["50"] = 47,["51"] = 47,["52"] = 47,["53"] = 47,["54"] = 48,["55"] = 49,["57"] = 47,["58"] = 46,["59"] = 46,["62"] = 55,["63"] = 63,["64"] = 63,["65"] = 63,["66"] = 63,["67"] = 63,["68"] = 64,["69"] = 65,["71"] = 63,["72"] = 63,["73"] = 63,["77"] = 21,["78"] = 21,["79"] = 73,["80"] = 74,["82"] = 76,["84"] = 15,["85"] = 80,["86"] = 81,["87"] = 82,["88"] = 83,["90"] = 85,["91"] = 80,["92"] = 88,["93"] = 89,["94"] = 90,["96"] = 88,["97"] = 95,["98"] = 95,["100"] = 100,["101"] = 100,["102"] = 100,["103"] = 100,["104"] = 100,["105"] = 100,["106"] = 100,["107"] = 100,["108"] = 101,["109"] = 101,["110"] = 101,["111"] = 100,["112"] = 100,["113"] = 103,["114"] = 103,["115"] = 103,["116"] = 103,["117"] = 103,["118"] = 103,["119"] = 103,["120"] = 103,["121"] = 104,["122"] = 104,["123"] = 104,["124"] = 103,["125"] = 103,["126"] = 99,["127"] = 108,["128"] = 109,["129"] = 108,["130"] = 112,["131"] = 113,["132"] = 114,["134"] = 112,["135"] = 119,["136"] = 120,["137"] = 120,["138"] = 122,["139"] = 123,["140"] = 123,["141"] = 123,["142"] = 120,["143"] = 119,["144"] = 126,["145"] = 126,["146"] = 128,["147"] = 129,["148"] = 129,["149"] = 129,["150"] = 126,["151"] = 119,["152"] = 132,["153"] = 132,["154"] = 134,["155"] = 135,["156"] = 132,["157"] = 119,["158"] = 119,["159"] = 119,["160"] = 144,["161"] = 144,["162"] = 144,["164"] = 148,["165"] = 150,["166"] = 151,["167"] = 153,["168"] = 154,["169"] = 156,["171"] = 157,["172"] = 157,["173"] = 158,["174"] = 158,["175"] = 158,["176"] = 158,["177"] = 157,["180"] = 147,["181"] = 171,["182"] = 172,["183"] = 171,["184"] = 175,["185"] = 176,["186"] = 177,["188"] = 175});
local ____exports = {}
local ____campaignLevelPicker = require("campaignLevelPicker")
local CampaignLevelPicker = ____campaignLevelPicker.CampaignLevelPicker
local ____gui = require("gui")
local Button = ____gui.Button
local TextInput = ____gui.TextInput
local Toggle = ____gui.Toggle
local ____leveleditor = require("leveleditor")
local LevelEditor = ____leveleditor.LevelEditor
local ____levelpicker = require("levelpicker")
local LevelPicker = ____levelpicker.LevelPicker
local ____levels = require("levels")
local Levels = ____levels.Levels
local ____settings = require("settings")
local Settings = ____settings.Settings
local ____campaignLevels = require("campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
local PreLevelBuilderGameState = __TS__Class()
PreLevelBuilderGameState.name = "PreLevelBuilderGameState"
function PreLevelBuilderGameState.prototype.____constructor(self)
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
                            local level = {dataVersion = "0.0.2", name = name, rocketLandingLocation = nil, rocketStartingLocation = nil, terrainPoints = {}}
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
                        local level = {dataVersion = "0.0.2", name = name, rocketLandingLocation = nil, rocketStartingLocation = nil, terrainPoints = {}}
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
    if Settings.isDevelopment() then
        self.toggle = __TS__New(Toggle, 10, 10, 40, 40)
    else
        self.toggle = nil
    end
end
function PreLevelBuilderGameState.prototype.getObjects(self)
    local objects = {self.textInput}
    if self.toggle then
        __TS__ArrayPush(objects, self.toggle)
    end
    return objects
end
function PreLevelBuilderGameState.prototype.keypressed(self, key)
    if key == "escape" then
        Application.popState()
    end
end
local GameModeChooserGameState = __TS__Class()
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
                __TS__New(GameModeChooserGameState)
            )
        end
    },
    {
        name = "LevelBuilder",
        callback = function()
            Application.pushState(
                __TS__New(PreLevelBuilderGameState)
            )
        end
    },
    {
        name = "Options",
        callback = function()
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
function Menu.prototype.getObjects(self)
    return self.buttons
end
function Menu.prototype.keypressed(self, key)
    if key == "escape" then
        love.event.quit(0)
    end
end
return ____exports
