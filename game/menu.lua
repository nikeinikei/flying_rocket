--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 11,["24"] = 11,["25"] = 14,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 19,["30"] = 14,["31"] = 17,["32"] = 21,["34"] = 21,["38"] = 21,["39"] = 22,["40"] = 23,["41"] = 24,["42"] = 25,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 27,["47"] = 27,["48"] = 27,["49"] = 27,["50"] = 27,["51"] = 28,["52"] = 29,["54"] = 31,["55"] = 32,["57"] = 34,["58"] = 35,["59"] = 36,["60"] = 37,["62"] = 43,["63"] = 45,["64"] = 46,["65"] = 46,["66"] = 46,["69"] = 49,["70"] = 51,["71"] = 52,["72"] = 52,["73"] = 52,["77"] = 27,["78"] = 27,["79"] = 57,["80"] = 58,["82"] = 61,["83"] = 62,["85"] = 64,["87"] = 19,["88"] = 68,["89"] = 14,["90"] = 70,["91"] = 71,["92"] = 72,["93"] = 73,["94"] = 74,["95"] = 75,["98"] = 78,["99"] = 68,["100"] = 81,["101"] = 82,["102"] = 81,["103"] = 85,["104"] = 86,["105"] = 86,["106"] = 86,["107"] = 86,["108"] = 86,["109"] = 85,["110"] = 93,["111"] = 94,["112"] = 95,["113"] = 96,["115"] = 98,["116"] = 93,["117"] = 101,["118"] = 102,["119"] = 103,["121"] = 101,["122"] = 108,["123"] = 108,["124"] = 108,["125"] = 108,["127"] = 108,["128"] = 114,["129"] = 114,["130"] = 114,["131"] = 114,["132"] = 114,["133"] = 114,["134"] = 114,["135"] = 114,["136"] = 115,["137"] = 115,["138"] = 115,["139"] = 114,["140"] = 114,["141"] = 117,["142"] = 117,["143"] = 117,["144"] = 117,["145"] = 117,["146"] = 117,["147"] = 117,["148"] = 117,["149"] = 118,["150"] = 118,["151"] = 118,["152"] = 117,["153"] = 117,["154"] = 112,["155"] = 122,["156"] = 123,["157"] = 122,["158"] = 126,["159"] = 127,["160"] = 126,["161"] = 130,["162"] = 131,["163"] = 130,["164"] = 134,["165"] = 135,["166"] = 136,["168"] = 134,["169"] = 141,["170"] = 142,["171"] = 142,["172"] = 144,["173"] = 145,["174"] = 145,["175"] = 145,["176"] = 142,["177"] = 141,["178"] = 148,["179"] = 148,["180"] = 150,["181"] = 151,["182"] = 151,["183"] = 151,["184"] = 148,["185"] = 141,["186"] = 154,["187"] = 154,["188"] = 156,["189"] = 157,["190"] = 158,["191"] = 154,["192"] = 141,["193"] = 141,["194"] = 141,["195"] = 167,["196"] = 167,["197"] = 167,["198"] = 167,["200"] = 167,["201"] = 172,["202"] = 174,["203"] = 175,["204"] = 177,["205"] = 178,["206"] = 180,["208"] = 181,["209"] = 181,["210"] = 182,["211"] = 182,["212"] = 182,["213"] = 182,["214"] = 181,["217"] = 170,["218"] = 195,["219"] = 196,["220"] = 195,["221"] = 199,["222"] = 200,["223"] = 199,["224"] = 203,["225"] = 204,["226"] = 203,["227"] = 207,["228"] = 208,["229"] = 209,["231"] = 207});
local ____exports = {}
local ____campaignLevelPicker = require("campaignLevelPicker")
local CampaignLevelPicker = ____campaignLevelPicker.CampaignLevelPicker
local ____campaignLevels = require("campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
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
local ____levels = require("levels")
local Levels = ____levels.Levels
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
