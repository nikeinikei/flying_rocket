--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 3,["8"] = 4,["9"] = 6,["10"] = 8,["11"] = 8,["12"] = 8,["13"] = 20,["14"] = 21,["15"] = 22,["16"] = 23,["17"] = 24,["18"] = 25,["19"] = 26,["20"] = 27,["21"] = 28,["22"] = 29,["23"] = 30,["24"] = 20,["25"] = 33,["26"] = 34,["27"] = 33,["28"] = 37,["29"] = 38,["30"] = 37,["31"] = 41,["32"] = 42,["33"] = 41,["34"] = 45,["35"] = 46,["36"] = 45,["37"] = 49,["38"] = 50,["39"] = 49,["40"] = 54,["41"] = 55,["42"] = 54,["43"] = 58,["44"] = 59,["45"] = 60,["46"] = 61,["47"] = 63,["48"] = 64,["49"] = 65,["50"] = 66,["51"] = 58,["52"] = 69,["53"] = 70,["54"] = 71,["55"] = 72,["56"] = 69,["57"] = 9,["58"] = 10,["59"] = 11});
local ____exports = {}
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
    self.shape = self:createGraphicsCoordinatesRectangleShape(____exports.Rocket.width, ____exports.Rocket.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(____exports.Rocket.userData)
    self.rotation = 0
    self.thrust = 0.9
    self.rocketDrawable = __TS__New(WrappedDrawable, rocketImage)
    local imageWidth, imageHeight = rocketImage:getDimensions()
    self.rocketDrawable.sx, self.rocketDrawable.sy = unpack({____exports.Rocket.width / imageWidth, ____exports.Rocket.height / imageHeight})
end
function Rocket.prototype.createGraphicsCoordinatesRectangleShape(self, width, height)
    return love.physics.newPolygonShape(0, 0, width, 0, width, height, 0, height)
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
    self.rocketDrawable.x, self.rocketDrawable.y = self.body:getPosition()
    self.rocketDrawable.r = self.body:getAngle()
    self.rocketDrawable:draw()
end
Rocket.width = 50
Rocket.height = 80
Rocket.userData = "Rocket"
return ____exports
