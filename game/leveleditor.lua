--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 15,["16"] = 15,["17"] = 15,["18"] = 15,["19"] = 15,["20"] = 20,["21"] = 20,["22"] = 20,["23"] = 20,["24"] = 20,["25"] = 20,["26"] = 20,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 20,["31"] = 20,["32"] = 20,["33"] = 29,["34"] = 34,["35"] = 61,["36"] = 62,["37"] = 64,["38"] = 65,["39"] = 67,["40"] = 67,["41"] = 67,["42"] = 67,["43"] = 80,["44"] = 67,["45"] = 74,["46"] = 75,["47"] = 76,["48"] = 78,["49"] = 82,["50"] = 83,["51"] = 84,["52"] = 85,["54"] = 87,["55"] = 88,["56"] = 89,["57"] = 90,["58"] = 91,["60"] = 92,["61"] = 92,["62"] = 93,["63"] = 94,["64"] = 95,["65"] = 96,["66"] = 97,["67"] = 98,["68"] = 99,["69"] = 99,["70"] = 100,["71"] = 99,["72"] = 102,["73"] = 102,["74"] = 102,["75"] = 102,["76"] = 92,["81"] = 106,["82"] = 107,["83"] = 108,["84"] = 109,["85"] = 110,["86"] = 111,["87"] = 111,["88"] = 112,["89"] = 113,["91"] = 115,["92"] = 117,["93"] = 118,["95"] = 111,["96"] = 121,["97"] = 121,["98"] = 121,["99"] = 121,["101"] = 123,["102"] = 124,["103"] = 125,["104"] = 80,["105"] = 128,["106"] = 129,["107"] = 128,["108"] = 132,["109"] = 133,["110"] = 132,["111"] = 136,["112"] = 137,["113"] = 138,["114"] = 139,["115"] = 140,["117"] = 142,["118"] = 143,["120"] = 146,["121"] = 147,["122"] = 149,["123"] = 150,["124"] = 151,["126"] = 153,["127"] = 154,["128"] = 155,["130"] = 157,["131"] = 158,["134"] = 136,["135"] = 168,["136"] = 169,["137"] = 168,["138"] = 172,["139"] = 173,["140"] = 174,["142"] = 172,["143"] = 178,["144"] = 179,["145"] = 180,["146"] = 181,["148"] = 184,["149"] = 185,["150"] = 186,["152"] = 189,["156"] = 200,["157"] = 201,["158"] = 178,["159"] = 204,["160"] = 205,["161"] = 206,["163"] = 208,["164"] = 209,["165"] = 210,["166"] = 211,["167"] = 212,["168"] = 213,["169"] = 214,["170"] = 215,["171"] = 216,["172"] = 217,["174"] = 219,["177"] = 222,["178"] = 223,["179"] = 224,["180"] = 225,["181"] = 226,["183"] = 228,["185"] = 235,["187"] = 237,["188"] = 238,["189"] = 239,["190"] = 240,["191"] = 241,["192"] = 242,["193"] = 243,["194"] = 244,["196"] = 246,["199"] = 249,["200"] = 250,["201"] = 251,["202"] = 252,["203"] = 253,["205"] = 255,["207"] = 262,["211"] = 266,["212"] = 204,["213"] = 269,["214"] = 270,["215"] = 271,["217"] = 273,["219"] = 269,["220"] = 277,["221"] = 278,["222"] = 279,["223"] = 280,["225"] = 282,["228"] = 277,["229"] = 287,["230"] = 288,["231"] = 289,["232"] = 287,["233"] = 292,["234"] = 293,["235"] = 294,["236"] = 292,["237"] = 297,["238"] = 298,["239"] = 299,["240"] = 297,["241"] = 302,["242"] = 303,["243"] = 302,["244"] = 306,["245"] = 307,["246"] = 308,["247"] = 308,["248"] = 308,["249"] = 309,["250"] = 310,["251"] = 312,["252"] = 312,["253"] = 312,["254"] = 314,["255"] = 315,["256"] = 316,["257"] = 317,["258"] = 318,["259"] = 320,["260"] = 322,["261"] = 323,["265"] = 326,["266"] = 326,["267"] = 327,["268"] = 326,["271"] = 329,["272"] = 330,["273"] = 331,["275"] = 334,["276"] = 335,["277"] = 336,["278"] = 337,["280"] = 339,["281"] = 340,["284"] = 344,["285"] = 345,["286"] = 346,["288"] = 348,["289"] = 349,["292"] = 353,["293"] = 354,["294"] = 355,["296"] = 357,["297"] = 358,["299"] = 361,["300"] = 362,["301"] = 363,["302"] = 364,["304"] = 306});
local ____exports = {}
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local ____gridrenderer = require("gridrenderer")
local GridRenderer = ____gridrenderer.GridRenderer
local ____gui = require("gui")
local Button = ____gui.Button
local ____leveleditorcamera = require("leveleditorcamera")
local LevelEditorCamera = ____leveleditorcamera.LevelEditorCamera
local ____stars = require("stars")
local Stars = ____stars.Stars
local TerrainType = {}
TerrainType.Terrain = 0
TerrainType[TerrainType.Terrain] = "Terrain"
TerrainType.GroundTerrain = 1
TerrainType[TerrainType.GroundTerrain] = "GroundTerrain"
local Mode = {}
Mode.TerrainBuilding = 0
Mode[Mode.TerrainBuilding] = "TerrainBuilding"
Mode.GroundTerrainBuilding = 1
Mode[Mode.GroundTerrainBuilding] = "GroundTerrainBuilding"
Mode.RocketStartingLocation = 2
Mode[Mode.RocketStartingLocation] = "RocketStartingLocation"
Mode.RocketLandingLocation = 3
Mode[Mode.RocketLandingLocation] = "RocketLandingLocation"
Mode.AddRefuelStation = 4
Mode[Mode.AddRefuelStation] = "AddRefuelStation"
Mode.Inspection = 5
Mode[Mode.Inspection] = "Inspection"
local locationNotSetErrorMessage = "\nRocket starting location or landing location were not set\nThese are mandatory for the level to be saved.\n"
local buttonSchemes = {{name = "Inspection", mode = Mode.Inspection}, {name = "Starting location", mode = Mode.RocketStartingLocation}, {name = "Landing location", mode = Mode.RocketLandingLocation}, {name = "Add Refuel Station", mode = Mode.AddRefuelStation}, {name = "Add Terrain", mode = Mode.TerrainBuilding}, {name = "Ground Terrain", mode = Mode.GroundTerrainBuilding}}
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
    self.terrainType = nil
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
        local buttonWidth = 190
        local buttonPadding = 10
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
    self.camera = __TS__New(LevelEditorCamera)
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
    love.mouse.setGrabbed(newMode ~= Mode.Inspection)
    if self.mode ~= newMode then
        if (self.mode == Mode.TerrainBuilding) or (self.mode == Mode.GroundTerrainBuilding) then
            self:postTerrainBuilding()
        end
        if self.mode == Mode.AddRefuelStation then
            self.currentRefuelStation = nil
        end
        self.mode = newMode
        self.newMode = true
        if self.mode == Mode.TerrainBuilding then
            self.currentTerrain = {}
            self.terrainType = TerrainType.Terrain
        end
        if self.mode == Mode.GroundTerrainBuilding then
            self.currentTerrain = {}
            self.terrainType = TerrainType.GroundTerrain
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
        if self.terrainType == nil then
            error("this shouldn't happen")
        end
        if #self.currentTerrain >= 4 then
            if self.terrainType == TerrainType.Terrain then
                __TS__ArrayPush(self.level.terrainPoints, self.currentTerrain)
            else
                __TS__ArrayPush(self.level.groundTerrain, {color = {r = 0.9059, g = 0.4902, b = 0.0667}, points = self.currentTerrain})
            end
        end
    end
    self.currentTerrain = nil
    self.terrainType = nil
