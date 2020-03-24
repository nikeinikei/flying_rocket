local Rocket = require "rocket"
local Terrain = require "terrain"
local dbprint = require "util.debugprint"
local Controls = require "controls"
local Clock = require "util.clock"

local Playing = {}

local function newStaticRectangle(world, x, y, w, h)
    local body = love.physics.newBody(world, x, y, "static")
    local shape = love.physics.newRectangleShape(w, h)
    local fixture = love.physics.newFixture(body, shape)

    return {
        body = body,
        shape = shape,
        fixture = fixture
    }
end

function Playing:new(level)
    self.level = level
    self.world = love.physics.newWorld(0, 100)

    local rocketStartingLocation = level.rocketStartingLocation
    local rocketLandingLocation = level.rocketLandingLocation

    local rocketX = rocketStartingLocation.x + rocketStartingLocation.w / 2
    local rocketY = rocketStartingLocation.y - Rocket.height / 2

    self.rocket = Rocket(self.world, rocketX, rocketY)

    self.rocketStartingLocationObject = newStaticRectangle(
        self.world, 
        rocketStartingLocation.x + rocketStartingLocation.w / 2,
        rocketStartingLocation.y + rocketStartingLocation.h / 2,
        rocketStartingLocation.w,
        rocketStartingLocation.h
    )

    self.rocketLandingLocationObject = newStaticRectangle(
        self.world, 
        rocketLandingLocation.x + rocketLandingLocation.w / 2,
        rocketLandingLocation.y + rocketLandingLocation.h / 2,
        rocketLandingLocation.w,
        rocketLandingLocation.h
    )

    local windowWidth, windowHeight = love.graphics.getWidth(), love.graphics.getHeight()

    self.border = {}
    self.border.body = love.physics.newBody(self.world, 0, 0)
    self.border.shape = love.physics.newChainShape(true, 
        0, 0,
        windowHeight, 0,
        windowWidth, windowHeight,
        0, windowHeight
    )
    self.border.fixture = love.physics.newFixture(self.border.body, self.border.shape)

    self.terrain = Terrain(self.world, level.terrainPoints:items())
    self.clock = Clock()
end

function Playing:update(dt)
    if love.keyboard.isDown(Controls.game.applyThrust) then 
        self.rocket:setThrust(1)
    else
        self.rocket:setThrust(0)
    end
    
    local rotation = 0
    if love.keyboard.isDown(Controls.game.rotateLeft) then
        rotation = -1
    end
    if love.keyboard.isDown(Controls.game.rotateRight) then
        rotation = rotation + 1
    end
    self.rocket:setRotation(rotation)

    self.rocket:update(dt)
    self.world:update(dt)
end

local function drawObject(o)
    love.graphics.polygon("fill", o.body:getWorldPoints(o.shape:getPoints()))
end

function Playing:draw()
    dbprint.reset()
    self.rocket:draw()
    self.terrain:draw()
    drawObject(self.rocketLandingLocationObject)
    drawObject(self.rocketStartingLocationObject)
    love.graphics.print("elapsed time: " .. tostring(self.clock:getElapsed()), love.graphics.getWidth() - 200, 0)
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
