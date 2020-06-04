--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 21,["16"] = 21,["17"] = 21,["18"] = 21,["19"] = 21,["20"] = 21,["21"] = 21,["22"] = 21,["23"] = 21,["24"] = 28,["25"] = 33,["26"] = 52,["27"] = 53,["28"] = 55,["29"] = 55,["30"] = 55,["31"] = 64,["32"] = 65,["33"] = 67,["34"] = 68,["36"] = 76,["37"] = 77,["39"] = 79,["40"] = 80,["41"] = 81,["43"] = 83,["44"] = 84,["45"] = 85,["46"] = 86,["47"] = 87,["49"] = 88,["50"] = 88,["51"] = 89,["52"] = 90,["53"] = 91,["54"] = 92,["55"] = 93,["56"] = 94,["57"] = 95,["58"] = 95,["59"] = 96,["60"] = 97,["61"] = 98,["62"] = 100,["63"] = 101,["66"] = 95,["67"] = 105,["68"] = 105,["69"] = 105,["70"] = 105,["71"] = 88,["76"] = 109,["77"] = 110,["78"] = 111,["79"] = 112,["80"] = 113,["81"] = 114,["82"] = 114,["83"] = 115,["84"] = 116,["86"] = 118,["87"] = 119,["89"] = 121,["91"] = 123,["93"] = 114,["94"] = 126,["95"] = 126,["96"] = 126,["97"] = 126,["99"] = 128,["100"] = 129,["101"] = 64,["102"] = 132,["103"] = 133,["104"] = 132,["105"] = 136,["106"] = 137,["107"] = 138,["109"] = 136,["110"] = 142,["111"] = 143,["112"] = 144,["114"] = 146,["115"] = 147,["116"] = 148,["117"] = 149,["119"] = 154,["121"] = 170,["127"] = 150,["128"] = 151,["134"] = 155,["135"] = 156,["136"] = 157,["137"] = 158,["139"] = 160,["141"] = 167,["147"] = 171,["148"] = 172,["149"] = 173,["150"] = 174,["152"] = 176,["154"] = 183,["160"] = 188,["161"] = 142,["162"] = 191,["163"] = 192,["164"] = 193,["165"] = 194,["168"] = 191,["169"] = 199,["170"] = 200,["171"] = 201,["172"] = 203,["173"] = 203,["174"] = 203,["176"] = 204,["177"] = 204,["178"] = 205,["179"] = 206,["180"] = 207,["181"] = 208,["182"] = 210,["183"] = 211,["185"] = 214,["186"] = 215,["187"] = 216,["188"] = 218,["189"] = 219,["190"] = 220,["193"] = 204,["196"] = 225,["197"] = 226,["198"] = 227,["199"] = 228,["201"] = 230,["202"] = 231,["205"] = 235,["206"] = 236,["207"] = 237,["209"] = 239,["210"] = 240,["213"] = 244,["214"] = 245,["215"] = 246,["217"] = 248,["218"] = 249,["219"] = 250,["220"] = 250,["221"] = 249,["222"] = 249,["223"] = 249,["224"] = 249,["226"] = 199});
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
function LevelBuilder.prototype.____constructor(self, nameOrLevel, campaignLevelInfo)
    self.campignLevelInfo = campaignLevelInfo
    if type(nameOrLevel) == "string" then
        self.level = {dataVersion = "0.0.2", name = nameOrLevel, terrainPoints = {}, rocketLandingLocation = nil, rocketStartingLocation = nil}
    else
        local level = nameOrLevel
        self.level = level
    end
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
        local ____switch22 = self.mode
        if ____switch22 == Mode.TerrainBuilding then
            goto ____switch22_case_0
        elseif ____switch22 == Mode.RocketStartingLocation then
            goto ____switch22_case_1
        elseif ____switch22 == Mode.RocketLandingLocation then
            goto ____switch22_case_2
        end
        goto ____switch22_end
        ::____switch22_case_0::
        do
            if button == 1 then
                __TS__ArrayPush(self.level.terrainPoints[#self.level.terrainPoints], worldX, worldY)
            end
            goto ____switch22_end
        end
        ::____switch22_case_1::
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
            goto ____switch22_end
        end
        ::____switch22_case_2::
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
            goto ____switch22_end
        end
        ::____switch22_end::
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
