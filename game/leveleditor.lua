--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["10"] = 6,["11"] = 12,["12"] = 12,["13"] = 12,["14"] = 12,["15"] = 12,["16"] = 12,["17"] = 12,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 20,["23"] = 25,["24"] = 48,["25"] = 49,["26"] = 51,["27"] = 52,["28"] = 54,["29"] = 54,["30"] = 54,["31"] = 65,["32"] = 61,["33"] = 62,["34"] = 66,["35"] = 67,["36"] = 68,["37"] = 69,["38"] = 70,["40"] = 72,["41"] = 73,["42"] = 74,["43"] = 75,["44"] = 76,["46"] = 77,["47"] = 77,["48"] = 78,["49"] = 79,["50"] = 80,["51"] = 81,["52"] = 82,["53"] = 83,["54"] = 84,["55"] = 84,["56"] = 85,["57"] = 84,["58"] = 87,["59"] = 87,["60"] = 87,["61"] = 87,["62"] = 77,["67"] = 91,["68"] = 92,["69"] = 93,["70"] = 94,["71"] = 95,["72"] = 96,["73"] = 96,["74"] = 97,["75"] = 98,["77"] = 100,["78"] = 102,["79"] = 103,["81"] = 96,["82"] = 106,["83"] = 106,["84"] = 106,["85"] = 106,["87"] = 108,["88"] = 109,["89"] = 65,["90"] = 112,["91"] = 113,["92"] = 112,["93"] = 116,["94"] = 117,["95"] = 118,["96"] = 119,["98"] = 121,["99"] = 122,["101"] = 125,["102"] = 126,["103"] = 128,["104"] = 129,["106"] = 131,["107"] = 132,["110"] = 116,["111"] = 142,["112"] = 143,["113"] = 142,["114"] = 146,["115"] = 147,["116"] = 148,["118"] = 146,["119"] = 152,["120"] = 153,["121"] = 154,["122"] = 155,["125"] = 158,["126"] = 152,["127"] = 161,["128"] = 162,["129"] = 163,["131"] = 165,["132"] = 166,["133"] = 167,["134"] = 168,["136"] = 177,["138"] = 193,["140"] = 206,["146"] = 169,["147"] = 170,["148"] = 171,["150"] = 173,["157"] = 178,["158"] = 179,["159"] = 180,["160"] = 181,["162"] = 183,["164"] = 190,["170"] = 194,["171"] = 195,["172"] = 196,["173"] = 197,["174"] = 198,["175"] = 199,["176"] = 200,["178"] = 202,["185"] = 207,["186"] = 208,["187"] = 209,["188"] = 210,["190"] = 212,["192"] = 219,["198"] = 224,["199"] = 161,["200"] = 227,["201"] = 228,["202"] = 229,["203"] = 230,["204"] = 231,["206"] = 233,["209"] = 227,["210"] = 238,["211"] = 239,["212"] = 240,["213"] = 238,["214"] = 243,["215"] = 244,["216"] = 245,["217"] = 243,["218"] = 248,["219"] = 249,["220"] = 250,["221"] = 248,["222"] = 253,["223"] = 254,["224"] = 255,["225"] = 257,["226"] = 257,["227"] = 257,["228"] = 259,["229"] = 260,["230"] = 261,["231"] = 262,["232"] = 263,["233"] = 265,["234"] = 267,["235"] = 268,["239"] = 271,["240"] = 271,["241"] = 272,["242"] = 271,["245"] = 275,["246"] = 276,["247"] = 277,["248"] = 278,["250"] = 280,["251"] = 281,["254"] = 285,["255"] = 286,["256"] = 287,["258"] = 289,["259"] = 290,["262"] = 294,["263"] = 295,["264"] = 296,["266"] = 298,["267"] = 299,["269"] = 302,["270"] = 304,["271"] = 305,["272"] = 306,["274"] = 253});
local ____exports = {}
local ____gridrenderer = require("gridrenderer")
local GridRenderer = ____gridrenderer.GridRenderer
local ____gui = require("gui")
local Button = ____gui.Button
local ____leveleditorcamera = require("leveleditorcamera")
local LevelBuilderCamera = ____leveleditorcamera.LevelBuilderCamera
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
