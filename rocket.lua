local dbg = require "util.debugprint"

local Rocket = {}

Rocket.width = 50
Rocket.height = 50
Rocket.userData = "Rocket"

local rotationSpeed = 2 * math.pi / 20
local maxThrust = 400

function Rocket:new(world, x, y)
    self.body = love.physics.newBody(
        world, 
        x, 
        y, 
        "dynamic")
    self.body:setMass(1)
    self.shape = love.physics.newRectangleShape(Rocket.width, Rocket.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(Rocket.userData)
    self.rotation = 0

    self.thrust = 0.9

    self.debug = {}
end

function Rocket:getBody()
    return self.body
end

function Rocket:getTilt()
    return self.body:getAngle()
end

function Rocket:setThrust(thrust)
    self.thrust = thrust
end

function Rocket:setRotation(rotation)
    self.rotation = rotation
end

function Rocket:update(dt)
    local angle = self.body:getAngle()
    angle = angle + rotationSpeed * dt * self.rotation
    self.body:setAngle(angle)

    local effectiveThrust = self.thrust * maxThrust
    local effectiveThrustX = math.sin(angle) * effectiveThrust
    local effectiveThrustY = -math.cos(angle) * effectiveThrust
    self.body:applyForce(effectiveThrustX, effectiveThrustY)

    self.debug.x = effectiveThrustX
    self.debug.y = effectiveThrustY
    self.debug.thrust = effectiveThrust
end

function Rocket:draw()
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
    dbg.print("angle = " .. tostring(self.body:getAngle()))
    dbg.print("thrust.x = " .. tostring(self.debug.x))
    dbg.print("thrust.y = " .. tostring(self.debug.y))
    local x, y = self.body:getLinearVelocity()
    dbg.print("vel.x = " .. x)
    dbg.print("vel.y = " .. y)
end

return setmetatable(Rocket, {
    __call = function(_, ...)
        local o = setmetatable({}, {
            __index = Rocket
        })
        o:new(...)
        return o
    end
})