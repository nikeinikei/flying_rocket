--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 12,["8"] = 12,["9"] = 12,["11"] = 38,["12"] = 39,["13"] = 40,["14"] = 41,["15"] = 42,["16"] = 46,["17"] = 52,["18"] = 53,["19"] = 37,["20"] = 56,["21"] = 57,["22"] = 58,["23"] = 58,["24"] = 58,["25"] = 58,["26"] = 56,["27"] = 65,["28"] = 66,["29"] = 65,["30"] = 74,["31"] = 75,["32"] = 77,["33"] = 78,["34"] = 80,["35"] = 81,["36"] = 82,["37"] = 83,["38"] = 85,["39"] = 88,["41"] = 90,["42"] = 91,["44"] = 94,["45"] = 97,["47"] = 99,["48"] = 100,["50"] = 103,["51"] = 104,["52"] = 106,["53"] = 107,["54"] = 74,["55"] = 110,["56"] = 111,["57"] = 111,["58"] = 111,["59"] = 111,["60"] = 112,["61"] = 113,["62"] = 110,["63"] = 13,["64"] = 14});
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
    self.dx = 0
    self.dy = 0
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
    self.dx = updateSmoothValue(self.dx, x, 18, dt)
    self.dy = updateSmoothValue(self.dy, y, 18, dt)
    self.tx = self.tx - ((self.dx * dx) / self.scaleFactor)
    self.ty = self.ty - ((self.dy * dy) / self.scaleFactor)
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
