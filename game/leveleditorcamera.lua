--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 10,["6"] = 10,["7"] = 10,["9"] = 30,["10"] = 31,["11"] = 32,["12"] = 33,["13"] = 37,["14"] = 29,["15"] = 46,["16"] = 47,["17"] = 46,["18"] = 50,["19"] = 51,["20"] = 52,["21"] = 53,["22"] = 54,["23"] = 55,["24"] = 56,["26"] = 58,["27"] = 59,["29"] = 61,["30"] = 62,["32"] = 64,["33"] = 65,["35"] = 68,["36"] = 69,["37"] = 50,["38"] = 72,["39"] = 73,["40"] = 74,["42"] = 72,["43"] = 78,["44"] = 79,["45"] = 80,["46"] = 78,["47"] = 84,["48"] = 85,["49"] = 84,["50"] = 11});
local ____exports = {}
____exports.LevelEditorCamera = __TS__Class()
local LevelEditorCamera = ____exports.LevelEditorCamera
LevelEditorCamera.name = "LevelEditorCamera"
function LevelEditorCamera.prototype.____constructor(self)
    self.tx = 0
    self.ty = 0
    self.scale = 1
    self.cameraSpeed = {x = 300, y = 300}
    self.cameraControlKeycodes = {up = "down", right = "right", down = "up", left = "left"}
end
function LevelEditorCamera.prototype.getTranslation(self)
    return -self.tx, -self.ty
end
function LevelEditorCamera.prototype.update(self, dt)
    local dx = self.cameraSpeed.x * dt
    local dy = self.cameraSpeed.y * dt
    local x = 0
    local y = 0
    if love.keyboard.isDown(self.cameraControlKeycodes.up) then
        y = 1
    end
    if love.keyboard.isDown(self.cameraControlKeycodes.down) then
        y = y - 1
    end
    if love.keyboard.isDown(self.cameraControlKeycodes.right) then
        x = 1
    end
    if love.keyboard.isDown(self.cameraControlKeycodes.left) then
        x = x - 1
    end
    self.tx = self.tx - (x * dx)
    self.ty = self.ty - (y * dy)
end
function LevelEditorCamera.prototype.wheelmoved(self, y)
    if love.keyboard.isDown("lctrl") then
        self.scale = self.scale + (____exports.LevelEditorCamera.zoomFactor * y)
    end
end
function LevelEditorCamera.prototype.apply(self)
    love.graphics.scale(self.scale)
    love.graphics.translate(self.tx, self.ty)
end
function LevelEditorCamera.prototype.convertScreencoordinatesToWorldCoordinates(self, x, y)
    return x - self.tx, y - self.ty
end
LevelEditorCamera.zoomFactor = 0.1
return ____exports
