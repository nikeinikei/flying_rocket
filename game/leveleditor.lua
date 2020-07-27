--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 15,["16"] = 15,["17"] = 15,["18"] = 15,["19"] = 15,["20"] = 15,["21"] = 15,["22"] = 15,["23"] = 15,["24"] = 15,["25"] = 15,["26"] = 23,["27"] = 28,["28"] = 51,["29"] = 52,["30"] = 54,["31"] = 55,["32"] = 57,["33"] = 57,["34"] = 57,["35"] = 57,["36"] = 69,["37"] = 57,["38"] = 64,["39"] = 65,["40"] = 67,["41"] = 71,["42"] = 72,["43"] = 73,["44"] = 74,["46"] = 76,["47"] = 77,["48"] = 78,["49"] = 79,["50"] = 80,["52"] = 81,["53"] = 81,["54"] = 82,["55"] = 83,["56"] = 84,["57"] = 85,["58"] = 86,["59"] = 87,["60"] = 88,["61"] = 88,["62"] = 89,["63"] = 88,["64"] = 91,["65"] = 91,["66"] = 91,["67"] = 91,["68"] = 81,["73"] = 95,["74"] = 96,["75"] = 97,["76"] = 98,["77"] = 99,["78"] = 100,["79"] = 100,["80"] = 101,["81"] = 102,["83"] = 104,["84"] = 106,["85"] = 107,["87"] = 100,["88"] = 110,["89"] = 110,["90"] = 110,["91"] = 110,["93"] = 112,["94"] = 113,["95"] = 114,["96"] = 69,["97"] = 117,["98"] = 118,["99"] = 117,["100"] = 121,["101"] = 122,["102"] = 121,["103"] = 125,["104"] = 126,["105"] = 125,["106"] = 129,["107"] = 130,["108"] = 129,["109"] = 133,["110"] = 134,["111"] = 133,["112"] = 137,["113"] = 138,["114"] = 139,["115"] = 140,["117"] = 142,["118"] = 143,["120"] = 146,["121"] = 147,["122"] = 149,["123"] = 150,["125"] = 152,["126"] = 153,["129"] = 137,["130"] = 163,["131"] = 164,["132"] = 163,["133"] = 167,["134"] = 168,["135"] = 169,["137"] = 167,["138"] = 173,["139"] = 174,["140"] = 175,["141"] = 176,["144"] = 179,["145"] = 173,["146"] = 182,["147"] = 183,["148"] = 184,["150"] = 186,["151"] = 187,["152"] = 188,["153"] = 189,["154"] = 190,["155"] = 191,["156"] = 192,["157"] = 193,["158"] = 194,["159"] = 195,["161"] = 197,["164"] = 200,["165"] = 201,["166"] = 202,["167"] = 203,["168"] = 204,["170"] = 206,["172"] = 213,["174"] = 215,["175"] = 216,["176"] = 217,["177"] = 218,["178"] = 219,["179"] = 220,["180"] = 221,["181"] = 222,["183"] = 224,["186"] = 227,["187"] = 228,["188"] = 229,["189"] = 230,["190"] = 231,["192"] = 233,["194"] = 240,["198"] = 244,["199"] = 182,["200"] = 247,["201"] = 248,["202"] = 249,["203"] = 250,["205"] = 252,["207"] = 247,["208"] = 256,["209"] = 257,["210"] = 258,["211"] = 259,["213"] = 261,["216"] = 256,["217"] = 266,["218"] = 267,["219"] = 268,["220"] = 266,["221"] = 271,["222"] = 272,["223"] = 273,["224"] = 271,["225"] = 276,["226"] = 277,["227"] = 278,["228"] = 276,["229"] = 281,["230"] = 282,["231"] = 281,["232"] = 285,["233"] = 286,["234"] = 287,["235"] = 287,["236"] = 287,["237"] = 288,["238"] = 289,["239"] = 291,["240"] = 291,["241"] = 291,["242"] = 293,["243"] = 294,["244"] = 295,["245"] = 296,["246"] = 297,["247"] = 299,["248"] = 301,["249"] = 302,["253"] = 305,["254"] = 305,["255"] = 306,["256"] = 305,["259"] = 309,["260"] = 310,["261"] = 311,["262"] = 312,["264"] = 314,["265"] = 315,["268"] = 319,["269"] = 320,["270"] = 321,["272"] = 323,["273"] = 324,["276"] = 328,["277"] = 329,["278"] = 330,["280"] = 332,["281"] = 333,["283"] = 336,["284"] = 337,["285"] = 338,["286"] = 339,["288"] = 285});
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
    self.camera = __TS__New(LevelEditorCamera)
    self.gridRenderer = __TS__New(GridRenderer, 250, self.camera)
    self.stars = __TS__New(Stars)
end
function LevelEditor.prototype.enter(self)
    love.mouse.setGrabbed(true)
end
function LevelEditor.prototype.onActive(self)
    love.mouse.setGrabbed(true)
end
function LevelEditor.prototype.onInactive(self)
    love.mouse.setGrabbed(false)
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
    love.graphics.push()
    love.graphics.origin()
    self.camera:apply()
    local worldX, worldY = love.graphics.inverseTransformPoint(mouseX, mouseY)
    love.graphics.pop()
    if self.newMode == false then
        if self.mode == Mode.TerrainBuilding then
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
    love.mouse.setGrabbed(false)
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
