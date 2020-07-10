--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 15,["16"] = 15,["17"] = 15,["18"] = 15,["19"] = 15,["20"] = 15,["21"] = 15,["22"] = 15,["23"] = 15,["24"] = 15,["25"] = 15,["26"] = 23,["27"] = 28,["28"] = 51,["29"] = 52,["30"] = 54,["31"] = 55,["32"] = 57,["33"] = 57,["34"] = 57,["35"] = 57,["36"] = 69,["37"] = 57,["38"] = 64,["39"] = 65,["40"] = 67,["41"] = 71,["42"] = 72,["43"] = 73,["44"] = 74,["46"] = 76,["47"] = 77,["48"] = 78,["49"] = 79,["50"] = 80,["52"] = 81,["53"] = 81,["54"] = 82,["55"] = 83,["56"] = 84,["57"] = 85,["58"] = 86,["59"] = 87,["60"] = 88,["61"] = 88,["62"] = 89,["63"] = 88,["64"] = 91,["65"] = 91,["66"] = 91,["67"] = 91,["68"] = 81,["73"] = 95,["74"] = 96,["75"] = 97,["76"] = 98,["77"] = 99,["78"] = 100,["79"] = 100,["80"] = 101,["81"] = 102,["83"] = 104,["84"] = 106,["85"] = 107,["87"] = 100,["88"] = 110,["89"] = 110,["90"] = 110,["91"] = 110,["93"] = 112,["94"] = 113,["95"] = 114,["96"] = 69,["97"] = 117,["98"] = 118,["99"] = 117,["100"] = 121,["101"] = 122,["102"] = 121,["103"] = 125,["104"] = 126,["105"] = 127,["106"] = 128,["108"] = 130,["109"] = 131,["111"] = 134,["112"] = 135,["113"] = 137,["114"] = 138,["116"] = 140,["117"] = 141,["120"] = 125,["121"] = 151,["122"] = 152,["123"] = 151,["124"] = 155,["125"] = 156,["126"] = 157,["128"] = 155,["129"] = 161,["130"] = 162,["131"] = 163,["132"] = 164,["135"] = 167,["136"] = 161,["137"] = 170,["138"] = 171,["139"] = 172,["141"] = 174,["142"] = 175,["143"] = 176,["144"] = 177,["146"] = 186,["148"] = 202,["150"] = 215,["156"] = 178,["157"] = 179,["158"] = 180,["160"] = 182,["167"] = 187,["168"] = 188,["169"] = 189,["170"] = 190,["172"] = 192,["174"] = 199,["180"] = 203,["181"] = 204,["182"] = 205,["183"] = 206,["184"] = 207,["185"] = 208,["186"] = 209,["188"] = 211,["195"] = 216,["196"] = 217,["197"] = 218,["198"] = 219,["200"] = 221,["202"] = 228,["208"] = 233,["209"] = 170,["210"] = 236,["211"] = 237,["212"] = 238,["214"] = 240,["216"] = 236,["217"] = 244,["218"] = 245,["219"] = 246,["220"] = 247,["222"] = 249,["225"] = 244,["226"] = 254,["227"] = 255,["228"] = 256,["229"] = 254,["230"] = 259,["231"] = 260,["232"] = 261,["233"] = 259,["234"] = 264,["235"] = 265,["236"] = 266,["237"] = 264,["238"] = 269,["239"] = 270,["240"] = 271,["241"] = 271,["242"] = 271,["243"] = 272,["244"] = 273,["245"] = 275,["246"] = 275,["247"] = 275,["248"] = 277,["249"] = 278,["250"] = 279,["251"] = 280,["252"] = 281,["253"] = 283,["254"] = 285,["255"] = 286,["259"] = 289,["260"] = 289,["261"] = 290,["262"] = 289,["265"] = 293,["266"] = 294,["267"] = 295,["268"] = 296,["270"] = 298,["271"] = 299,["274"] = 303,["275"] = 304,["276"] = 305,["278"] = 307,["279"] = 308,["282"] = 312,["283"] = 313,["284"] = 314,["286"] = 316,["287"] = 317,["289"] = 320,["290"] = 322,["291"] = 323,["292"] = 324,["294"] = 269});
local ____exports = {}
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local ____gridrenderer = require("gridrenderer")
local GridRenderer = ____gridrenderer.GridRenderer
local ____gui = require("gui")
local Button = ____gui.Button
local ____leveleditorcamera = require("leveleditorcamera")
local LevelBuilderCamera = ____leveleditorcamera.LevelBuilderCamera
local ____stars = require("stars")
local Stars = ____stars.Stars
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
function LevelEditor.prototype.serialize(self)
    return {name = "LevelEditor", levelName = self.level.name}
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
        local ____switch27 = self.mode
        if ____switch27 == Mode.TerrainBuilding then
            goto ____switch27_case_0
        elseif ____switch27 == Mode.RocketStartingLocation then
            goto ____switch27_case_1
        elseif ____switch27 == Mode.AddRefuelStation then
            goto ____switch27_case_2
        elseif ____switch27 == Mode.RocketLandingLocation then
            goto ____switch27_case_3
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
                self:setNewMode(Mode.Inspection)
            end
            goto ____switch27_end
        end
        ::____switch27_case_2::
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
            goto ____switch27_end
        end
        ::____switch27_case_3::
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
            goto ____switch27_end
        end
        ::____switch27_end::
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
