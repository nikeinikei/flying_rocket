--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 6,["13"] = 8,["14"] = 10,["15"] = 10,["16"] = 10,["17"] = 25,["18"] = 26,["19"] = 27,["20"] = 28,["21"] = 29,["22"] = 30,["23"] = 31,["24"] = 32,["25"] = 34,["26"] = 34,["27"] = 34,["28"] = 34,["29"] = 37,["30"] = 39,["31"] = 39,["32"] = 39,["33"] = 39,["34"] = 39,["35"] = 39,["36"] = 39,["37"] = 39,["38"] = 39,["39"] = 39,["40"] = 39,["41"] = 39,["42"] = 39,["43"] = 39,["44"] = 39,["45"] = 55,["46"] = 56,["47"] = 58,["49"] = 59,["50"] = 59,["52"] = 60,["53"] = 60,["54"] = 61,["55"] = 62,["56"] = 62,["57"] = 62,["58"] = 62,["59"] = 62,["60"] = 60,["63"] = 59,["66"] = 66,["68"] = 67,["69"] = 67,["70"] = 68,["71"] = 68,["72"] = 68,["73"] = 69,["74"] = 70,["75"] = 71,["76"] = 72,["77"] = 74,["78"] = 75,["79"] = 76,["80"] = 78,["81"] = 67,["84"] = 25,["85"] = 82,["86"] = 83,["87"] = 82,["88"] = 86,["89"] = 87,["90"] = 86,["91"] = 90,["92"] = 91,["93"] = 90,["94"] = 94,["95"] = 95,["96"] = 94,["97"] = 99,["98"] = 100,["99"] = 99,["100"] = 103,["101"] = 104,["102"] = 105,["103"] = 106,["104"] = 108,["105"] = 109,["106"] = 110,["107"] = 111,["108"] = 113,["109"] = 114,["110"] = 114,["111"] = 114,["112"] = 115,["113"] = 116,["114"] = 117,["115"] = 119,["116"] = 120,["118"] = 103,["119"] = 124,["120"] = 125,["121"] = 126,["122"] = 127,["123"] = 129,["124"] = 129,["125"] = 129,["126"] = 130,["127"] = 131,["128"] = 132,["130"] = 124,["131"] = 11,["132"] = 12,["133"] = 13,["134"] = 14});
local ____exports = {}
local ____Color4 = require("Color4")
local Color = ____Color4.Color
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
    local shadesOfRed = {
        Color:fromBytes(255, 160, 122),
        Color:fromBytes(250, 128, 114),
        Color:fromBytes(233, 150, 122),
        Color:fromBytes(255, 160, 122),
        Color:fromBytes(240, 128, 128),
        Color:fromBytes(205, 92, 92),
        Color:fromBytes(220, 20, 60),
        Color:fromBytes(178, 34, 34),
        Color:fromBytes(255, 0, 0),
        Color:fromBytes(139, 0, 0),
        Color:fromBytes(128, 0, 0),
        Color:fromBytes(255, 99, 71),
        Color:fromBytes(255, 69, 0)
    }
    local width = 4
    local height = 4
    local imageData = love.image.newImageData(4, 4)
    do
        local i = 0
        while i < width do
            do
                local j = 0
                while j < height do
                    local randomColor = shadesOfRed[love.math.random(#shadesOfRed)]
                    imageData:setPixel(
                        i,
                        j,
                        randomColor:unpacked()
                    )
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    self.particleSystems = {}
    do
        local i = 0
        while i < 3 do
            local particleSystem = love.graphics.newParticleSystem(
                love.graphics.newImage(imageData)
            )
            particleSystem:setParticleLifetime(0.4, 0.8)
            particleSystem:setEmissionRate(0)
            particleSystem:setLinearAcceleration(-10, 500, 10, 700)
            particleSystem:setColors(1, 1, 1, 1, 1, 1, 1, 0)
            local drawable = __TS__New(WrappedDrawable, particleSystem)
            drawable.oy = -____exports.Rocket.height / 2
            drawable.ox = (-____exports.Rocket.width / 2) + ((i * ____exports.Rocket.width) / 2)
            __TS__ArrayPush(self.particleSystems, {particleSystem, drawable})
            i = i + 1
        end
    end
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
    local targetEmissionRate = self.thrust * ____exports.Rocket.maxEmissionRate
    for ____, ____value in ipairs(self.particleSystems) do
        local particleSystem = ____value[1]
        local _ = ____value[2]
        local currentEmissionRate = particleSystem:getEmissionRate()
        local diff = targetEmissionRate - currentEmissionRate
        local rate = 7
        particleSystem:setEmissionRate(currentEmissionRate + ((diff * rate) * dt))
        particleSystem:update(dt)
    end
end
function Rocket.prototype.draw(self)
    self.rocketDrawable.x, self.rocketDrawable.y = self.body:getPosition()
    self.rocketDrawable.r = self.body:getAngle()
    self.rocketDrawable:draw()
    for ____, ____value in ipairs(self.particleSystems) do
        local _ = ____value[1]
        local particleSystemDrawable = ____value[2]
        particleSystemDrawable.x, particleSystemDrawable.y = self.body:getPosition()
        particleSystemDrawable.r = self.body:getAngle()
        particleSystemDrawable:draw()
    end
end
Rocket.width = 50
Rocket.height = 80
Rocket.userData = "Rocket"
Rocket.maxEmissionRate = 200
return ____exports
