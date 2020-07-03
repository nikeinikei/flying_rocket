--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["10"] = 6,["11"] = 12,["12"] = 12,["13"] = 12,["14"] = 12,["15"] = 12,["16"] = 12,["17"] = 12,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 20,["23"] = 25,["24"] = 48,["25"] = 49,["26"] = 51,["27"] = 52,["28"] = 54,["29"] = 54,["30"] = 54,["31"] = 65,["32"] = 61,["33"] = 62,["34"] = 66,["35"] = 67,["36"] = 68,["37"] = 69,["38"] = 70,["40"] = 72,["41"] = 73,["42"] = 74,["43"] = 75,["44"] = 76,["46"] = 77,["47"] = 77,["48"] = 78,["49"] = 79,["50"] = 80,["51"] = 81,["52"] = 82,["53"] = 83,["54"] = 84,["55"] = 84,["56"] = 85,["57"] = 84,["58"] = 87,["59"] = 87,["60"] = 87,["61"] = 87,["62"] = 77,["67"] = 91,["68"] = 92,["69"] = 93,["70"] = 94,["71"] = 95,["72"] = 96,["73"] = 96,["74"] = 97,["75"] = 98,["77"] = 100,["78"] = 102,["79"] = 103,["81"] = 96,["82"] = 106,["83"] = 106,["84"] = 106,["85"] = 106,["87"] = 108,["88"] = 109,["89"] = 65,["90"] = 112,["91"] = 113,["92"] = 114,["93"] = 115,["95"] = 117,["96"] = 118,["98"] = 121,["99"] = 122,["100"] = 124,["101"] = 125,["103"] = 127,["104"] = 128,["107"] = 112,["108"] = 138,["109"] = 139,["110"] = 138,["111"] = 142,["112"] = 143,["113"] = 144,["115"] = 142,["116"] = 148,["117"] = 149,["118"] = 150,["119"] = 151,["122"] = 154,["123"] = 148,["124"] = 157,["125"] = 158,["126"] = 159,["128"] = 161,["129"] = 162,["130"] = 163,["131"] = 164,["133"] = 173,["135"] = 189,["137"] = 202,["143"] = 165,["144"] = 166,["145"] = 167,["147"] = 169,["154"] = 174,["155"] = 175,["156"] = 176,["157"] = 177,["159"] = 179,["161"] = 186,["167"] = 190,["168"] = 191,["169"] = 192,["170"] = 193,["171"] = 194,["172"] = 195,["173"] = 196,["175"] = 198,["182"] = 203,["183"] = 204,["184"] = 205,["185"] = 206,["187"] = 208,["189"] = 215,["195"] = 220,["196"] = 157,["197"] = 223,["198"] = 224,["199"] = 225,["200"] = 226,["201"] = 227,["203"] = 229,["206"] = 223,["207"] = 234,["208"] = 235,["209"] = 236,["210"] = 234,["211"] = 239,["212"] = 240,["213"] = 241,["214"] = 239,["215"] = 244,["216"] = 245,["217"] = 246,["218"] = 244,["219"] = 249,["220"] = 250,["221"] = 251,["222"] = 253,["223"] = 253,["224"] = 253,["225"] = 255,["226"] = 256,["227"] = 257,["228"] = 258,["229"] = 259,["230"] = 261,["231"] = 263,["232"] = 264,["236"] = 267,["237"] = 267,["238"] = 268,["239"] = 267,["242"] = 271,["243"] = 272,["244"] = 273,["245"] = 274,["247"] = 276,["248"] = 277,["251"] = 281,["252"] = 282,["253"] = 283,["255"] = 285,["256"] = 286,["259"] = 290,["260"] = 291,["261"] = 292,["263"] = 294,["264"] = 295,["266"] = 298,["267"] = 300,["268"] = 301,["269"] = 302,["271"] = 249});
local ____exports = {}
local ____gridrenderer = require("gridrenderer")
local GridRenderer = ____gridrenderer.GridRenderer
local ____gui = require("gui")
local Button = ____gui.Button
local ____levelbuildercamera = require("levelbuildercamera")
local LevelBuilderCamera = ____levelbuildercamera.LevelBuilderCamera
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
        local ____switch25 = self.mode
        if ____switch25 == Mode.TerrainBuilding then
            goto ____switch25_case_0
        elseif ____switch25 == Mode.RocketStartingLocation then
            goto ____switch25_case_1
        elseif ____switch25 == Mode.AddRefuelStation then
            goto ____switch25_case_2
        elseif ____switch25 == Mode.RocketLandingLocation then
            goto ____switch25_case_3
        end
        goto ____switch25_end
        ::____switch25_case_0::
        do
            if button == 1 then
                if not self.currentTerrain then
                    error("this shouldn't happen")
                else
                    __TS__ArrayPush(self.currentTerrain, worldX, worldY)
                end
            end
            goto ____switch25_end
        end
        ::____switch25_case_1::
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
            goto ____switch25_end
        end
        ::____switch25_case_2::
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
            goto ____switch25_end
        end
        ::____switch25_case_3::
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
            goto ____switch25_end
        end
        ::____switch25_end::
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
