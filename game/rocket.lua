--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 26,["15"] = 27,["16"] = 28,["17"] = 29,["18"] = 30,["19"] = 31,["20"] = 32,["21"] = 33,["22"] = 34,["23"] = 35,["24"] = 37,["25"] = 37,["26"] = 37,["27"] = 37,["28"] = 40,["29"] = 42,["30"] = 42,["31"] = 42,["32"] = 42,["33"] = 42,["34"] = 42,["35"] = 42,["36"] = 42,["37"] = 42,["38"] = 42,["39"] = 42,["40"] = 42,["41"] = 42,["42"] = 42,["43"] = 42,["44"] = 58,["45"] = 59,["46"] = 61,["48"] = 62,["49"] = 62,["51"] = 63,["52"] = 63,["53"] = 64,["54"] = 65,["55"] = 65,["56"] = 65,["57"] = 65,["58"] = 65,["59"] = 63,["62"] = 62,["65"] = 69,["67"] = 70,["68"] = 70,["69"] = 71,["70"] = 71,["71"] = 71,["72"] = 72,["73"] = 73,["74"] = 74,["75"] = 75,["76"] = 77,["77"] = 78,["78"] = 79,["79"] = 81,["80"] = 70,["83"] = 26,["84"] = 85,["85"] = 86,["86"] = 85,["87"] = 89,["88"] = 90,["89"] = 89,["90"] = 93,["91"] = 94,["92"] = 93,["93"] = 97,["94"] = 98,["95"] = 97,["96"] = 101,["97"] = 102,["98"] = 101,["99"] = 106,["100"] = 107,["101"] = 106,["102"] = 110,["103"] = 111,["104"] = 112,["105"] = 113,["106"] = 115,["107"] = 116,["108"] = 118,["109"] = 119,["110"] = 120,["111"] = 121,["113"] = 123,["115"] = 125,["116"] = 126,["117"] = 128,["118"] = 129,["119"] = 130,["120"] = 131,["121"] = 133,["122"] = 133,["123"] = 133,["124"] = 134,["125"] = 135,["127"] = 110,["128"] = 139,["129"] = 140,["130"] = 141,["131"] = 142,["132"] = 144,["133"] = 144,["134"] = 144,["135"] = 145,["136"] = 146,["137"] = 147,["139"] = 139,["140"] = 6,["141"] = 7,["142"] = 8,["143"] = 10,["144"] = 11,["145"] = 12,["146"] = 13,["147"] = 14});
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
return ____exports
