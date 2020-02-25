local Vec = require "vec"

local World = {}

function World:new(rocket, terrain, gravity)
    assertNotNil(rocket)
    assertNotNil(terrain)

    self.rocket = rocket
    self.terrain = terrain
    self.gravity = gravity or Vec()
end

function World:update(dt)
    local rocket = self.rocket

    local combinedAcceleration = self.gravity + rocket.thrust * rocket.tilt
    rocket.vel = rocket.vel + combinedAcceleration * dt
    rocket.pos = rocket.pos + rocket.vel * dt
end

return setmetatable(World, {
    __call = function(_, ...)
        local o = setmetatable({}, {
            __index = World
        })
        o:new(...)
        return o
    end
})