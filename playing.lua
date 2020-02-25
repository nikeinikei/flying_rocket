local Rocket = require "rocket"
local World = require "world"
local Terrain = require "terrain"
local Vec = require "vec"

local Playing = {}

function Playing:new()
    self.rocket = Rocket()
    self.rocket.pos.x = love.graphics.getWidth() / 2
    self.rocket.pos.y = love.graphics.getHeight() / 2
    self.rocket.tilt = 0
    self.rocket.thrust = 20

    self.terrain = Terrain()

    self.world = World(self.rocket, self.terrain, Vec(0, 50))
end

function Playing:update(dt)
    self.world:update(dt)
end

function Playing:draw()
    self.rocket:draw()
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
