--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 14,["22"] = 14,["23"] = 15,["24"] = 15,["25"] = 17,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 36,["33"] = 34,["34"] = 37,["35"] = 38,["36"] = 39,["37"] = 39,["38"] = 39,["39"] = 41,["40"] = 42,["41"] = 44,["42"] = 45,["43"] = 47,["44"] = 49,["45"] = 56,["46"] = 58,["47"] = 65,["48"] = 67,["49"] = 68,["50"] = 69,["51"] = 76,["52"] = 78,["54"] = 81,["55"] = 82,["56"] = 83,["57"] = 84,["58"] = 36,["59"] = 87,["60"] = 88,["61"] = 87,["62"] = 91,["63"] = 92,["64"] = 91,["65"] = 95,["66"] = 96,["67"] = 96,["68"] = 97,["69"] = 96,["70"] = 99,["71"] = 99,["72"] = 99,["73"] = 100,["74"] = 95,["75"] = 103,["76"] = 104,["77"] = 105,["78"] = 106,["79"] = 108,["80"] = 103,["81"] = 115,["82"] = 116,["83"] = 116,["84"] = 116,["85"] = 117,["87"] = 120,["88"] = 121,["89"] = 122,["90"] = 123,["92"] = 126,["93"] = 115,["94"] = 130,["95"] = 136,["96"] = 137,["97"] = 138,["98"] = 139,["100"] = 141,["101"] = 142,["103"] = 144,["104"] = 130,["105"] = 147,["106"] = 148,["107"] = 148,["108"] = 148,["109"] = 148,["110"] = 148,["111"] = 148,["112"] = 149,["113"] = 150,["114"] = 151,["116"] = 154,["117"] = 155,["118"] = 156,["120"] = 158,["121"] = 159,["122"] = 160,["123"] = 161,["126"] = 165,["127"] = 166,["128"] = 167,["129"] = 168,["131"] = 170,["134"] = 174,["135"] = 175,["136"] = 176,["137"] = 177,["140"] = 147,["141"] = 182,["142"] = 183,["143"] = 183,["144"] = 183,["145"] = 186,["146"] = 187,["147"] = 187,["148"] = 187,["149"] = 182,["150"] = 190,["151"] = 191,["152"] = 192,["153"] = 192,["154"] = 192,["155"] = 190,["156"] = 195,["157"] = 196,["158"] = 197,["159"] = 195,["160"] = 200,["161"] = 201,["162"] = 202,["164"] = 204,["166"] = 207,["167"] = 208,["168"] = 209,["170"] = 211,["171"] = 212,["173"] = 214,["174"] = 216,["175"] = 217,["176"] = 219,["177"] = 220,["178"] = 221,["179"] = 222,["180"] = 223,["181"] = 229,["182"] = 230,["186"] = 234,["187"] = 235,["188"] = 236,["189"] = 237,["190"] = 238,["192"] = 240,["195"] = 243,["197"] = 246,["198"] = 246,["199"] = 246,["200"] = 247,["202"] = 250,["203"] = 251,["204"] = 251,["205"] = 251,["206"] = 200,["207"] = 254,["208"] = 255,["209"] = 255,["210"] = 255,["211"] = 255,["212"] = 255,["213"] = 255,["214"] = 254,["215"] = 258,["216"] = 259,["217"] = 260,["218"] = 262,["219"] = 263,["220"] = 265,["221"] = 267,["222"] = 269,["223"] = 271,["224"] = 272,["225"] = 273,["226"] = 274,["227"] = 276,["228"] = 278,["229"] = 279,["230"] = 281,["231"] = 258,["232"] = 284,["233"] = 285,["234"] = 286,["235"] = 287,["236"] = 288,["237"] = 289,["238"] = 290,["239"] = 291,["240"] = 292,["241"] = 293,["243"] = 296,["244"] = 298,["245"] = 298,["246"] = 298,["247"] = 300,["248"] = 300,["249"] = 300,["250"] = 300,["251"] = 300,["252"] = 300,["253"] = 300,["254"] = 300,["255"] = 300,["256"] = 302,["257"] = 303,["258"] = 303,["259"] = 303,["260"] = 303,["261"] = 303,["262"] = 304,["263"] = 304,["264"] = 304,["265"] = 304,["266"] = 304,["267"] = 304,["268"] = 304,["269"] = 304,["270"] = 304,["271"] = 305,["272"] = 305,["273"] = 305,["274"] = 305,["275"] = 305,["276"] = 305,["277"] = 305,["279"] = 284,["280"] = 309,["281"] = 310,["282"] = 311,["284"] = 313,["285"] = 314,["287"] = 309});
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
local ____stars = require("stars")
local Stars = ____stars.Stars
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
    self.stars = __TS__New(Stars)
    self.clock = __TS__New(Clock)
end
function Playing.prototype.getName(self)
    return "Playing"
end
function Playing.prototype.serialize(self)
    return {name = "Playing", level = self.level.name}
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
    self.stars:setViewport(
        self.camera:getViewport()
    )
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
    self.stars:draw()
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
