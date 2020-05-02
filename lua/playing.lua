local Rocket = require "rocket"
local Terrain = require "terrain"
local dbprint = require "util.debugprint"
local Controls = require "controls"
local Clock = require "util.clock"
local Paused = require "paused"
local LostModule = require "lost"
local WonModule = require "won"

local Playing = {}

local borderUserdata = "Border"
local rocketStartingLocationUserData = "RocketStartingLocation"
local rocketLandingLocationUserData = "RocketLandingLocation"

local
    newStaticRectangle, 
    matchFixtures, 
    isSafeLanding,
    drawObject,
    Playing_world_beginContact, 
    Playing_world_endContact, 
    Playing_world_postSolve, 
    Playing_world_preSolve,
    Playing_lose,
    Playing_win,
    Playing_pause,
    Playing_onunpaused

function Playing_pause(self)
    local onUnpaused = function()
        self.clock:resume()
    end
    Application.pushState(Paused(self, onUnpaused))
    self.clock:pause()
end

function newStaticRectangle(world, x, y, w, h)
    local body      = love.physics.newBody(world, x, y, "static")
    local shape     = love.physics.newRectangleShape(w, h)
    local fixture   = love.physics.newFixture(body, shape)

    return {
        body    = body,
        shape   = shape,
        fixture = fixture
    }
end

function matchFixtures(fixtureA, fixtureB, userDataA, userDataB)
    local a, b = fixtureA:getUserData(), fixtureB:getUserData()
    if a == userDataA and b == userDataB then
        return fixtureA, fixtureB
    end
    if a == userDataB and b == userDataA then
        return fixtureB, fixtureA
    end
    return nil
end

function isSafeLanding(rocket)
    if math.abs(rocket:getTilt()) >= math.pi / 16 then
        return false
    end

    local body = rocket:getBody()
    local dx, dy = body:getLinearVelocity()
    if math.abs(dx) >= 20 or math.abs(dy) >= 40 then
        return false
    end

    return true
end

function Playing_world_beginContact(self, a, b, contact)
    local rocket, border = matchFixtures(a, b, Rocket.userData, borderUserdata)
    if rocket then
        Playing_lose(self)
    end

    local rocket, terrain = matchFixtures(a, b, Rocket.userData, Terrain.userData)
    if rocket then
        Playing_lose(self)
    end

    local rocket, rocketStartingLocation = matchFixtures(a, b, Rocket.userData, rocketStartingLocationUserData)
    if rocket then
        if not isSafeLanding(self.rocket) then
            Playing_lose(self)
        end
    end

    local rocket, rocketLandingLocation = matchFixtures(a, b, Rocket.userData, rocketLandingLocationUserData)
    if rocket then
        if isSafeLanding(self.rocket) then
            Playing_win(self)
        else
            Playing_lose(self)
        end
    end
end

function Playing_world_endContact(self, a, b, contact)
end

function Playing_world_preSolve(self, a, b, contact)
end

function Playing_world_postSolve(self, a, b, contact, ...)
end

function Playing_win(self)
    Application.popState()
    Application.pushState(__TS__New(WonModule.Won))
end

function Playing:new(level)
    self.level = level
    self.world = love.physics.newWorld(0, 100)
    self.debug = false
    local beginContact  = function(...) Playing_world_beginContact  (self, ...) end
    local endContact    = function(...) Playing_world_endContact    (self, ...) end
    local preSolve      = function(...) Playing_world_preSolve      (self, ...) end
    local postSolve     = function(...) Playing_world_postSolve     (self, ...) end
    self.world:setCallbacks(beginContact, endContact, preSolve, postSolve)

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
    self.rocketStartingLocationObject.fixture:setUserData(rocketStartingLocationUserData)

    self.rocketLandingLocationObject = newStaticRectangle(
        self.world, 
        rocketLandingLocation.x + rocketLandingLocation.w / 2,
        rocketLandingLocation.y + rocketLandingLocation.h / 2,
        rocketLandingLocation.w,
        rocketLandingLocation.h
    )
    self.rocketLandingLocationObject.fixture:setUserData(rocketLandingLocationUserData)

    local windowWidth, windowHeight = love.graphics.getWidth(), love.graphics.getHeight()

    self.border = {}
    self.border.body = love.physics.newBody(self.world, 0, 0)
    self.border.shape = love.physics.newChainShape(true, 
        0, 0,
        windowWidth, 0,
        windowWidth, windowHeight,
        0, windowHeight
    )
    self.border.fixture = love.physics.newFixture(self.border.body, self.border.shape)
    self.border.fixture:setUserData(borderUserdata)

    self.terrain = Terrain(self.world, level.terrainPoints:items())
    self.clock = Clock()
end

function Playing_lose(self)
    Application.popState()
    Application.pushState(__TS__New(LostModule.Lost))
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

    if math.abs(self.rocket:getTilt()) > math.pi / 2 then
        Playing_lose(self)
    end
end

function drawObject(o)
    love.graphics.polygon("fill", o.body:getWorldPoints(o.shape:getPoints()))
end

function Playing:draw()
    dbprint.reset()
    love.graphics.setColor(1, 1, 1, 1)
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
    if key == "d" then
        print("debug = true")
        self.debug = true
    end
    if key == "p" then
        Playing_pause(self)
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
