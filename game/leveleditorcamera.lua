--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 10,["6"] = 10,["7"] = 10,["9"] = 26,["10"] = 27,["11"] = 28,["12"] = 32,["13"] = 25,["14"] = 41,["15"] = 42,["16"] = 41,["17"] = 45,["18"] = 46,["19"] = 47,["20"] = 48,["21"] = 49,["22"] = 50,["23"] = 51,["25"] = 53,["26"] = 54,["28"] = 56,["29"] = 57,["31"] = 59,["32"] = 60,["34"] = 63,["35"] = 64,["36"] = 45,["37"] = 67,["38"] = 68,["39"] = 67,["40"] = 72,["41"] = 73,["42"] = 72});
local ____exports = {}
____exports.LevelBuilderCamera = __TS__Class()
local LevelBuilderCamera = ____exports.LevelBuilderCamera
LevelBuilderCamera.name = "LevelBuilderCamera"
function LevelBuilderCamera.prototype.____constructor(self)
    self.tx = 0
    self.ty = 0
    self.cameraSpeed = {x = 300, y = 300}
    self.cameraControlKeycodes = {up = "down", right = "right", down = "up", left = "left"}
end
function LevelBuilderCamera.prototype.getTranslation(self)
    return -self.tx, -self.ty
end
function LevelBuilderCamera.prototype.update(self, dt)
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
function LevelBuilderCamera.prototype.apply(self)
    love.graphics.translate(self.tx, self.ty)
end
function LevelBuilderCamera.prototype.convertScreencoordinatesToWorldCoordinates(self, x, y)
    return x - self.tx, y - self.ty
end
return ____exports
