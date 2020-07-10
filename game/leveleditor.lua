--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 14,["16"] = 14,["17"] = 14,["18"] = 14,["19"] = 14,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 22,["27"] = 27,["28"] = 50,["29"] = 51,["30"] = 53,["31"] = 54,["32"] = 56,["33"] = 56,["34"] = 56,["35"] = 56,["36"] = 68,["37"] = 56,["38"] = 63,["39"] = 64,["40"] = 66,["41"] = 70,["42"] = 71,["43"] = 72,["44"] = 73,["46"] = 75,["47"] = 76,["48"] = 77,["49"] = 78,["50"] = 79,["52"] = 80,["53"] = 80,["54"] = 81,["55"] = 82,["56"] = 83,["57"] = 84,["58"] = 85,["59"] = 86,["60"] = 87,["61"] = 87,["62"] = 88,["63"] = 87,["64"] = 90,["65"] = 90,["66"] = 90,["67"] = 90,["68"] = 80,["73"] = 94,["74"] = 95,["75"] = 96,["76"] = 97,["77"] = 98,["78"] = 99,["79"] = 99,["80"] = 100,["81"] = 101,["83"] = 103,["84"] = 105,["85"] = 106,["87"] = 99,["88"] = 109,["89"] = 109,["90"] = 109,["91"] = 109,["93"] = 111,["94"] = 112,["95"] = 113,["96"] = 68,["97"] = 116,["98"] = 117,["99"] = 116,["100"] = 120,["101"] = 121,["102"] = 122,["103"] = 123,["105"] = 125,["106"] = 126,["108"] = 129,["109"] = 130,["110"] = 132,["111"] = 133,["113"] = 135,["114"] = 136,["117"] = 120,["118"] = 146,["119"] = 147,["120"] = 146,["121"] = 150,["122"] = 151,["123"] = 152,["125"] = 150,["126"] = 156,["127"] = 157,["128"] = 158,["129"] = 159,["132"] = 162,["133"] = 156,["134"] = 165,["135"] = 166,["136"] = 167,["138"] = 169,["139"] = 170,["140"] = 171,["141"] = 172,["143"] = 181,["145"] = 197,["147"] = 210,["153"] = 173,["154"] = 174,["155"] = 175,["157"] = 177,["164"] = 182,["165"] = 183,["166"] = 184,["167"] = 185,["169"] = 187,["171"] = 194,["177"] = 198,["178"] = 199,["179"] = 200,["180"] = 201,["181"] = 202,["182"] = 203,["183"] = 204,["185"] = 206,["192"] = 211,["193"] = 212,["194"] = 213,["195"] = 214,["197"] = 216,["199"] = 223,["205"] = 228,["206"] = 165,["207"] = 231,["208"] = 232,["209"] = 233,["211"] = 235,["213"] = 231,["214"] = 239,["215"] = 240,["216"] = 241,["217"] = 242,["219"] = 244,["222"] = 239,["223"] = 249,["224"] = 250,["225"] = 251,["226"] = 249,["227"] = 254,["228"] = 255,["229"] = 256,["230"] = 254,["231"] = 259,["232"] = 260,["233"] = 261,["234"] = 259,["235"] = 264,["236"] = 265,["237"] = 266,["238"] = 266,["239"] = 266,["240"] = 267,["241"] = 268,["242"] = 270,["243"] = 270,["244"] = 270,["245"] = 272,["246"] = 273,["247"] = 274,["248"] = 275,["249"] = 276,["250"] = 278,["251"] = 280,["252"] = 281,["256"] = 284,["257"] = 284,["258"] = 285,["259"] = 284,["262"] = 288,["263"] = 289,["264"] = 290,["265"] = 291,["267"] = 293,["268"] = 294,["271"] = 298,["272"] = 299,["273"] = 300,["275"] = 302,["276"] = 303,["279"] = 307,["280"] = 308,["281"] = 309,["283"] = 311,["284"] = 312,["286"] = 315,["287"] = 317,["288"] = 318,["289"] = 319,["291"] = 264});
local ____exports = {}
local ____gridrenderer = require("gridrenderer")
local GridRenderer = ____gridrenderer.GridRenderer
local ____gui = require("gui")
local Button = ____gui.Button
local ____leveleditorcamera = require("leveleditorcamera")
local LevelBuilderCamera = ____leveleditorcamera.LevelBuilderCamera
local ____stars = require("stars")
local Stars = ____stars.Stars
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local Mode = {}
Mode.TerrainBuilding = 0
Mode[Mode.TerrainBuilding] = "TerrainBuilding"
Mode.RocketStartingLocation = 1
Mode[Mode.RocketStartingLocation] = "RocketStartingLocation"
Mode.RocketLandingLocation = 2
Mode[Mode.RocketLandingLocation] = "RocketLandingLocation"
Mode.AddRefuelStation = 3
Mode[Mode.AddRefuelStation] = "AddRefuelStation"
Mode.Inspection = 4
Mode[Mode.Inspection] = "Inspection"
local locationNotSetErrorMessage = "\nRocket starting location or landing location were not set\nThese are mandatory for the level to be saved.\n"
local buttonSchemes = {{name = "Inspection", mode = Mode.Inspection}, {name = "Starting location", mode = Mode.RocketStartingLocation}, {name = "Landing location", mode = Mode.RocketLandingLocation}, {name = "Add Refuel Station", mode = Mode.AddRefuelStation}, {name = "Add Terrain", mode = Mode.TerrainBuilding}}
local rocketLocationWidth = 200
local rocketLocationHeight = 20
local refuelStationWidth = 200
local refuelStationHeight = 20
____exports.LevelEditor = __TS__Class()
local LevelEditor = ____exports.LevelEditor
LevelEditor.name = "LevelEditor"
__TS__ClassExtends(LevelEditor, GameState)
function LevelEditor.prototype.____constructor(self, level)
    GameState.prototype.____constructor(self)
    self.currentTerrain = nil
    self.currentRefuelStation = nil
    self.success = false
    self.level = level
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
                self.success = true
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
    self.stars = __TS__New(Stars)
