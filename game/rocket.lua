--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 27,["15"] = 28,["16"] = 29,["17"] = 30,["18"] = 31,["19"] = 32,["20"] = 33,["21"] = 34,["22"] = 35,["23"] = 36,["24"] = 38,["25"] = 38,["26"] = 38,["27"] = 38,["28"] = 41,["29"] = 43,["30"] = 43,["31"] = 43,["32"] = 43,["33"] = 43,["34"] = 43,["35"] = 43,["36"] = 43,["37"] = 43,["38"] = 43,["39"] = 43,["40"] = 43,["41"] = 43,["42"] = 43,["43"] = 43,["44"] = 59,["45"] = 60,["46"] = 62,["48"] = 63,["49"] = 63,["51"] = 64,["52"] = 64,["53"] = 65,["54"] = 66,["55"] = 66,["56"] = 66,["57"] = 66,["58"] = 66,["59"] = 64,["62"] = 63,["65"] = 70,["67"] = 71,["68"] = 71,["69"] = 72,["70"] = 72,["71"] = 72,["72"] = 73,["73"] = 74,["74"] = 75,["75"] = 76,["76"] = 78,["77"] = 79,["78"] = 80,["79"] = 82,["80"] = 71,["83"] = 27,["84"] = 86,["85"] = 87,["86"] = 86,["87"] = 90,["88"] = 91,["89"] = 90,["90"] = 94,["91"] = 95,["92"] = 94,["93"] = 98,["94"] = 99,["95"] = 98,["96"] = 102,["97"] = 103,["98"] = 102,["99"] = 107,["100"] = 108,["101"] = 107,["102"] = 111,["103"] = 112,["104"] = 111,["105"] = 115,["106"] = 116,["107"] = 117,["108"] = 118,["109"] = 120,["110"] = 121,["111"] = 123,["112"] = 124,["113"] = 125,["114"] = 126,["116"] = 128,["118"] = 130,["119"] = 131,["120"] = 133,["121"] = 134,["122"] = 135,["123"] = 136,["124"] = 138,["125"] = 138,["126"] = 138,["127"] = 139,["128"] = 140,["130"] = 115,["131"] = 144,["132"] = 145,["133"] = 146,["134"] = 147,["135"] = 149,["136"] = 149,["137"] = 149,["138"] = 150,["139"] = 151,["140"] = 152,["142"] = 144,["143"] = 6,["144"] = 7,["145"] = 8,["146"] = 10,["147"] = 11,["148"] = 12,["149"] = 13,["150"] = 14,["151"] = 15});
local ____exports = {}
local ____Color4 = require("Color4")
local Color = ____Color4.Color
local ____ImageUtils = require("graphics.ImageUtils")
local ImageUtils = ____ImageUtils.ImageUtils
local ____wrappeddrawable = require("wrappeddrawable")
local WrappedDrawable = ____wrappeddrawable.WrappedDrawable
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
    self.pedal = 0
    self.thrust = 0
    self.fuel = 100
    self.rocketDrawable = __TS__New(
        WrappedDrawable,
        ImageUtils.scaleImageToDimensions(____exports.Rocket.rocketImage, ____exports.Rocket.width, ____exports.Rocket.height)
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
function Rocket.prototype.setPedal(self, pedal)
    self.pedal = pedal
end
function Rocket.prototype.setRotation(self, rotation)
    self.rotation = rotation
end
function Rocket.prototype.getFuel(self)
    return self.fuel
end
function Rocket.prototype.getPosition(self)
    return self.body:getPosition()
end
function Rocket.prototype.refuel(self, dt)
    self.fuel = math.min(100, self.fuel + (____exports.Rocket.refuelRate * dt))
end
function Rocket.prototype.update(self, dt)
    local angle = self.body:getAngle()
    angle = angle + ((____exports.Rocket.rotationSpeed * dt) * self.rotation)
    self.body:setAngle(angle)
    self.fuel = self.fuel - ((self.thrust * ____exports.Rocket.fuelThrustConversionFactor) * dt)
    self.fuel = math.max(0, self.fuel)
    local currentThrust = self.thrust
    local diff
    if self.fuel > 0 then
        diff = self.pedal - currentThrust
    else
        diff = -currentThrust
    end
    local rate = 7
    self.thrust = self.thrust + ((diff * rate) * dt)
    local effectiveThrust = self.thrust * ____exports.Rocket.maxThrust
    local effectiveThrustX = math.sin(angle) * effectiveThrust
    local effectiveThrustY = -math.cos(angle) * effectiveThrust
    self.body:applyForce(effectiveThrustX, effectiveThrustY)
    for ____, ____value in ipairs(self.particleSystems) do
        local particleSystem = ____value[1]
        local _ = ____value[2]
        particleSystem:setEmissionRate(self.thrust * ____exports.Rocket.maxEmissionRate)
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
Rocket.userData = "Rocket"
Rocket.width = 50
Rocket.height = 80
Rocket.maxEmissionRate = 200
Rocket.maxThrust = 600
Rocket.rotationSpeed = (2 * math.pi) / 20
Rocket.rocketImage = love.graphics.newImage("res/rocket.png")
Rocket.fuelThrustConversionFactor = 100 / 20
Rocket.refuelRate = 10
return ____exports
