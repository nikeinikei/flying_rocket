--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 5,["11"] = 7,["12"] = 9,["13"] = 9,["14"] = 9,["15"] = 21,["16"] = 22,["17"] = 23,["18"] = 24,["19"] = 25,["20"] = 26,["21"] = 27,["22"] = 28,["23"] = 30,["24"] = 30,["25"] = 30,["26"] = 30,["27"] = 31,["28"] = 21,["29"] = 34,["30"] = 35,["31"] = 34,["32"] = 38,["33"] = 39,["34"] = 38,["35"] = 42,["36"] = 43,["37"] = 42,["38"] = 46,["39"] = 47,["40"] = 46,["41"] = 51,["42"] = 52,["43"] = 51,["44"] = 55,["45"] = 56,["46"] = 57,["47"] = 58,["48"] = 60,["49"] = 61,["50"] = 62,["51"] = 63,["52"] = 55,["53"] = 66,["54"] = 67,["55"] = 68,["56"] = 68,["58"] = 68,["59"] = 68,["60"] = 68,["61"] = 68,["62"] = 68,["63"] = 69,["64"] = 71,["65"] = 72,["66"] = 73,["67"] = 66,["68"] = 10,["69"] = 11,["70"] = 12});
local ____exports = {}
local ____wrappeddrawable = require("wrappeddrawable")
local WrappedDrawable = ____wrappeddrawable.WrappedDrawable
local ____ImageUtils = require("graphics.ImageUtils")
local ImageUtils = ____ImageUtils.ImageUtils
local rotationSpeed = (2 * math.pi) / 20
local maxThrust = 600
local rocketImage = love.graphics.newImage("res/rocket.png")
____exports.Rocket = __TS__Class()
local Rocket = ____exports.Rocket
Rocket.name = "Rocket"
function Rocket.prototype.____constructor(self, world, x, y)
    self.body = love.physics.newBody(world, x, y, "dynamic")
    self.body:setMass(1)
    self.shape = love.physics.newRectangleShape(____exports.Rocket.width, ____exports.Rocket.height)
    self.fixture = love.physics.newFixture(self.body, self.shape, 1)
    self.fixture:setUserData(____exports.Rocket.userData)
    self.rotation = 0
    self.thrust = 0.9
    self.rocketDrawable = __TS__New(
        WrappedDrawable,
        ImageUtils.scaleImageToDimensions(rocketImage, ____exports.Rocket.width, ____exports.Rocket.height)
    )
    self.rocketDrawable.ox, self.rocketDrawable.oy = unpack({____exports.Rocket.width / 2, ____exports.Rocket.height / 2})
end
function Rocket.prototype.getBody(self)
    return self.body
end
function Rocket.prototype.getTilt(self)
    return self.body:getAngle()
end
function Rocket.prototype.setThrust(self, thrust)
    self.thrust = thrust
end
function Rocket.prototype.setRotation(self, rotation)
    self.rotation = rotation
end
function Rocket.prototype.getPosition(self)
    return self.body:getPosition()
end
function Rocket.prototype.update(self, dt)
    local angle = self.body:getAngle()
    angle = angle + ((rotationSpeed * dt) * self.rotation)
    self.body:setAngle(angle)
    local effectiveThrust = self.thrust * maxThrust
    local effectiveThrustX = math.sin(angle) * effectiveThrust
    local effectiveThrustY = -math.cos(angle) * effectiveThrust
    self.body:applyForce(effectiveThrustX, effectiveThrustY)
end
function Rocket.prototype.draw(self)
    love.graphics.setColor(0.7, 0.7, 0.7, 1)
    love.graphics.polygon(
        "fill",
        {
            self.body:getWorldPoints(
                self.shape:getPoints()
            )
        }
    )
    love.graphics.setColor(1, 1, 1, 1)
    self.rocketDrawable.x, self.rocketDrawable.y = self.body:getPosition()
    self.rocketDrawable.r = self.body:getAngle()
    self.rocketDrawable:draw()
end
Rocket.width = 50
Rocket.height = 80
Rocket.userData = "Rocket"
return ____exports
