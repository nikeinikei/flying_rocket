--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 14,["22"] = 15,["23"] = 16,["24"] = 18,["25"] = 18,["26"] = 18,["27"] = 28,["28"] = 29,["29"] = 30,["30"] = 31,["31"] = 31,["32"] = 31,["33"] = 33,["34"] = 34,["35"] = 36,["36"] = 37,["37"] = 39,["38"] = 41,["39"] = 48,["40"] = 50,["41"] = 57,["42"] = 59,["43"] = 61,["44"] = 62,["45"] = 63,["46"] = 28,["47"] = 66,["48"] = 67,["49"] = 67,["50"] = 68,["51"] = 67,["52"] = 70,["53"] = 70,["54"] = 70,["55"] = 71,["56"] = 66,["57"] = 74,["58"] = 75,["59"] = 76,["60"] = 77,["61"] = 79,["62"] = 74,["63"] = 86,["64"] = 87,["65"] = 88,["66"] = 88,["67"] = 88,["68"] = 89,["70"] = 92,["71"] = 93,["72"] = 94,["73"] = 95,["75"] = 98,["76"] = 86,["77"] = 103,["78"] = 108,["79"] = 109,["80"] = 110,["81"] = 111,["83"] = 113,["84"] = 114,["86"] = 116,["87"] = 102,["88"] = 119,["89"] = 120,["90"] = 120,["91"] = 120,["92"] = 120,["93"] = 120,["94"] = 121,["95"] = 122,["96"] = 123,["98"] = 126,["99"] = 127,["100"] = 128,["102"] = 130,["103"] = 131,["104"] = 132,["105"] = 133,["108"] = 137,["109"] = 138,["110"] = 139,["111"] = 140,["113"] = 142,["116"] = 119,["117"] = 147,["118"] = 148,["119"] = 148,["120"] = 148,["121"] = 151,["122"] = 152,["123"] = 152,["124"] = 152,["125"] = 147,["126"] = 155,["127"] = 156,["128"] = 157,["129"] = 157,["130"] = 157,["131"] = 155,["132"] = 160,["133"] = 161,["134"] = 162,["136"] = 164,["138"] = 167,["139"] = 168,["140"] = 169,["142"] = 171,["143"] = 172,["145"] = 174,["146"] = 176,["147"] = 177,["148"] = 179,["149"] = 179,["150"] = 179,["151"] = 180,["153"] = 183,["154"] = 160,["155"] = 186,["156"] = 187,["157"] = 187,["158"] = 187,["159"] = 187,["160"] = 187,["161"] = 187,["162"] = 186,["163"] = 190,["164"] = 191,["165"] = 192,["166"] = 193,["167"] = 194,["168"] = 195,["169"] = 196,["170"] = 198,["171"] = 199,["172"] = 199,["173"] = 199,["174"] = 199,["175"] = 199,["176"] = 199,["177"] = 199,["178"] = 199,["179"] = 199,["180"] = 200,["181"] = 200,["182"] = 200,["183"] = 200,["184"] = 200,["185"] = 190,["186"] = 203,["187"] = 204,["188"] = 205,["190"] = 207,["191"] = 208,["193"] = 203});
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
    local tilt = rocket:getTilt()
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
