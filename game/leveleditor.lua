--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 14,["16"] = 14,["17"] = 14,["18"] = 14,["19"] = 14,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 22,["27"] = 27,["28"] = 50,["29"] = 51,["30"] = 53,["31"] = 54,["32"] = 56,["33"] = 56,["34"] = 56,["35"] = 56,["36"] = 68,["37"] = 56,["38"] = 63,["39"] = 64,["40"] = 70,["41"] = 71,["42"] = 72,["43"] = 73,["44"] = 74,["46"] = 76,["47"] = 77,["48"] = 78,["49"] = 79,["50"] = 80,["52"] = 81,["53"] = 81,["54"] = 82,["55"] = 83,["56"] = 84,["57"] = 85,["58"] = 86,["59"] = 87,["60"] = 88,["61"] = 88,["62"] = 89,["63"] = 88,["64"] = 91,["65"] = 91,["66"] = 91,["67"] = 91,["68"] = 81,["73"] = 95,["74"] = 96,["75"] = 97,["76"] = 98,["77"] = 99,["78"] = 100,["79"] = 100,["80"] = 101,["81"] = 102,["83"] = 104,["84"] = 106,["85"] = 107,["87"] = 100,["88"] = 110,["89"] = 110,["90"] = 110,["91"] = 110,["93"] = 112,["94"] = 113,["95"] = 114,["96"] = 68,["97"] = 117,["98"] = 118,["99"] = 117,["100"] = 121,["101"] = 122,["102"] = 123,["103"] = 124,["105"] = 126,["106"] = 127,["108"] = 130,["109"] = 131,["110"] = 133,["111"] = 134,["113"] = 136,["114"] = 137,["117"] = 121,["118"] = 147,["119"] = 148,["120"] = 147,["121"] = 151,["122"] = 152,["123"] = 153,["125"] = 151,["126"] = 157,["127"] = 158,["128"] = 159,["129"] = 160,["132"] = 163,["133"] = 157,["134"] = 166,["135"] = 167,["136"] = 168,["138"] = 170,["139"] = 171,["140"] = 172,["141"] = 173,["143"] = 182,["145"] = 198,["147"] = 211,["153"] = 174,["154"] = 175,["155"] = 176,["157"] = 178,["164"] = 183,["165"] = 184,["166"] = 185,["167"] = 186,["169"] = 188,["171"] = 195,["177"] = 199,["178"] = 200,["179"] = 201,["180"] = 202,["181"] = 203,["182"] = 204,["183"] = 205,["185"] = 207,["192"] = 212,["193"] = 213,["194"] = 214,["195"] = 215,["197"] = 217,["199"] = 224,["205"] = 229,["206"] = 166,["207"] = 232,["208"] = 233,["209"] = 234,["210"] = 235,["211"] = 236,["213"] = 238,["216"] = 232,["217"] = 243,["218"] = 244,["219"] = 245,["220"] = 243,["221"] = 248,["222"] = 249,["223"] = 250,["224"] = 248,["225"] = 253,["226"] = 254,["227"] = 255,["228"] = 253,["229"] = 258,["230"] = 259,["231"] = 260,["232"] = 260,["233"] = 260,["234"] = 261,["235"] = 262,["236"] = 264,["237"] = 264,["238"] = 264,["239"] = 266,["240"] = 267,["241"] = 268,["242"] = 269,["243"] = 270,["244"] = 272,["245"] = 274,["246"] = 275,["250"] = 278,["251"] = 278,["252"] = 279,["253"] = 278,["256"] = 282,["257"] = 283,["258"] = 284,["259"] = 285,["261"] = 287,["262"] = 288,["265"] = 292,["266"] = 293,["267"] = 294,["269"] = 296,["270"] = 297,["273"] = 301,["274"] = 302,["275"] = 303,["277"] = 305,["278"] = 306,["280"] = 309,["281"] = 311,["282"] = 312,["283"] = 313,["285"] = 258});
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
function LevelEditor.prototype.____constructor(self, level, callback)
    GameState.prototype.____constructor(self)
    self.currentTerrain = nil
    self.currentRefuelStation = nil
    self.callback = callback
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
                Application.popState()
                self.callback(self.level)
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
function LevelEditor.prototype.keypressed(self, key)
    if key == "escape" then
        if self.mode == Mode.Inspection then
            self.callback(nil)
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
