--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 11,["22"] = 11,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 19,["28"] = 21,["29"] = 21,["30"] = 21,["31"] = 21,["32"] = 21,["33"] = 21,["34"] = 21,["35"] = 21,["36"] = 22,["37"] = 23,["39"] = 25,["40"] = 26,["42"] = 28,["43"] = 29,["44"] = 30,["45"] = 31,["46"] = 32,["48"] = 38,["49"] = 46,["50"] = 47,["51"] = 47,["52"] = 47,["53"] = 47,["54"] = 48,["55"] = 49,["57"] = 47,["58"] = 46,["59"] = 46,["62"] = 55,["63"] = 63,["64"] = 64,["65"] = 64,["66"] = 64,["67"] = 64,["68"] = 65,["69"] = 66,["71"] = 64,["72"] = 63,["73"] = 63,["77"] = 21,["78"] = 21,["79"] = 75,["80"] = 76,["82"] = 78,["84"] = 15,["85"] = 82,["86"] = 83,["87"] = 84,["88"] = 85,["90"] = 87,["91"] = 82,["92"] = 90,["93"] = 91,["94"] = 92,["96"] = 90,["97"] = 97,["98"] = 97,["100"] = 102,["101"] = 102,["102"] = 102,["103"] = 102,["104"] = 102,["105"] = 102,["106"] = 102,["107"] = 102,["108"] = 103,["109"] = 103,["110"] = 103,["111"] = 102,["112"] = 102,["113"] = 105,["114"] = 105,["115"] = 105,["116"] = 105,["117"] = 105,["118"] = 105,["119"] = 105,["120"] = 105,["121"] = 106,["122"] = 106,["123"] = 106,["124"] = 105,["125"] = 105,["126"] = 101,["127"] = 110,["128"] = 111,["129"] = 110,["130"] = 114,["131"] = 115,["132"] = 116,["134"] = 114,["135"] = 121,["136"] = 122,["137"] = 122,["138"] = 124,["139"] = 125,["140"] = 125,["141"] = 125,["142"] = 122,["143"] = 121,["144"] = 128,["145"] = 128,["146"] = 130,["147"] = 131,["148"] = 131,["149"] = 131,["150"] = 128,["151"] = 121,["152"] = 134,["153"] = 134,["154"] = 136,["155"] = 137,["156"] = 138,["157"] = 134,["158"] = 121,["159"] = 121,["160"] = 121,["161"] = 147,["162"] = 147,["163"] = 147,["165"] = 151,["166"] = 153,["167"] = 154,["168"] = 156,["169"] = 157,["170"] = 159,["172"] = 160,["173"] = 160,["174"] = 161,["175"] = 161,["176"] = 161,["177"] = 161,["178"] = 160,["181"] = 150,["182"] = 174,["183"] = 175,["184"] = 174,["185"] = 178,["186"] = 179,["187"] = 180,["189"] = 178});
local ____exports = {}
local ____campaignLevelPicker = require("campaignLevelPicker")
local CampaignLevelPicker = ____campaignLevelPicker.CampaignLevelPicker
local ____campaignLevels = require("campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
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
function Menu.prototype.getObjects(self)
    return self.buttons
end
function Menu.prototype.keypressed(self, key)
    if key == "escape" then
        love.event.quit(0)
    end
end
return ____exports
