--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 12,["12"] = 12,["13"] = 12,["14"] = 12,["15"] = 12,["16"] = 12,["17"] = 12,["18"] = 12,["19"] = 12,["20"] = 19,["21"] = 24,["22"] = 43,["23"] = 44,["24"] = 46,["25"] = 46,["26"] = 46,["27"] = 56,["28"] = 53,["29"] = 57,["30"] = 58,["31"] = 59,["32"] = 60,["33"] = 61,["35"] = 63,["36"] = 64,["37"] = 65,["38"] = 66,["39"] = 67,["41"] = 68,["42"] = 68,["43"] = 69,["44"] = 70,["45"] = 71,["46"] = 72,["47"] = 73,["48"] = 74,["49"] = 75,["50"] = 75,["51"] = 76,["52"] = 75,["53"] = 78,["54"] = 78,["55"] = 78,["56"] = 78,["57"] = 68,["62"] = 82,["63"] = 83,["64"] = 84,["65"] = 85,["66"] = 86,["67"] = 87,["68"] = 87,["69"] = 88,["70"] = 89,["72"] = 91,["73"] = 93,["74"] = 94,["76"] = 87,["77"] = 97,["78"] = 97,["79"] = 97,["80"] = 97,["82"] = 99,["83"] = 100,["84"] = 56,["85"] = 103,["86"] = 104,["87"] = 105,["88"] = 106,["90"] = 109,["91"] = 110,["92"] = 112,["93"] = 113,["96"] = 103,["97"] = 118,["98"] = 119,["99"] = 118,["100"] = 122,["101"] = 123,["102"] = 124,["104"] = 122,["105"] = 128,["106"] = 129,["107"] = 130,["108"] = 131,["111"] = 134,["112"] = 128,["113"] = 137,["114"] = 138,["115"] = 139,["117"] = 141,["118"] = 142,["119"] = 143,["120"] = 144,["122"] = 153,["124"] = 169,["130"] = 145,["131"] = 146,["132"] = 147,["134"] = 149,["141"] = 154,["142"] = 155,["143"] = 156,["144"] = 157,["146"] = 159,["148"] = 166,["154"] = 170,["155"] = 171,["156"] = 172,["157"] = 173,["159"] = 175,["161"] = 182,["167"] = 187,["168"] = 137,["169"] = 190,["170"] = 191,["171"] = 192,["172"] = 193,["173"] = 194,["175"] = 196,["178"] = 190,["179"] = 201,["180"] = 202,["181"] = 203,["182"] = 205,["183"] = 205,["184"] = 205,["185"] = 207,["186"] = 208,["187"] = 209,["188"] = 210,["189"] = 211,["190"] = 213,["191"] = 215,["192"] = 216,["196"] = 219,["197"] = 219,["198"] = 220,["199"] = 219,["202"] = 223,["203"] = 224,["204"] = 225,["205"] = 226,["207"] = 228,["208"] = 229,["211"] = 233,["212"] = 234,["213"] = 235,["215"] = 237,["216"] = 238,["219"] = 242,["220"] = 243,["221"] = 244,["223"] = 201});
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
