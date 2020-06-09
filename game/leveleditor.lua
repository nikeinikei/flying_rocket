--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 19,["12"] = 19,["13"] = 19,["14"] = 19,["15"] = 19,["16"] = 19,["17"] = 19,["18"] = 19,["19"] = 19,["20"] = 26,["21"] = 31,["22"] = 50,["23"] = 51,["24"] = 53,["25"] = 53,["26"] = 53,["27"] = 63,["28"] = 60,["29"] = 64,["30"] = 65,["31"] = 66,["32"] = 67,["33"] = 68,["35"] = 70,["36"] = 71,["37"] = 72,["38"] = 73,["39"] = 74,["41"] = 75,["42"] = 75,["43"] = 76,["44"] = 77,["45"] = 78,["46"] = 79,["47"] = 80,["48"] = 81,["49"] = 82,["50"] = 82,["51"] = 83,["52"] = 82,["53"] = 85,["54"] = 85,["55"] = 85,["56"] = 85,["57"] = 75,["62"] = 89,["63"] = 90,["64"] = 91,["65"] = 92,["66"] = 93,["67"] = 94,["68"] = 94,["69"] = 95,["70"] = 96,["72"] = 98,["73"] = 100,["74"] = 101,["76"] = 94,["77"] = 104,["78"] = 104,["79"] = 104,["80"] = 104,["82"] = 106,["83"] = 107,["84"] = 63,["85"] = 110,["86"] = 111,["87"] = 112,["88"] = 113,["90"] = 116,["91"] = 117,["92"] = 119,["93"] = 120,["96"] = 110,["97"] = 125,["98"] = 126,["99"] = 125,["100"] = 129,["101"] = 130,["102"] = 131,["104"] = 129,["105"] = 135,["106"] = 136,["107"] = 137,["108"] = 138,["111"] = 141,["112"] = 135,["113"] = 144,["114"] = 145,["115"] = 146,["117"] = 148,["118"] = 149,["119"] = 150,["120"] = 151,["122"] = 160,["124"] = 176,["130"] = 152,["131"] = 153,["132"] = 154,["134"] = 156,["141"] = 161,["142"] = 162,["143"] = 163,["144"] = 164,["146"] = 166,["148"] = 173,["154"] = 177,["155"] = 178,["156"] = 179,["157"] = 180,["159"] = 182,["161"] = 189,["167"] = 194,["168"] = 144,["169"] = 197,["170"] = 198,["171"] = 199,["172"] = 200,["173"] = 201,["175"] = 203,["178"] = 197,["179"] = 208,["180"] = 209,["181"] = 210,["182"] = 212,["183"] = 212,["184"] = 212,["185"] = 214,["186"] = 215,["187"] = 216,["188"] = 217,["189"] = 218,["190"] = 220,["191"] = 222,["192"] = 223,["196"] = 226,["197"] = 226,["198"] = 227,["199"] = 226,["202"] = 230,["203"] = 231,["204"] = 232,["205"] = 233,["207"] = 235,["208"] = 236,["211"] = 240,["212"] = 241,["213"] = 242,["215"] = 244,["216"] = 245,["219"] = 249,["220"] = 250,["221"] = 251,["223"] = 208});
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
