--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 30,["15"] = 31,["16"] = 32,["17"] = 33,["18"] = 34,["19"] = 35,["20"] = 36,["21"] = 37,["22"] = 38,["23"] = 39,["24"] = 41,["25"] = 41,["26"] = 41,["27"] = 41,["28"] = 44,["29"] = 46,["30"] = 46,["31"] = 46,["32"] = 46,["33"] = 46,["34"] = 46,["35"] = 46,["36"] = 46,["37"] = 46,["38"] = 46,["39"] = 46,["40"] = 46,["41"] = 46,["42"] = 46,["43"] = 46,["44"] = 62,["45"] = 63,["46"] = 65,["48"] = 66,["49"] = 66,["51"] = 67,["52"] = 67,["53"] = 68,["54"] = 69,["55"] = 69,["56"] = 69,["57"] = 69,["58"] = 69,["59"] = 67,["62"] = 66,["65"] = 73,["67"] = 74,["68"] = 74,["69"] = 75,["70"] = 75,["71"] = 75,["72"] = 76,["73"] = 77,["74"] = 78,["75"] = 79,["76"] = 81,["77"] = 82,["78"] = 83,["79"] = 85,["80"] = 74,["83"] = 88,["84"] = 89,["85"] = 30,["86"] = 92,["87"] = 93,["88"] = 94,["89"] = 95,["90"] = 96,["91"] = 97,["92"] = 98,["93"] = 98,["94"] = 98,["95"] = 99,["97"] = 92,["98"] = 103,["99"] = 104,["100"] = 103,["101"] = 107,["102"] = 108,["103"] = 107,["104"] = 111,["105"] = 112,["106"] = 111,["107"] = 115,["108"] = 116,["109"] = 115,["110"] = 119,["111"] = 120,["112"] = 119,["113"] = 123,["114"] = 124,["115"] = 123,["116"] = 127,["117"] = 128,["118"] = 127,["119"] = 131,["120"] = 132,["121"] = 131,["122"] = 136,["123"] = 137,["124"] = 136,["125"] = 140,["126"] = 141,["127"] = 140,["128"] = 144,["129"] = 145,["130"] = 146,["131"] = 147,["132"] = 149,["133"] = 150,["134"] = 152,["135"] = 153,["136"] = 154,["137"] = 155,["139"] = 157,["141"] = 159,["142"] = 160,["143"] = 162,["144"] = 163,["145"] = 164,["146"] = 165,["147"] = 167,["148"] = 167,["149"] = 167,["150"] = 168,["151"] = 169,["153"] = 144,["154"] = 173,["155"] = 174,["156"] = 175,["157"] = 176,["158"] = 178,["159"] = 178,["160"] = 178,["161"] = 179,["162"] = 180,["163"] = 181,["165"] = 173,["166"] = 6,["167"] = 7,["168"] = 8,["169"] = 10,["170"] = 11,["171"] = 12,["172"] = 13,["173"] = 14,["174"] = 15,["175"] = 16});
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
    self.fuel = ____exports.Rocket.maxFuel
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
    self.initialX = x
    self.initialY = y
end
function Rocket.prototype.reset(self)
    self.body:setPosition(self.initialX, self.initialY)
    self.body:setAngle(0)
    self.body:setLinearVelocity(0, 0)
    self.body:setAngularVelocity(0)
    self.fuel = ____exports.Rocket.maxFuel
    for ____, ____value in ipairs(self.particleSystems) do
        local particleSystem = ____value[1]
        local _ = ____value[2]
        particleSystem:reset()
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
function Rocket.prototype.getPedal(self)
    return self.pedal
end
function Rocket.prototype.setRotation(self, rotation)
    self.rotation = rotation
end
function Rocket.prototype.getRotation(self)
    return self.rotation
end
function Rocket.prototype.getFuel(self)
    return self.fuel
end
function Rocket.prototype.getThrust(self)
    return self.thrust
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
Rocket.maxFuel = 100
return ____exports
