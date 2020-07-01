--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 14,["22"] = 15,["23"] = 16,["24"] = 18,["25"] = 18,["26"] = 18,["27"] = 28,["28"] = 29,["29"] = 30,["30"] = 31,["31"] = 31,["32"] = 31,["33"] = 33,["34"] = 34,["35"] = 36,["36"] = 37,["37"] = 39,["38"] = 41,["39"] = 48,["40"] = 50,["41"] = 57,["42"] = 59,["43"] = 61,["44"] = 62,["45"] = 63,["46"] = 28,["47"] = 66,["48"] = 67,["49"] = 67,["50"] = 68,["51"] = 67,["52"] = 70,["53"] = 70,["54"] = 70,["55"] = 71,["56"] = 66,["57"] = 74,["58"] = 75,["59"] = 76,["60"] = 77,["61"] = 79,["62"] = 74,["63"] = 86,["64"] = 87,["65"] = 87,["66"] = 87,["67"] = 88,["69"] = 91,["70"] = 92,["71"] = 93,["72"] = 94,["74"] = 97,["75"] = 86,["76"] = 102,["77"] = 107,["78"] = 108,["79"] = 109,["80"] = 110,["82"] = 112,["83"] = 113,["85"] = 115,["86"] = 101,["87"] = 118,["88"] = 119,["89"] = 119,["90"] = 119,["91"] = 119,["92"] = 119,["93"] = 120,["94"] = 121,["95"] = 122,["97"] = 125,["98"] = 126,["99"] = 127,["101"] = 129,["102"] = 130,["103"] = 131,["104"] = 132,["107"] = 136,["108"] = 137,["109"] = 138,["110"] = 139,["112"] = 141,["115"] = 118,["116"] = 146,["117"] = 147,["118"] = 147,["119"] = 147,["120"] = 150,["121"] = 151,["122"] = 151,["123"] = 151,["124"] = 146,["125"] = 154,["126"] = 155,["127"] = 156,["128"] = 156,["129"] = 156,["130"] = 154,["131"] = 159,["132"] = 160,["133"] = 161,["135"] = 163,["137"] = 166,["138"] = 167,["139"] = 168,["141"] = 170,["142"] = 171,["144"] = 173,["145"] = 175,["146"] = 176,["147"] = 178,["148"] = 178,["149"] = 178,["150"] = 179,["152"] = 182,["153"] = 159,["154"] = 185,["155"] = 186,["156"] = 186,["157"] = 186,["158"] = 186,["159"] = 186,["160"] = 186,["161"] = 185,["162"] = 189,["163"] = 190,["164"] = 191,["165"] = 192,["166"] = 193,["167"] = 194,["168"] = 195,["169"] = 197,["170"] = 198,["171"] = 198,["172"] = 198,["173"] = 198,["174"] = 198,["175"] = 198,["176"] = 198,["177"] = 198,["178"] = 198,["179"] = 199,["180"] = 199,["181"] = 199,["182"] = 199,["183"] = 199,["184"] = 200,["185"] = 200,["186"] = 200,["187"] = 200,["188"] = 200,["189"] = 200,["190"] = 200,["191"] = 200,["192"] = 200,["193"] = 189,["194"] = 203,["195"] = 204,["196"] = 205,["198"] = 207,["199"] = 208,["201"] = 203});
local ____exports = {}
local ____controls = require("controls")
local Controls = ____controls.Controls
local ____lost = require("lost")
local Lost = ____lost.Lost
local ____paused = require("paused")
local Paused = ____paused.Paused
local ____playingCamera = require("playingCamera")
local PlayingCamera = ____playingCamera.PlayingCamera
local ____rocket = require("rocket")
local Rocket = ____rocket.Rocket
local ____terrain = require("terrain")
local Terrain = ____terrain.Terrain
local ____clock = require("util.clock")
local Clock = ____clock.Clock
local ____won = require("won")
local Won = ____won.Won
local borderUserData = "border"
local rocketStartingLocationUserData = "rocketStartingLocationUserData"
local rocketLandingLocationUserdata = "rocketLandingLocationUserdata"
____exports.Playing = __TS__Class()
local Playing = ____exports.Playing
Playing.name = "Playing"
function Playing.prototype.____constructor(self, level)
    self.level = level
    self.world = love.physics.newWorld(0, 100)
    self.world:setCallbacks(
        function(a, b, c) return self:beginContact(a, b, c) end
    )
    local rocketStartingLocation = level.rocketStartingLocation
    local rocketLandingLocation = level.rocketLandingLocation
    local rocketX = rocketStartingLocation.x + (rocketStartingLocation.w / 2)
    local rocketY = rocketStartingLocation.y - (Rocket.height / 2)
    self.rocket = __TS__New(Rocket, self.world, rocketX, rocketY)
    self.rocketStartingLocationObject = self:newStaticRectangle(self.world, rocketStartingLocation.x + (rocketStartingLocation.w / 2), rocketStartingLocation.y + (rocketStartingLocation.h / 2), rocketStartingLocation.w, rocketStartingLocation.h)
    self.rocketStartingLocationObject.fixture:setUserData(rocketStartingLocationUserData)
    self.rocketLandingLocationObject = self:newStaticRectangle(self.world, rocketLandingLocation.x + (rocketLandingLocation.w / 2), rocketLandingLocation.y + (rocketLandingLocation.h / 2), rocketLandingLocation.w, rocketLandingLocation.h)
    self.rocketLandingLocationObject.fixture:setUserData(rocketLandingLocationUserdata)
    local windowWidth, windowHeight = love.graphics.getDimensions()
    self.terrain = __TS__New(Terrain, self.world, level.terrainPoints)
    self.camera = __TS__New(PlayingCamera, self.rocket)
    self.clock = __TS__New(Clock)
