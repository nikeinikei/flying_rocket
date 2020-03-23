local Rocket = require "rocket"
local Terrain = require "terrain"
local Vec = require "vec"
local dbprint = require "debugprint"

local Playing = {}

function Playing:new(level)
    self.level = level
    self.world = love.physics.newWorld(0, 100)

    self.rocket = Rocket(self.world, x, y)

    self.terrain = Terrain(self.world, level.terrainPoints)
end

function Playing:update(dt)
    self.rocket:update(dt)
    self.world:update(dt)
end

function Playing:draw()
    dbprint.reset()
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
