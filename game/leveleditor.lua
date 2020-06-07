--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 21,["12"] = 21,["13"] = 21,["14"] = 21,["15"] = 21,["16"] = 21,["17"] = 21,["18"] = 21,["19"] = 21,["20"] = 28,["21"] = 33,["22"] = 52,["23"] = 53,["24"] = 55,["25"] = 55,["26"] = 55,["27"] = 65,["28"] = 62,["29"] = 66,["30"] = 67,["31"] = 68,["32"] = 69,["33"] = 70,["35"] = 72,["36"] = 73,["37"] = 74,["38"] = 75,["39"] = 76,["41"] = 77,["42"] = 77,["43"] = 78,["44"] = 79,["45"] = 80,["46"] = 81,["47"] = 82,["48"] = 83,["49"] = 84,["50"] = 84,["51"] = 85,["52"] = 84,["53"] = 87,["54"] = 87,["55"] = 87,["56"] = 87,["57"] = 77,["62"] = 91,["63"] = 92,["64"] = 93,["65"] = 94,["66"] = 95,["67"] = 96,["68"] = 96,["69"] = 97,["70"] = 98,["72"] = 100,["73"] = 102,["74"] = 103,["76"] = 96,["77"] = 106,["78"] = 106,["79"] = 106,["80"] = 106,["82"] = 108,["83"] = 109,["84"] = 65,["85"] = 112,["86"] = 113,["87"] = 114,["88"] = 115,["90"] = 118,["91"] = 119,["92"] = 121,["93"] = 122,["96"] = 112,["97"] = 127,["98"] = 128,["99"] = 127,["100"] = 131,["101"] = 132,["102"] = 133,["104"] = 131,["105"] = 137,["106"] = 138,["107"] = 139,["108"] = 140,["111"] = 143,["112"] = 137,["113"] = 146,["114"] = 147,["115"] = 148,["117"] = 150,["118"] = 151,["119"] = 152,["120"] = 153,["122"] = 162,["124"] = 178,["130"] = 154,["131"] = 155,["132"] = 156,["134"] = 158,["141"] = 163,["142"] = 164,["143"] = 165,["144"] = 166,["146"] = 168,["148"] = 175,["154"] = 179,["155"] = 180,["156"] = 181,["157"] = 182,["159"] = 184,["161"] = 191,["167"] = 196,["168"] = 146,["169"] = 199,["170"] = 200,["171"] = 201,["172"] = 202,["173"] = 203,["175"] = 205,["178"] = 199,["179"] = 210,["180"] = 211,["181"] = 212,["182"] = 214,["183"] = 214,["184"] = 214,["185"] = 216,["186"] = 217,["187"] = 218,["188"] = 219,["189"] = 220,["190"] = 222,["191"] = 224,["192"] = 225,["196"] = 228,["197"] = 228,["198"] = 229,["199"] = 228,["202"] = 232,["203"] = 233,["204"] = 234,["205"] = 235,["207"] = 237,["208"] = 238,["211"] = 242,["212"] = 243,["213"] = 244,["215"] = 246,["216"] = 247,["219"] = 251,["220"] = 252,["221"] = 253,["223"] = 210});
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
Mode.Inspection = 3
Mode[Mode.Inspection] = "Inspection"
local locationNotSetErrorMessage = "\nRocket starting location or landing location were not set\nThese are mandatory for the level to be saved.\n"
local buttonSchemes = {{name = "Inspection", mode = Mode.Inspection}, {name = "Starting location", mode = Mode.RocketStartingLocation}, {name = "Landing location", mode = Mode.RocketLandingLocation}, {name = "Add Terrain", mode = Mode.TerrainBuilding}}
local rocketLocationWidth = 200
local rocketLocationHeight = 20
____exports.LevelEditor = __TS__Class()
local LevelEditor = ____exports.LevelEditor
LevelEditor.name = "LevelEditor"
function LevelEditor.prototype.____constructor(self, level, callback)
    self.currentTerrain = nil
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
        self.mode = newMode
        self.newMode = true
        if self.mode == Mode.TerrainBuilding then
            self.currentTerrain = {}
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
        local ____switch23 = self.mode
        if ____switch23 == Mode.TerrainBuilding then
            goto ____switch23_case_0
        elseif ____switch23 == Mode.RocketStartingLocation then
            goto ____switch23_case_1
        elseif ____switch23 == Mode.RocketLandingLocation then
            goto ____switch23_case_2
        end
        goto ____switch23_end
        ::____switch23_case_0::
        do
            if button == 1 then
                if not self.currentTerrain then
                    error("this shouldn't happen")
                else
                    __TS__ArrayPush(self.currentTerrain, worldX, worldY)
                end
            end
            goto ____switch23_end
        end
        ::____switch23_case_1::
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
            goto ____switch23_end
        end
        ::____switch23_case_2::
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
            goto ____switch23_end
        end
        ::____switch23_end::
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
end
return ____exports