end
function Playing.prototype.pause(self)
    local onUnpaused
    onUnpaused = function()
        self.clock:resume()
    end
    Application.pushState(
        __TS__New(Paused, self, onUnpaused)
    )
    self.clock:pause()
end
function Playing.prototype.newStaticRectangle(self, world, x, y, w, h)
    local body = love.physics.newBody(world, x, y, "static")
    local shape = love.physics.newRectangleShape(w, h)
    local fixture = love.physics.newFixture(body, shape)
    return {body = body, shape = shape, fixture = fixture}
end
function Playing.prototype.isSafeLanding(self, rocket)
    if math.abs(
        rocket:getTilt()
    ) >= (math.pi / 16) then
        return false
    end
    local body = rocket:getBody()
    local dx, dy = body:getLinearVelocity()
    if (math.abs(dx) >= 20) or (math.abs(dy) >= 40) then
        return false
    end
    return true
end
function Playing.prototype.matchFixtures(self, fixtureA, fixtureB, userDataA, userDataB)
    local a = fixtureA:getUserData()
    local b = fixtureB:getUserData()
    if (a == userDataA) and (b == userDataB) then
        return fixtureA, fixtureB
    end
    if (a == userDataB) and (b == userDataA) then
        return fixtureB, fixtureA
    end
    return nil, nil
end
function Playing.prototype.beginContact(self, a, b, contact)
    local rocket
    local border
    local terrain
    local rocketStartingLocation
    local rocketLandingLocation
    rocket, border = self:matchFixtures(a, b, Rocket.userData, borderUserData)
    if rocket then
        self:lose()
    end
    rocket, terrain = self:matchFixtures(a, b, Rocket.userData, Terrain.userData)
    if rocket then
        self:lose()
    end
    rocket, rocketStartingLocation = self:matchFixtures(a, b, Rocket.userData, rocketStartingLocationUserData)
    if rocket then
        if not self:isSafeLanding(self.rocket) then
            self:lose()
        end
    end
    rocket, rocketLandingLocation = self:matchFixtures(a, b, Rocket.userData, rocketLandingLocationUserdata)
    if rocket then
        if self:isSafeLanding(self.rocket) then
            self:win()
        else
            self:lose()
        end
    end
end
function Playing.prototype.win(self)
    local metrics = {
        timeTaken = self.clock:getElapsed()
    }
    Application.popState()
    Application.pushState(
        __TS__New(Won, metrics)
    )
end
function Playing.prototype.lose(self)
    Application.popState()
    Application.pushState(
        __TS__New(Lost)
    )
end
function Playing.prototype.update(self, dt)
    if love.keyboard.isDown(Controls.game.applyThrust) then
        self.rocket:setPedal(1)
    else
        self.rocket:setPedal(0)
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
    if math.abs(
        self.rocket:getTilt()
    ) >= (math.pi / 2) then
        self:lose()
    end
    self.camera:update(dt)
end
function Playing.prototype.drawObject(self, o)
    love.graphics.polygon(
        "fill",
        o.body:getWorldPoints(
            o.shape:getPoints()
        )
    )
end
function Playing.prototype.draw(self)
    self.camera:apply()
    love.graphics.setColor(1, 1, 1, 1)
    self.rocket:draw()
    self.terrain:draw()
    self:drawObject(self.rocketStartingLocationObject)
    self:drawObject(self.rocketLandingLocationObject)
    love.graphics.origin()
    love.graphics.print(
        "elapsed time " .. tostring(
            tostring(
                self.clock:getElapsed()
            )
        ),
        love.graphics.getWidth() - 200,
        0
    )
    love.graphics.print(
        tostring(
            love.timer.getFPS()
        )
    )
    love.graphics.print(
        "fuel = " .. tostring(
            tostring(
                self.rocket:getFuel()
            )
        ),
        0,
        15
    )
end
function Playing.prototype.keypressed(self, key)
    if key == "escape" then
        Application.popState()
    end
    if key == "p" then
        self:pause()
    end
end
return ____exports
