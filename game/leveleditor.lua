--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 13,["14"] = 13,["15"] = 13,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 21,["25"] = 26,["26"] = 49,["27"] = 50,["28"] = 52,["29"] = 53,["30"] = 55,["31"] = 55,["32"] = 55,["33"] = 67,["34"] = 62,["35"] = 63,["36"] = 68,["37"] = 69,["38"] = 70,["39"] = 71,["40"] = 72,["42"] = 74,["43"] = 75,["44"] = 76,["45"] = 77,["46"] = 78,["48"] = 79,["49"] = 79,["50"] = 80,["51"] = 81,["52"] = 82,["53"] = 83,["54"] = 84,["55"] = 85,["56"] = 86,["57"] = 86,["58"] = 87,["59"] = 86,["60"] = 89,["61"] = 89,["62"] = 89,["63"] = 89,["64"] = 79,["69"] = 93,["70"] = 94,["71"] = 95,["72"] = 96,["73"] = 97,["74"] = 98,["75"] = 98,["76"] = 99,["77"] = 100,["79"] = 102,["80"] = 104,["81"] = 105,["83"] = 98,["84"] = 108,["85"] = 108,["86"] = 108,["87"] = 108,["89"] = 110,["90"] = 111,["91"] = 112,["92"] = 67,["93"] = 115,["94"] = 116,["95"] = 115,["96"] = 119,["97"] = 120,["98"] = 121,["99"] = 122,["101"] = 124,["102"] = 125,["104"] = 128,["105"] = 129,["106"] = 131,["107"] = 132,["109"] = 134,["110"] = 135,["113"] = 119,["114"] = 145,["115"] = 146,["116"] = 145,["117"] = 149,["118"] = 150,["119"] = 151,["121"] = 149,["122"] = 155,["123"] = 156,["124"] = 157,["125"] = 158,["128"] = 161,["129"] = 155,["130"] = 164,["131"] = 165,["132"] = 166,["134"] = 168,["135"] = 169,["136"] = 170,["137"] = 171,["139"] = 180,["141"] = 196,["143"] = 209,["149"] = 172,["150"] = 173,["151"] = 174,["153"] = 176,["160"] = 181,["161"] = 182,["162"] = 183,["163"] = 184,["165"] = 186,["167"] = 193,["173"] = 197,["174"] = 198,["175"] = 199,["176"] = 200,["177"] = 201,["178"] = 202,["179"] = 203,["181"] = 205,["188"] = 210,["189"] = 211,["190"] = 212,["191"] = 213,["193"] = 215,["195"] = 222,["201"] = 227,["202"] = 164,["203"] = 230,["204"] = 231,["205"] = 232,["206"] = 233,["207"] = 234,["209"] = 236,["212"] = 230,["213"] = 241,["214"] = 242,["215"] = 243,["216"] = 241,["217"] = 246,["218"] = 247,["219"] = 248,["220"] = 246,["221"] = 251,["222"] = 252,["223"] = 253,["224"] = 251,["225"] = 256,["226"] = 257,["227"] = 258,["228"] = 259,["229"] = 259,["230"] = 259,["231"] = 259,["232"] = 259,["233"] = 259,["234"] = 260,["235"] = 261,["236"] = 263,["237"] = 263,["238"] = 263,["239"] = 265,["240"] = 266,["241"] = 267,["242"] = 268,["243"] = 269,["244"] = 271,["245"] = 273,["246"] = 274,["250"] = 277,["251"] = 277,["252"] = 278,["253"] = 277,["256"] = 281,["257"] = 282,["258"] = 283,["259"] = 284,["261"] = 286,["262"] = 287,["265"] = 291,["266"] = 292,["267"] = 293,["269"] = 295,["270"] = 296,["273"] = 300,["274"] = 301,["275"] = 302,["277"] = 304,["278"] = 305,["280"] = 308,["281"] = 310,["282"] = 311,["283"] = 312,["285"] = 256});
local ____exports = {}
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
function LevelEditor.prototype.____constructor(self, level, callback)
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
    local tx, ty = self.camera:getTranslation()
    self.stars:setViewport(
        tx,
        ty,
        love.graphics.getWidth(),
        love.graphics.getHeight()
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
