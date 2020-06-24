--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 12,["24"] = 12,["26"] = 17,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 22,["31"] = 22,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 22,["36"] = 22,["37"] = 22,["38"] = 23,["39"] = 24,["41"] = 26,["42"] = 27,["44"] = 29,["45"] = 30,["46"] = 31,["47"] = 32,["48"] = 33,["50"] = 39,["51"] = 41,["52"] = 42,["53"] = 42,["54"] = 42,["55"] = 42,["56"] = 43,["57"] = 44,["59"] = 42,["60"] = 41,["61"] = 41,["64"] = 50,["65"] = 52,["66"] = 53,["67"] = 53,["68"] = 53,["69"] = 53,["70"] = 54,["71"] = 55,["73"] = 53,["74"] = 52,["75"] = 52,["79"] = 22,["80"] = 22,["81"] = 64,["82"] = 65,["84"] = 67,["86"] = 16,["87"] = 71,["88"] = 72,["89"] = 73,["90"] = 74,["92"] = 76,["93"] = 71,["94"] = 79,["95"] = 80,["96"] = 81,["98"] = 79,["99"] = 86,["100"] = 86,["102"] = 91,["103"] = 91,["104"] = 91,["105"] = 91,["106"] = 91,["107"] = 91,["108"] = 91,["109"] = 91,["110"] = 92,["111"] = 92,["112"] = 92,["113"] = 91,["114"] = 91,["115"] = 94,["116"] = 94,["117"] = 94,["118"] = 94,["119"] = 94,["120"] = 94,["121"] = 94,["122"] = 94,["123"] = 95,["124"] = 95,["125"] = 95,["126"] = 94,["127"] = 94,["128"] = 90,["129"] = 99,["130"] = 100,["131"] = 99,["132"] = 103,["133"] = 104,["134"] = 105,["136"] = 103,["137"] = 110,["138"] = 111,["139"] = 111,["140"] = 113,["141"] = 114,["142"] = 114,["143"] = 114,["144"] = 111,["145"] = 110,["146"] = 117,["147"] = 117,["148"] = 119,["149"] = 120,["150"] = 120,["151"] = 120,["152"] = 117,["153"] = 110,["154"] = 123,["155"] = 123,["156"] = 125,["157"] = 126,["158"] = 127,["159"] = 123,["160"] = 110,["161"] = 110,["162"] = 110,["163"] = 136,["164"] = 136,["165"] = 136,["167"] = 140,["168"] = 142,["169"] = 143,["170"] = 145,["171"] = 146,["172"] = 148,["174"] = 149,["175"] = 149,["176"] = 150,["177"] = 150,["178"] = 150,["179"] = 150,["180"] = 149,["183"] = 139,["184"] = 163,["185"] = 164,["186"] = 163,["187"] = 167,["188"] = 168,["189"] = 169,["191"] = 167});
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
local ____level = require("level")
local newLevel = ____level.newLevel
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
