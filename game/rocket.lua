--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 5,["11"] = 7,["12"] = 9,["13"] = 9,["14"] = 9,["15"] = 21,["16"] = 22,["17"] = 23,["18"] = 24,["19"] = 25,["20"] = 26,["21"] = 27,["22"] = 28,["23"] = 30,["24"] = 30,["25"] = 30,["26"] = 30,["27"] = 33,["28"] = 21,["29"] = 36,["30"] = 37,["31"] = 36,["32"] = 40,["33"] = 41,["34"] = 40,["35"] = 44,["36"] = 45,["37"] = 44,["38"] = 48,["39"] = 49,["40"] = 48,["41"] = 53,["42"] = 54,["43"] = 53,["44"] = 57,["45"] = 58,["46"] = 59,["47"] = 60,["48"] = 62,["49"] = 63,["50"] = 64,["51"] = 65,["52"] = 57,["53"] = 68,["54"] = 69,["55"] = 70,["56"] = 70,["58"] = 70,["59"] = 70,["60"] = 70,["61"] = 70,["62"] = 70,["63"] = 71,["64"] = 73,["65"] = 74,["66"] = 75,["67"] = 68,["68"] = 10,["69"] = 11,["70"] = 12});
local ____exports = {}
local ____ImageUtils = require("graphics.ImageUtils")
local ImageUtils = ____ImageUtils.ImageUtils
local ____wrappeddrawable = require("wrappeddrawable")
local WrappedDrawable = ____wrappeddrawable.WrappedDrawable
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
