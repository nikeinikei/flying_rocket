local Terrain = {}

-- points are of shape {{x = 0, y = 0}, {x = 0, y = 0}, ... }
function Terrain:new(world, points)
    self.points = points

    self.body = love.physics.newBody(world, 0, 0, "static")
    self.shape = love.physics.newChainShape(false, self.points)
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Terrain:draw()
    love.graphics.line(self.points)
end

return setmetatable(Terrain, {
    __call = function(_, ...)
        local o = setmetatable({}, {
            __index = Terrain
        })
        o:new(...)
        return o
    end
})