end
function LevelEditor.prototype.mousepressed(self, mouseX, mouseY, button, istouch, presses)
    for ____, b in ipairs(self.buttons) do
        b:mousepressed(mouseX, mouseY, button, istouch, presses)
    end
    love.graphics.push()
    love.graphics.origin()
    self.camera:apply()
    local worldX, worldY = love.graphics.inverseTransformPoint(mouseX, mouseY)
    love.graphics.pop()
    if self.newMode == false then
        if (self.mode == Mode.TerrainBuilding) or (self.mode == Mode.GroundTerrainBuilding) then
            if button == 1 then
                if not self.currentTerrain then
                    error("this shouldn't happen")
                else
                    __TS__ArrayPush(self.currentTerrain, worldX, worldY)
                end
            end
        elseif self.mode == Mode.RocketStartingLocation then
            if button == 1 then
                if self.level.rocketStartingLocation then
                    self.level.rocketStartingLocation.x = worldX
                    self.level.rocketStartingLocation.y = worldY
                else
                    self.level.rocketStartingLocation = {x = worldX, y = worldY, w = rocketLocationWidth, h = rocketLocationHeight}
                end
                self:setNewMode(Mode.Inspection)
            end
        elseif self.mode == Mode.AddRefuelStation then
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
        elseif self.mode == Mode.RocketLandingLocation then
            if button == 1 then
                if self.level.rocketLandingLocation then
                    self.level.rocketLandingLocation.x = worldX
                    self.level.rocketLandingLocation.y = worldY
                else
                    self.level.rocketLandingLocation = {x = worldX, y = worldY, w = rocketLocationWidth, h = rocketLocationHeight}
                end
                self:setNewMode(Mode.Inspection)
            end
        end
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
function LevelEditor.prototype.wheelmoved(self, _x, y)
    self.camera:scale(y * 0.05)
end
function LevelEditor.prototype.draw(self)
    self.camera:apply()
    self.stars:setViewport(
        self.camera:getViewport()
    )
    self.stars:draw()
    self.gridRenderer:draw()
    local worldX, worldY = love.graphics.inverseTransformPoint(
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
    for ____, groundTerrain in ipairs(self.level.groundTerrain) do
        love.graphics.setColor(groundTerrain.color.r, groundTerrain.color.g, groundTerrain.color.b)
        love.graphics.polygon("fill", groundTerrain.points)
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
