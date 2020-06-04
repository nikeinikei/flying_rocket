--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 21,["16"] = 21,["17"] = 21,["18"] = 21,["19"] = 21,["20"] = 21,["21"] = 21,["22"] = 21,["23"] = 21,["24"] = 28,["25"] = 33,["26"] = 52,["27"] = 53,["28"] = 55,["29"] = 55,["30"] = 55,["31"] = 64,["32"] = 65,["33"] = 67,["34"] = 74,["35"] = 75,["36"] = 76,["38"] = 78,["39"] = 79,["40"] = 80,["41"] = 81,["42"] = 82,["44"] = 83,["45"] = 83,["46"] = 84,["47"] = 85,["48"] = 86,["49"] = 87,["50"] = 88,["51"] = 89,["52"] = 90,["53"] = 90,["54"] = 91,["55"] = 92,["56"] = 93,["57"] = 95,["58"] = 96,["61"] = 90,["62"] = 100,["63"] = 100,["64"] = 100,["65"] = 100,["66"] = 83,["71"] = 104,["72"] = 105,["73"] = 106,["74"] = 107,["75"] = 108,["76"] = 109,["77"] = 109,["78"] = 110,["79"] = 111,["81"] = 113,["82"] = 114,["84"] = 116,["86"] = 118,["88"] = 109,["89"] = 121,["90"] = 121,["91"] = 121,["92"] = 121,["94"] = 123,["95"] = 124,["96"] = 64,["97"] = 127,["98"] = 128,["99"] = 127,["100"] = 131,["101"] = 132,["102"] = 133,["104"] = 131,["105"] = 137,["106"] = 138,["107"] = 139,["109"] = 141,["110"] = 142,["111"] = 143,["112"] = 144,["114"] = 149,["116"] = 165,["122"] = 145,["123"] = 146,["129"] = 150,["130"] = 151,["131"] = 152,["132"] = 153,["134"] = 155,["136"] = 162,["142"] = 166,["143"] = 167,["144"] = 168,["145"] = 169,["147"] = 171,["149"] = 178,["155"] = 183,["156"] = 137,["157"] = 186,["158"] = 187,["159"] = 188,["160"] = 189,["163"] = 186,["164"] = 194,["165"] = 195,["166"] = 196,["167"] = 198,["168"] = 198,["169"] = 198,["171"] = 199,["172"] = 199,["173"] = 200,["174"] = 201,["175"] = 202,["176"] = 203,["177"] = 205,["178"] = 206,["180"] = 209,["181"] = 210,["182"] = 211,["183"] = 213,["184"] = 214,["185"] = 215,["188"] = 199,["191"] = 220,["192"] = 221,["193"] = 222,["194"] = 223,["196"] = 225,["197"] = 226,["200"] = 230,["201"] = 231,["202"] = 232,["204"] = 234,["205"] = 235,["208"] = 239,["209"] = 240,["210"] = 241,["212"] = 243,["213"] = 244,["214"] = 245,["215"] = 245,["216"] = 244,["217"] = 244,["218"] = 244,["219"] = 244,["221"] = 194});
local ____exports = {}
local ____campaignLevels = require("campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
local ____gridrenderer = require("gridrenderer")
local GridRenderer = ____gridrenderer.GridRenderer
local ____gui = require("gui")
local Button = ____gui.Button
local ____levelbuildercamera = require("levelbuildercamera")
local LevelBuilderCamera = ____levelbuildercamera.LevelBuilderCamera
local ____levels = require("levels")
local Levels = ____levels.Levels
local Mode = {}
Mode.TerrainBuilding = 0
Mode[Mode.TerrainBuilding] = "TerrainBuilding"
Mode.RocketStartingLocation = 1
Mode[Mode.RocketStartingLocation] = "RocketStartingLocation"
Mode.RocketLandingLocation = 2
Mode[Mode.RocketLandingLocation] = "RocketLandingLocation"
Mode.Inspection = 3
Mode[Mode.Inspection] = "Inspection"
local locationNotSetErrorMessage = "\nRocket starting location or landing location were not set\nThese are mandatory for the level to be saved.\n"
local buttonSchemes = {{name = "Inspection", mode = Mode.Inspection}, {name = "Starting location", mode = Mode.RocketStartingLocation}, {name = "Landing location", mode = Mode.RocketLandingLocation}, {name = "Add Terrain", mode = Mode.TerrainBuilding}}
local rocketLocationWidth = 200
local rocketLocationHeight = 20
____exports.LevelBuilder = __TS__Class()
local LevelBuilder = ____exports.LevelBuilder
LevelBuilder.name = "LevelBuilder"
function LevelBuilder.prototype.____constructor(self, name, campaignLevelInfo)
    self.campignLevelInfo = campaignLevelInfo
    self.level = {dataVersion = "0.0.2", name = name, terrainPoints = {}, rocketLandingLocation = nil, rocketStartingLocation = nil}
    self.mode = Mode.Inspection
    self.newMode = false
    self.buttons = {}
    do
        local startX = 10
        local buttonHeight = 30
        local buttonWidth = 200
        local buttonPadding = 20
        local distance = buttonWidth + buttonPadding
        do
            local i = 0
            while i < #buttonSchemes do
                local scheme = buttonSchemes[i + 1]
                local x = startX + (i * distance)
                local y = 0
                local w = buttonWidth
                local h = buttonHeight
                local text = scheme.name
                local callback
                callback = function()
                    if self.mode ~= scheme.mode then
                        self.mode = scheme.mode
                        self.newMode = true
                        if self.mode == Mode.TerrainBuilding then
                            __TS__ArrayPush(self.level.terrainPoints, {})
                        end
                    end
                end
                __TS__ArrayPush(
                    self.buttons,
                    __TS__New(Button, x, y, w, h, text, callback)
                )
                i = i + 1
            end
        end
    end
    do
        local w = 150
        local h = 30
        local x = (love.graphics.getWidth() - w) - 20
        local y = 0
        local text = "save"
        local callback
        callback = function()
            if (not self.level.rocketLandingLocation) or (not self.level.rocketStartingLocation) then
                love.window.showMessageBox("unable to save", locationNotSetErrorMessage, "error")
            else
                if campaignLevelInfo then
                    CampaignLevels.addLevel(self.level)
                else
                    Levels.addLevel(self.level)
                end
                Application.popState()
            end
        end
        __TS__ArrayPush(
            self.buttons,
            __TS__New(Button, x, y, w, h, text, callback)
        )
    end
    self.camera = __TS__New(LevelBuilderCamera)
    self.gridRenderer = __TS__New(GridRenderer, 250, self.camera)
end
function LevelBuilder.prototype.getObjects(self)
    return {self.camera}
end
function LevelBuilder.prototype.update(self, dt)
    for ____, button in ipairs(self.buttons) do
        button:update(dt)
    end
end
function LevelBuilder.prototype.mousepressed(self, mouseX, mouseY, button, istouch, presses)
    for ____, b in ipairs(self.buttons) do
        b:mousepressed(mouseX, mouseY, button, istouch, presses)
    end
    local worldX, worldY = self.camera:convertScreencoordinatesToWorldCoordinates(mouseX, mouseY)
    if self.newMode == false then
        local ____switch20 = self.mode
        if ____switch20 == Mode.TerrainBuilding then
            goto ____switch20_case_0
        elseif ____switch20 == Mode.RocketStartingLocation then
            goto ____switch20_case_1
        elseif ____switch20 == Mode.RocketLandingLocation then
            goto ____switch20_case_2
        end
        goto ____switch20_end
        ::____switch20_case_0::
        do
            if button == 1 then
                __TS__ArrayPush(self.level.terrainPoints[#self.level.terrainPoints], worldX, worldY)
            end
            goto ____switch20_end
        end
        ::____switch20_case_1::
        do
            if button == 1 then
                if self.level.rocketStartingLocation then
                    self.level.rocketStartingLocation.x = worldX
                    self.level.rocketStartingLocation.y = worldY
                else
                    self.level.rocketStartingLocation = {x = worldX, y = worldY, w = rocketLocationWidth, h = rocketLocationHeight}
                end
                self.mode = Mode.Inspection
            end
            goto ____switch20_end
        end
        ::____switch20_case_2::
        do
            if button == 1 then
                if self.level.rocketLandingLocation then
                    self.level.rocketLandingLocation.x = worldX
                    self.level.rocketLandingLocation.y = worldY
                else
                    self.level.rocketLandingLocation = {x = worldX, y = worldY, w = rocketLocationWidth, h = rocketLocationHeight}
                end
                self.mode = Mode.Inspection
            end
            goto ____switch20_end
        end
        ::____switch20_end::
    end
    self.newMode = false
end
function LevelBuilder.prototype.keypressed(self, key)
    if key == "escape" then
        if self.mode == Mode.TerrainBuilding then
            self.mode = Mode.Inspection
        end
    end
end
function LevelBuilder.prototype.draw(self)
    self.camera:apply()
    self.gridRenderer:draw()
    local worldX, worldY = self.camera:convertScreencoordinatesToWorldCoordinates(
        love.mouse.getPosition()
    )
    do
        local i = 0
        while i < #self.level.terrainPoints do
            local points = self.level.terrainPoints[i + 1]
            local isLast = i == (#self.level.terrainPoints - 1)
            if #points >= 2 then
                local terrainPreview = (self.mode == Mode.TerrainBuilding) and isLast
                if terrainPreview then
                    __TS__ArrayPush(points, worldX, worldY)
                end
                love.graphics.setColor(1, 0, 0, 1)
                love.graphics.setLineWidth(5)
                love.graphics.line(points)
                if terrainPreview then
                    table.remove(points)
                    table.remove(points)
                end
            end
            i = i + 1
        end
    end
    love.graphics.setColor(1, 1, 1, 1)
    local rect = self.level.rocketStartingLocation
    if self.mode == Mode.RocketStartingLocation then
        love.graphics.rectangle("fill", worldX, worldY, rocketLocationWidth, rocketLocationHeight)
    else
        if rect then
            love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
        end
    end
    rect = self.level.rocketLandingLocation
    if self.mode == Mode.RocketLandingLocation then
        love.graphics.rectangle("fill", worldX, worldY, rocketLocationWidth, rocketLocationHeight)
    else
        if rect then
            love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
        end
    end
    love.graphics.origin()
    for ____, button in ipairs(self.buttons) do
        button:draw()
    end
    if self.campignLevelInfo then
        love.graphics.print(
            "campaign level " .. tostring(
                tostring(self.campignLevelInfo.index)
            ),
            0,
            love.graphics.getHeight() - 15
        )
    end
end
return ____exports
