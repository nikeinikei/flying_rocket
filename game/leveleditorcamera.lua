--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 12,["8"] = 12,["9"] = 12,["11"] = 35,["12"] = 36,["13"] = 37,["14"] = 38,["15"] = 39,["16"] = 43,["17"] = 34,["18"] = 51,["19"] = 52,["20"] = 53,["21"] = 53,["22"] = 53,["23"] = 53,["24"] = 51,["25"] = 60,["26"] = 61,["27"] = 60,["28"] = 69,["29"] = 70,["30"] = 72,["31"] = 73,["32"] = 75,["33"] = 76,["34"] = 77,["35"] = 78,["36"] = 80,["37"] = 83,["39"] = 85,["40"] = 86,["42"] = 89,["43"] = 92,["45"] = 94,["46"] = 95,["48"] = 98,["49"] = 99,["50"] = 69,["51"] = 102,["52"] = 103,["53"] = 103,["54"] = 103,["55"] = 103,["56"] = 104,["57"] = 105,["58"] = 102,["59"] = 13,["60"] = 14});
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
