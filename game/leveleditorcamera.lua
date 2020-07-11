--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 10,["6"] = 10,["7"] = 10,["9"] = 26,["10"] = 27,["11"] = 28,["12"] = 32,["13"] = 25,["14"] = 41,["15"] = 42,["16"] = 41,["17"] = 46,["18"] = 47,["19"] = 46,["20"] = 50,["21"] = 51,["22"] = 52,["23"] = 54,["24"] = 55,["25"] = 56,["26"] = 57,["27"] = 58,["28"] = 59,["30"] = 61,["31"] = 62,["33"] = 64,["34"] = 65,["36"] = 67,["37"] = 68,["39"] = 71,["40"] = 72,["41"] = 50,["42"] = 75,["43"] = 76,["44"] = 75,["45"] = 80,["46"] = 81,["47"] = 80});
local ____exports = {}
____exports.LevelBuilderCamera = __TS__Class()
local LevelBuilderCamera = ____exports.LevelBuilderCamera
LevelBuilderCamera.name = "LevelBuilderCamera"
function LevelBuilderCamera.prototype.____constructor(self)
    self.tx = 0
    self.ty = 0
    self.cameraSpeed = {x = 600, y = 600}
    self.cameraControlKeycodes = {up = "down", right = "right", down = "up", left = "left"}
end
function LevelBuilderCamera.prototype.getTranslation(self)
    return -self.tx, -self.ty
end
function LevelBuilderCamera.prototype.getViewport(self)
    return -self.tx, -self.ty, love.graphics.getWidth(), love.graphics.getHeight()
end
function LevelBuilderCamera.prototype.update(self, dt)
    local grabbed = love.mouse.isGrabbed()
    local mouseX, mouseY = love.mouse.getPosition()
    local dx = self.cameraSpeed.x * dt
    local dy = self.cameraSpeed.y * dt
    local x = 0
    local y = 0
    if love.keyboard.isDown(self.cameraControlKeycodes.up) or (grabbed and (mouseY >= (love.graphics.getHeight() - 1))) then
        y = 1
    end
    if love.keyboard.isDown(self.cameraControlKeycodes.down) or (grabbed and (mouseY == 0)) then
        y = y - 1
    end
    if love.keyboard.isDown(self.cameraControlKeycodes.right) or (grabbed and (mouseX >= (love.graphics.getWidth() - 1))) then
        x = 1
    end
    if love.keyboard.isDown(self.cameraControlKeycodes.left) or (grabbed and (mouseX == 0)) then
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
