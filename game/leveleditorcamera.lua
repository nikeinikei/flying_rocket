--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 11,["8"] = 11,["9"] = 11,["11"] = 34,["12"] = 35,["13"] = 36,["14"] = 37,["15"] = 38,["16"] = 42,["17"] = 33,["18"] = 50,["19"] = 51,["20"] = 52,["21"] = 52,["22"] = 52,["23"] = 52,["24"] = 50,["25"] = 56,["26"] = 57,["27"] = 56,["28"] = 60,["29"] = 61,["30"] = 63,["31"] = 64,["32"] = 66,["33"] = 67,["34"] = 68,["35"] = 69,["36"] = 70,["37"] = 71,["39"] = 73,["40"] = 74,["42"] = 76,["43"] = 77,["45"] = 79,["46"] = 80,["48"] = 83,["49"] = 84,["50"] = 60,["51"] = 87,["52"] = 88,["53"] = 88,["54"] = 88,["55"] = 88,["56"] = 89,["57"] = 90,["58"] = 87,["59"] = 12,["60"] = 13});
local ____exports = {}
local ____smoothvalue = require("util.smoothvalue")
local updateSmoothValue = ____smoothvalue.updateSmoothValue
____exports.LevelEditorCamera = __TS__Class()
local LevelEditorCamera = ____exports.LevelEditorCamera
LevelEditorCamera.name = "LevelEditorCamera"
function LevelEditorCamera.prototype.____constructor(self)
    self.tx = 0
    self.ty = 0
    self.scaleFactor = 1
    self.targetScaleFactor = 1
    self.cameraSpeed = {x = 600, y = 600}
    self.cameraControlKeycodes = {up = "down", right = "right", down = "up", left = "left"}
end
function LevelEditorCamera.prototype.scale(self, factor)
    self.targetScaleFactor = self.targetScaleFactor + factor
    self.targetScaleFactor = math.max(
        math.min(self.targetScaleFactor, ____exports.LevelEditorCamera.maximumScaleFactor),
        ____exports.LevelEditorCamera.minimumScaleFactor
    )
end
function LevelEditorCamera.prototype.getViewport(self)
    return (-love.graphics.getWidth() / (2 * self.scaleFactor)) - self.tx, (-love.graphics.getHeight() / (2 * self.scaleFactor)) - self.ty, love.graphics.getWidth() / self.scaleFactor, love.graphics.getHeight() / self.scaleFactor
end
function LevelEditorCamera.prototype.update(self, dt)
    self.scaleFactor = updateSmoothValue(self.scaleFactor, self.targetScaleFactor, 10, dt)
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
    self.tx = self.tx - ((x * dx) / self.scaleFactor)
    self.ty = self.ty - ((y * dy) / self.scaleFactor)
end
function LevelEditorCamera.prototype.apply(self)
    love.graphics.translate(
        love.graphics.getWidth() / 2,
        love.graphics.getHeight() / 2
    )
    love.graphics.scale(self.scaleFactor, self.scaleFactor)
    love.graphics.translate(self.tx, self.ty)
end
LevelEditorCamera.minimumScaleFactor = 0.1
LevelEditorCamera.maximumScaleFactor = 1.5
return ____exports