end
function LevelEditor.prototype.getName(self)
    return "LevelEditor"
end
function LevelEditor.prototype.setNewMode(self, newMode)
    if self.mode ~= newMode then
        if self.mode == Mode.TerrainBuilding then
            self:postTerrainBuilding()
        end
        if self.mode == Mode.AddRefuelStation then
            self.currentRefuelStation = nil
        end
        self.mode = newMode
        self.newMode = true
        if self.mode == Mode.TerrainBuilding then
            self.currentTerrain = {}
        end
        if self.mode == Mode.AddRefuelStation then
            self.currentRefuelStation = {x = 0, y = 0, w = refuelStationWidth, h = refuelStationHeight}
        end
    end
end
function LevelEditor.prototype.getObjects(self)
    return {self.camera}
end
function LevelEditor.prototype.update(self, dt)
    for ____, button in ipairs(self.buttons) do
        button:update(dt)
    end
end
function LevelEditor.prototype.postTerrainBuilding(self)
    if self.currentTerrain then
        if #self.currentTerrain >= 4 then
            __TS__ArrayPush(self.level.terrainPoints, self.currentTerrain)
        end
    end
    self.currentTerrain = nil
end
function LevelEditor.prototype.mousepressed(self, mouseX, mouseY, button, istouch, presses)
    for ____, b in ipairs(self.buttons) do
        b:mousepressed(mouseX, mouseY, button, istouch, presses)
    end
    local worldX, worldY = self.camera:convertScreencoordinatesToWorldCoordinates(mouseX, mouseY)
    if self.newMode == false then
        local ____switch26 = self.mode
        if ____switch26 == Mode.TerrainBuilding then
            goto ____switch26_case_0
        elseif ____switch26 == Mode.RocketStartingLocation then
            goto ____switch26_case_1
        elseif ____switch26 == Mode.AddRefuelStation then
            goto ____switch26_case_2
        elseif ____switch26 == Mode.RocketLandingLocation then
            goto ____switch26_case_3
        end
        goto ____switch26_end
        ::____switch26_case_0::
        do
            if button == 1 then
                if not self.currentTerrain then
                    error("this shouldn't happen")
                else
                    __TS__ArrayPush(self.currentTerrain, worldX, worldY)
                end
            end
            goto ____switch26_end
        end
        ::____switch26_case_1::
        do
            if button == 1 then
                if self.level.rocketStartingLocation then
                    self.level.rocketStartingLocation.x = worldX
                    self.level.rocketStartingLocation.y = worldY
                else
                    self.level.rocketStartingLocation = {x = worldX, y = worldY, w = rocketLocationWidth, h = rocketLocationHeight}
                end
                self:setNewMode(Mode.Inspection)
            end
            goto ____switch26_end
        end
        ::____switch26_case_2::
        do
            if button == 1 then
                if self.currentRefuelStation then
                    self.currentRefuelStation.x = worldX
                    self.currentRefuelStation.y = worldY
                    __TS__ArrayPush(self.level.refuelStations, self.currentRefuelStation)
                    self.currentRefuelStation = nil
                    self:setNewMode(Mode.Inspection)
                else
                    assert(self.currentRefuelStation, "this.mode != Mode.AddRefuelStation")
                end
            end
            goto ____switch26_end
        end
        ::____switch26_case_3::
        do
            if button == 1 then
                if self.level.rocketLandingLocation then
                    self.level.rocketLandingLocation.x = worldX
                    self.level.rocketLandingLocation.y = worldY
                else
                    self.level.rocketLandingLocation = {x = worldX, y = worldY, w = rocketLocationWidth, h = rocketLocationHeight}
                end
                self:setNewMode(Mode.Inspection)
            end
            goto ____switch26_end
        end
        ::____switch26_end::
    end
    self.newMode = false
