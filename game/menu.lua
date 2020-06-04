--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 10,["20"] = 10,["22"] = 15,["23"] = 16,["24"] = 17,["25"] = 18,["26"] = 20,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 20,["31"] = 20,["32"] = 20,["33"] = 20,["34"] = 21,["35"] = 22,["37"] = 24,["38"] = 25,["40"] = 27,["41"] = 28,["42"] = 29,["43"] = 30,["44"] = 31,["46"] = 37,["47"] = 37,["48"] = 37,["51"] = 44,["52"] = 44,["53"] = 44,["57"] = 20,["58"] = 20,["59"] = 50,["60"] = 51,["62"] = 53,["64"] = 14,["65"] = 57,["66"] = 58,["67"] = 59,["68"] = 60,["70"] = 62,["71"] = 57,["72"] = 65,["73"] = 66,["74"] = 67,["76"] = 65,["77"] = 72,["78"] = 72,["80"] = 77,["81"] = 77,["82"] = 77,["83"] = 77,["84"] = 77,["85"] = 77,["86"] = 77,["87"] = 77,["88"] = 78,["89"] = 78,["90"] = 78,["91"] = 77,["92"] = 77,["93"] = 80,["94"] = 80,["95"] = 80,["96"] = 80,["97"] = 80,["98"] = 80,["99"] = 80,["100"] = 80,["101"] = 81,["102"] = 81,["103"] = 81,["104"] = 80,["105"] = 80,["106"] = 76,["107"] = 85,["108"] = 86,["109"] = 85,["110"] = 89,["111"] = 90,["112"] = 91,["114"] = 89,["115"] = 96,["116"] = 97,["117"] = 97,["118"] = 99,["119"] = 100,["120"] = 100,["121"] = 100,["122"] = 97,["123"] = 96,["124"] = 103,["125"] = 103,["126"] = 105,["127"] = 106,["128"] = 106,["129"] = 106,["130"] = 103,["131"] = 96,["132"] = 109,["133"] = 109,["134"] = 111,["135"] = 112,["136"] = 109,["137"] = 96,["138"] = 96,["139"] = 96,["140"] = 121,["141"] = 121,["142"] = 121,["144"] = 125,["145"] = 127,["146"] = 128,["147"] = 130,["148"] = 131,["149"] = 133,["151"] = 134,["152"] = 134,["153"] = 135,["154"] = 135,["155"] = 135,["156"] = 135,["157"] = 134,["160"] = 124,["161"] = 148,["162"] = 149,["163"] = 148,["164"] = 152,["165"] = 153,["166"] = 154,["168"] = 152});
local ____exports = {}
local ____campaignLevelPicker = require("campaignLevelPicker")
local CampaignLevelPicker = ____campaignLevelPicker.CampaignLevelPicker
local ____gui = require("gui")
local Button = ____gui.Button
local TextInput = ____gui.TextInput
local Toggle = ____gui.Toggle
local ____levelbuilder = require("levelbuilder")
local LevelBuilder = ____levelbuilder.LevelBuilder
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
                            Application.pushState(
                                __TS__New(LevelBuilder, name, {index = index})
                            )
                        end
                    else
                        Application.pushState(
                            __TS__New(LevelBuilder, name)
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
