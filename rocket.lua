local Vec = require "vec"

local Rocket = {}

function Rocket:new(world)
    self.body = love.physics.newBody(
        world, 
        love.graphics.getWidth() / 2 - 1, 
        love.graphics.getHeight() / 2, 
        "dynamic")
    self.shape = love.physics.newRectangleShape(50, 50)
    self.fixture = love.physics.newFixture(self.body, self.shape)
end

function Rocket:draw()
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
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