end
function LevelEditor.prototype.leave(self)
    if self.success then
        return self.level
    else
        return nil
    end
end
function LevelEditor.prototype.keypressed(self, key)
    if key == "escape" then
        if self.mode == Mode.Inspection then
            Application.popState()
        else
            self:setNewMode(Mode.Inspection)
        end
    end
end
function LevelEditor.prototype.drawStartingLocation(self, x, y, w, h)
    love.graphics.setColor(0, 1, 0, 1)
    love.graphics.rectangle("fill", x, y, w, h)
end
function LevelEditor.prototype.drawLandingLocation(self, x, y, w, h)
    love.graphics.setColor(0, 0, 1, 1)
    love.graphics.rectangle("fill", x, y, w, h)
end
function LevelEditor.prototype.drawRefuelStation(self, x, y, w, h)
    love.graphics.setColor(0.7, 0.7, 0.7, 1)
    love.graphics.rectangle("fill", x, y, w, h)
end
function LevelEditor.prototype.draw(self)
    self.camera:apply()
    self.stars:setViewport(
        self.camera:getViewport()
    )
    self.stars:draw()
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
        self:drawStartingLocation(worldX, worldY, rocketLocationWidth, rocketLocationHeight)
    else
        if rect then
            self:drawStartingLocation(rect.x, rect.y, rect.w, rect.h)
        end
    end
    rect = self.level.rocketLandingLocation
    if self.mode == Mode.RocketLandingLocation then
        self:drawLandingLocation(worldX, worldY, rocketLocationWidth, rocketLocationHeight)
    else
        if rect then
            self:drawLandingLocation(rect.x, rect.y, rect.w, rect.h)
        end
    end
    rect = self.currentRefuelStation
    if rect then
        self:drawRefuelStation(worldX, worldY, rect.w, rect.h)
    end
    for ____, refuelStation in ipairs(self.level.refuelStations) do
        self:drawRefuelStation(refuelStation.x, refuelStation.y, refuelStation.w, refuelStation.h)
    end
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.origin()
    for ____, button in ipairs(self.buttons) do
        button:draw()
    end
end
return ____exports
