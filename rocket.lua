local Vec = require "vec"
local dbg = require "debugprint"

local Rocket = {}

local rotationSpeed = 2 * math.pi * 0
local maxThrust = 300   --found out experimentally, how would you find out with equations?

function Rocket:new(world)
    self.body = love.physics.newBody(
        world, 
        love.graphics.getWidth() / 2 - 10, 
        love.graphics.getHeight() / 2, 
        "dynamic")
    self.body:setMass(1)
    self.shape = love.physics.newRectangleShape(50, 50)
    self.fixture = love.physics.newFixture(self.body, self.shape)

    self.thrust = 0.9

    self.debug = {}
end

function Rocket:setThrust(thrust)
    self.thrust = thrust
end

function Rocket:update(dt)
    local angle = self.body:getAngle()
    angle = angle + rotationSpeed * dt
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