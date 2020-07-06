--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 15,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 33,["31"] = 31,["32"] = 34,["33"] = 35,["34"] = 36,["35"] = 36,["36"] = 36,["37"] = 38,["38"] = 39,["39"] = 41,["40"] = 42,["41"] = 44,["42"] = 46,["43"] = 53,["44"] = 55,["45"] = 62,["46"] = 64,["47"] = 65,["48"] = 66,["49"] = 73,["50"] = 75,["52"] = 78,["53"] = 79,["54"] = 80,["55"] = 33,["56"] = 83,["57"] = 84,["58"] = 84,["59"] = 85,["60"] = 84,["61"] = 87,["62"] = 87,["63"] = 87,["64"] = 88,["65"] = 83,["66"] = 91,["67"] = 92,["68"] = 93,["69"] = 94,["70"] = 96,["71"] = 91,["72"] = 103,["73"] = 104,["74"] = 104,["75"] = 104,["76"] = 105,["78"] = 108,["79"] = 109,["80"] = 110,["81"] = 111,["83"] = 114,["84"] = 103,["85"] = 119,["86"] = 124,["87"] = 125,["88"] = 126,["89"] = 127,["91"] = 129,["92"] = 130,["94"] = 132,["95"] = 118,["96"] = 135,["97"] = 136,["98"] = 136,["99"] = 136,["100"] = 136,["101"] = 136,["102"] = 136,["103"] = 137,["104"] = 138,["105"] = 139,["107"] = 142,["108"] = 143,["109"] = 144,["111"] = 146,["112"] = 147,["113"] = 148,["114"] = 149,["117"] = 153,["118"] = 154,["119"] = 155,["120"] = 156,["122"] = 158,["125"] = 162,["126"] = 163,["127"] = 164,["128"] = 165,["131"] = 135,["132"] = 170,["133"] = 171,["134"] = 171,["135"] = 171,["136"] = 174,["137"] = 175,["138"] = 175,["139"] = 175,["140"] = 170,["141"] = 178,["142"] = 179,["143"] = 180,["144"] = 180,["145"] = 180,["146"] = 178,["147"] = 183,["148"] = 184,["149"] = 185,["150"] = 183,["151"] = 188,["152"] = 189,["153"] = 190,["155"] = 192,["157"] = 195,["158"] = 196,["159"] = 197,["161"] = 199,["162"] = 200,["164"] = 202,["165"] = 204,["166"] = 205,["167"] = 207,["168"] = 208,["169"] = 209,["170"] = 210,["171"] = 211,["172"] = 217,["173"] = 218,["177"] = 222,["178"] = 223,["179"] = 224,["180"] = 225,["181"] = 226,["183"] = 228,["186"] = 231,["188"] = 234,["189"] = 234,["190"] = 234,["191"] = 235,["193"] = 238,["194"] = 188,["195"] = 241,["196"] = 242,["197"] = 242,["198"] = 242,["199"] = 242,["200"] = 242,["201"] = 242,["202"] = 241,["203"] = 245,["204"] = 246,["205"] = 247,["206"] = 249,["207"] = 250,["208"] = 252,["209"] = 254,["210"] = 256,["211"] = 258,["212"] = 259,["213"] = 260,["214"] = 261,["215"] = 263,["216"] = 265,["217"] = 266,["218"] = 268,["219"] = 245,["220"] = 271,["221"] = 272,["222"] = 273,["223"] = 274,["224"] = 275,["225"] = 276,["226"] = 277,["227"] = 278,["228"] = 279,["230"] = 283,["231"] = 285,["232"] = 285,["233"] = 285,["234"] = 287,["235"] = 287,["236"] = 287,["237"] = 287,["238"] = 287,["239"] = 287,["240"] = 287,["241"] = 287,["242"] = 287,["243"] = 289,["244"] = 290,["245"] = 290,["246"] = 290,["247"] = 290,["248"] = 290,["249"] = 291,["250"] = 291,["251"] = 291,["252"] = 291,["253"] = 291,["254"] = 291,["255"] = 291,["256"] = 291,["257"] = 291,["258"] = 292,["259"] = 292,["260"] = 292,["261"] = 292,["262"] = 292,["263"] = 292,["264"] = 292,["266"] = 271,["267"] = 296,["268"] = 297,["269"] = 298,["271"] = 300,["272"] = 301,["274"] = 296});
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
local ____settings = require("settings")
local Settings = ____settings.Settings
local ____terrain = require("terrain")
local Terrain = ____terrain.Terrain
local ____clock = require("util.clock")
local Clock = ____clock.Clock
local ____won = require("won")
local Won = ____won.Won
local borderUserData = "border"
local rocketStartingLocationUserData = "rocketStartingLocationUserData"
local rocketLandingLocationUserdata = "rocketLandingLocationUserdata"
local refuelStationUserData = "refuelStationUserData"
____exports.Playing = __TS__Class()
local Playing = ____exports.Playing
Playing.name = "Playing"
function Playing.prototype.____constructor(self, level)
    self.refueling = false
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
    self.refuelStations = {}
    for ____, station in ipairs(self.level.refuelStations) do
        local stationObject = self:newStaticRectangle(self.world, station.x + (station.w / 2), station.y + (station.h / 2), station.w, station.h)
        stationObject.fixture:setUserData(refuelStationUserData)
        __TS__ArrayPush(self.refuelStations, stationObject)
    end
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
    local refuelStation
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
    rocket, refuelStation = self:matchFixtures(a, b, Rocket.userData, refuelStationUserData)
    if rocket then
        if not self:isSafeLanding(self.rocket) then
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
function Playing.prototype.notMoving(self, dx, dy)
    local EPSILON = 0.0001
    return (math.abs(dx) < EPSILON) and (math.abs(dy) < EPSILON)
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
    local contacts = self.world:getContacts()
    local contactWithRefuelStation = false
    for ____, contact in ipairs(contacts) do
        local fixtureA, fixtureB = contact:getFixtures()
        local rocket, refuelStation = self:matchFixtures(fixtureA, fixtureB, Rocket.userData, refuelStationUserData)
        if rocket then
            contactWithRefuelStation = true
            break
        end
    end
    if contactWithRefuelStation then
        local xVel, yVel = self.rocket:getBody():getLinearVelocity()
        if self:notMoving(xVel, yVel) then
            self.rocket:refuel(dt)
            self.refueling = true
        else
            self.refueling = false
        end
    else
        self.refueling = false
    end
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
function Playing.prototype.drawFuelIndicator(self, fuel)
    local width = 30
    local height = 120
    local x = 15
    local y = 60
    local padding = 5
    local r, g, b, a = love.graphics.getColor()
    love.graphics.setColor(0.7, 0.7, 0.7, 1)
    love.graphics.rectangle("fill", x - padding, y - padding, width + (2 * padding), padding)
    love.graphics.rectangle("fill", x - padding, y + height, width + (2 * padding), padding)
    love.graphics.rectangle("fill", x + width, y, padding, height)
    love.graphics.rectangle("fill", x - padding, y, padding, height)
    love.graphics.setColor(0, 0, 1, 1)
    local fraction = fuel / 100
    love.graphics.rectangle("fill", x, (y + height) - (fraction * height), width, fraction * height)
    love.graphics.setColor(r, g, b, a)
end
function Playing.prototype.draw(self)
    self.camera:apply()
    love.graphics.setColor(1, 1, 1, 1)
    self.rocket:draw()
    self.terrain:draw()
    self:drawObject(self.rocketStartingLocationObject)
    self:drawObject(self.rocketLandingLocationObject)
    for ____, station in ipairs(self.refuelStations) do
        self:drawObject(station)
    end
    love.graphics.origin()
    self:drawFuelIndicator(
        self.rocket:getFuel()
    )
    love.graphics.print(
        "elapsed time " .. tostring(
            tostring(
                self.clock:getElapsed()
            )
        ),
        love.graphics.getWidth() - 200,
        0
    )
    if Settings.isDevelopment() then
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
        love.graphics.print(
            "refueling " .. tostring(
                tostring(self.refueling)
            ),
            0,
            30
        )
    end
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
