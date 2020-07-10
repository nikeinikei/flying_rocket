--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 13,["24"] = 13,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 21,["30"] = 23,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 24,["39"] = 25,["41"] = 27,["42"] = 28,["44"] = 30,["45"] = 31,["46"] = 32,["47"] = 33,["48"] = 34,["50"] = 40,["51"] = 42,["52"] = 43,["53"] = 43,["54"] = 43,["55"] = 43,["56"] = 44,["57"] = 45,["59"] = 43,["60"] = 42,["61"] = 42,["64"] = 51,["65"] = 53,["66"] = 54,["67"] = 54,["68"] = 54,["69"] = 54,["70"] = 55,["71"] = 56,["73"] = 54,["74"] = 53,["75"] = 53,["79"] = 23,["80"] = 23,["81"] = 65,["82"] = 66,["84"] = 68,["86"] = 17,["87"] = 72,["88"] = 73,["89"] = 74,["90"] = 75,["92"] = 77,["93"] = 72,["94"] = 80,["95"] = 81,["96"] = 82,["98"] = 80,["99"] = 87,["100"] = 87,["101"] = 87,["103"] = 92,["104"] = 92,["105"] = 92,["106"] = 92,["107"] = 92,["108"] = 92,["109"] = 92,["110"] = 92,["111"] = 93,["112"] = 93,["113"] = 93,["114"] = 92,["115"] = 92,["116"] = 95,["117"] = 95,["118"] = 95,["119"] = 95,["120"] = 95,["121"] = 95,["122"] = 95,["123"] = 95,["124"] = 96,["125"] = 96,["126"] = 96,["127"] = 95,["128"] = 95,["129"] = 91,["130"] = 100,["131"] = 101,["132"] = 100,["133"] = 104,["134"] = 105,["135"] = 104,["136"] = 108,["137"] = 109,["138"] = 110,["140"] = 108,["141"] = 115,["142"] = 116,["143"] = 116,["144"] = 118,["145"] = 119,["146"] = 119,["147"] = 119,["148"] = 116,["149"] = 115,["150"] = 122,["151"] = 122,["152"] = 124,["153"] = 125,["154"] = 125,["155"] = 125,["156"] = 122,["157"] = 115,["158"] = 128,["159"] = 128,["160"] = 130,["161"] = 131,["162"] = 132,["163"] = 128,["164"] = 115,["165"] = 115,["166"] = 115,["167"] = 141,["168"] = 141,["169"] = 141,["171"] = 145,["172"] = 147,["173"] = 148,["174"] = 150,["175"] = 151,["176"] = 153,["178"] = 154,["179"] = 154,["180"] = 155,["181"] = 155,["182"] = 155,["183"] = 155,["184"] = 154,["187"] = 144,["188"] = 168,["189"] = 169,["190"] = 168,["191"] = 172,["192"] = 173,["193"] = 172,["194"] = 176,["195"] = 177,["196"] = 178,["198"] = 176});
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
