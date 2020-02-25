local Vec = require "vec"

local Rocket = {}

function Rocket:new()
    self.pos = Vec()
    self.dim = Vec(50, 50)
    self.vel = Vec()
    self.tilt = 0
    self.thrust = 0
end

function Rocket:draw()
    local halfWidth, halfHeight = self.dim.x / 2, self.dim.y / 2

    love.graphics.push()
    love.graphics.translate(self.pos.x + halfWidth, self.pos.y + halfHeight)
    love.graphics.rotate(self.tilt)
    love.graphics.translate(-halfWidth, -halfHeight)
    love.graphics.rectangle("fill", 0, 0, self.dim.x, self.dim.y)
    love.graphics.pop()
end

return setmetatable(Rocket, {
    __call = function(_, ...)
        local o = setmetatable({}, {
            __index = Rocket
        })
        o:new()
        return o
    end
})