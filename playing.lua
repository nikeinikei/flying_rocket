local Rocket = require "rocket"
local Terrain = require "terrain"
local Vec = require "vec"

local Playing = {}

function Playing:new()
    self.world = love.physics.newWorld(0, 100)

    self.rocket = Rocket(self.world)

    self.terrain = Terrain(self.world, {
        0, love.graphics.getHeight() - 50,
        love.graphics.getWidth() / 2, love.graphics.getHeight()  - 100,
        love.graphics.getWidth(), love.graphics.getHeight() - 40
    })
end

function Playing:update(dt)
    self.world:update(dt)
end

function Playing:draw()
    self.rocket:draw()
    self.terrain:draw()
end

function Playing:keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end

return setmetatable(Playing, {
    __call = function(t, ...)
        local o = setmetatable({}, {
            __index = Playing
        })
        o:new(...)
        return o
    end 
})
