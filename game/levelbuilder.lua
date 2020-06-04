--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 21,["16"] = 21,["17"] = 21,["18"] = 21,["19"] = 21,["20"] = 21,["21"] = 21,["22"] = 21,["23"] = 21,["24"] = 28,["25"] = 33,["26"] = 52,["27"] = 53,["28"] = 55,["29"] = 55,["30"] = 55,["31"] = 65,["32"] = 63,["33"] = 66,["34"] = 68,["35"] = 69,["37"] = 77,["38"] = 78,["40"] = 80,["41"] = 81,["42"] = 82,["44"] = 84,["45"] = 85,["46"] = 86,["47"] = 87,["48"] = 88,["50"] = 89,["51"] = 89,["52"] = 90,["53"] = 91,["54"] = 92,["55"] = 93,["56"] = 94,["57"] = 95,["58"] = 96,["59"] = 96,["60"] = 97,["61"] = 96,["62"] = 99,["63"] = 99,["64"] = 99,["65"] = 99,["66"] = 89,["71"] = 103,["72"] = 104,["73"] = 105,["74"] = 106,["75"] = 107,["76"] = 108,["77"] = 108,["78"] = 109,["79"] = 110,["81"] = 112,["82"] = 114,["83"] = 115,["85"] = 117,["87"] = 119,["89"] = 108,["90"] = 122,["91"] = 122,["92"] = 122,["93"] = 122,["95"] = 124,["96"] = 125,["97"] = 65,["98"] = 128,["99"] = 129,["100"] = 130,["101"] = 131,["103"] = 134,["104"] = 135,["105"] = 137,["106"] = 138,["109"] = 128,["110"] = 143,["111"] = 144,["112"] = 143,["113"] = 147,["114"] = 148,["115"] = 149,["117"] = 147,["118"] = 153,["119"] = 154,["120"] = 155,["121"] = 156,["124"] = 159,["125"] = 153,["126"] = 162,["127"] = 163,["128"] = 164,["130"] = 166,["131"] = 167,["132"] = 168,["133"] = 169,["135"] = 178,["137"] = 194,["143"] = 170,["144"] = 171,["145"] = 172,["147"] = 174,["154"] = 179,["155"] = 180,["156"] = 181,["157"] = 182,["159"] = 184,["161"] = 191,["167"] = 195,["168"] = 196,["169"] = 197,["170"] = 198,["172"] = 200,["174"] = 207,["180"] = 212,["181"] = 162,["182"] = 215,["183"] = 216,["184"] = 217,["186"] = 215,["187"] = 221,["188"] = 222,["189"] = 223,["190"] = 225,["191"] = 225,["192"] = 225,["193"] = 227,["194"] = 228,["195"] = 229,["196"] = 230,["197"] = 231,["198"] = 233,["199"] = 235,["200"] = 236,["204"] = 239,["205"] = 239,["206"] = 240,["207"] = 239,["210"] = 243,["211"] = 244,["212"] = 245,["213"] = 246,["215"] = 248,["216"] = 249,["219"] = 253,["220"] = 254,["221"] = 255,["223"] = 257,["224"] = 258,["227"] = 262,["228"] = 263,["229"] = 264,["231"] = 266,["232"] = 267,["233"] = 268,["234"] = 268,["235"] = 267,["236"] = 267,["237"] = 267,["238"] = 267,["240"] = 221});
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
    self.currentTerrain = nil
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
                    self:setNewMode(scheme.mode)
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
                self:setNewMode(Mode.Inspection)
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
function LevelBuilder.prototype.setNewMode(self, newMode)
    if self.mode ~= newMode then
        if self.mode == Mode.TerrainBuilding then
            self:postTerrainBuilding()
        end
        self.mode = newMode
        self.newMode = true
        if self.mode == Mode.TerrainBuilding then
            self.currentTerrain = {}
        end
    end
end
function LevelBuilder.prototype.getObjects(self)
    return {self.camera}
end
function LevelBuilder.prototype.update(self, dt)
    for ____, button in ipairs(self.buttons) do
        button:update(dt)
    end
end
function LevelBuilder.prototype.postTerrainBuilding(self)
    if self.currentTerrain then
        if #self.currentTerrain >= 4 then
            __TS__ArrayPush(self.level.terrainPoints, self.currentTerrain)
        end
    end
    self.currentTerrain = nil
end
function LevelBuilder.prototype.mousepressed(self, mouseX, mouseY, button, istouch, presses)
    for ____, b in ipairs(self.buttons) do
        b:mousepressed(mouseX, mouseY, button, istouch, presses)
    end
    local worldX, worldY = self.camera:convertScreencoordinatesToWorldCoordinates(mouseX, mouseY)
    if self.newMode == false then
        local ____switch27 = self.mode
        if ____switch27 == Mode.TerrainBuilding then
            goto ____switch27_case_0
        elseif ____switch27 == Mode.RocketStartingLocation then
            goto ____switch27_case_1
        elseif ____switch27 == Mode.RocketLandingLocation then
            goto ____switch27_case_2
        end
        goto ____switch27_end
        ::____switch27_case_0::
        do
            if button == 1 then
                if not self.currentTerrain then
                    error("this shouldn't happen")
                else
                    __TS__ArrayPush(self.currentTerrain, worldX, worldY)
                end
            end
            goto ____switch27_end
        end
        ::____switch27_case_1::
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
            goto ____switch27_end
        end
        ::____switch27_case_2::
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
            goto ____switch27_end
        end
        ::____switch27_end::
    end
    self.newMode = false
end
function LevelBuilder.prototype.keypressed(self, key)
    if key == "escape" then
        self:setNewMode(Mode.Inspection)
    end
end
function LevelBuilder.prototype.draw(self)
    self.camera:apply()
    self.gridRenderer:draw()
    local worldX, worldY = self.camera:convertScreencoordinatesToWorldCoordinates(
        love.mouse.getPosition()
    )
    love.graphics.setColor(1, 0, 0, 1)
    love.graphics.setLineWidth(5)
    if self.currentTerrain then
        if #self.currentTerrain >= 2 then
            __TS__ArrayPush(self.currentTerrain, worldX, worldY)
            love.graphics.line(self.currentTerrain)
            table.remove(self.currentTerrain)
            table.remove(self.currentTerrain)
        end
    end
    do
        local i = 0
        while i < #self.level.terrainPoints do
            love.graphics.line(self.level.terrainPoints[i + 1])
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
