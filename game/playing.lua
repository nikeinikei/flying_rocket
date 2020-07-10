--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 14,["24"] = 14,["25"] = 17,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 36,["33"] = 34,["34"] = 37,["35"] = 38,["36"] = 39,["37"] = 39,["38"] = 39,["39"] = 41,["40"] = 42,["41"] = 44,["42"] = 45,["43"] = 47,["44"] = 49,["45"] = 56,["46"] = 58,["47"] = 65,["48"] = 67,["49"] = 68,["50"] = 69,["51"] = 76,["52"] = 78,["54"] = 81,["55"] = 82,["56"] = 83,["57"] = 84,["58"] = 36,["59"] = 87,["60"] = 88,["61"] = 87,["62"] = 91,["63"] = 92,["64"] = 92,["65"] = 93,["66"] = 92,["67"] = 95,["68"] = 95,["69"] = 95,["70"] = 96,["71"] = 91,["72"] = 99,["73"] = 100,["74"] = 101,["75"] = 102,["76"] = 104,["77"] = 99,["78"] = 111,["79"] = 112,["80"] = 112,["81"] = 112,["82"] = 113,["84"] = 116,["85"] = 117,["86"] = 118,["87"] = 119,["89"] = 122,["90"] = 111,["91"] = 127,["92"] = 132,["93"] = 133,["94"] = 134,["95"] = 135,["97"] = 137,["98"] = 138,["100"] = 140,["101"] = 126,["102"] = 143,["103"] = 144,["104"] = 144,["105"] = 144,["106"] = 144,["107"] = 144,["108"] = 144,["109"] = 145,["110"] = 146,["111"] = 147,["113"] = 150,["114"] = 151,["115"] = 152,["117"] = 154,["118"] = 155,["119"] = 156,["120"] = 157,["123"] = 161,["124"] = 162,["125"] = 163,["126"] = 164,["128"] = 166,["131"] = 170,["132"] = 171,["133"] = 172,["134"] = 173,["137"] = 143,["138"] = 178,["139"] = 179,["140"] = 179,["141"] = 179,["142"] = 182,["143"] = 183,["144"] = 183,["145"] = 183,["146"] = 178,["147"] = 186,["148"] = 187,["149"] = 188,["150"] = 188,["151"] = 188,["152"] = 186,["153"] = 191,["154"] = 192,["155"] = 193,["156"] = 191,["157"] = 196,["158"] = 197,["159"] = 198,["161"] = 200,["163"] = 203,["164"] = 204,["165"] = 205,["167"] = 207,["168"] = 208,["170"] = 210,["171"] = 212,["172"] = 213,["173"] = 215,["174"] = 216,["175"] = 217,["176"] = 218,["177"] = 219,["178"] = 225,["179"] = 226,["183"] = 230,["184"] = 231,["185"] = 232,["186"] = 233,["187"] = 234,["189"] = 236,["192"] = 239,["194"] = 242,["195"] = 242,["196"] = 242,["197"] = 243,["199"] = 246,["200"] = 247,["201"] = 248,["202"] = 248,["203"] = 248,["204"] = 248,["205"] = 248,["206"] = 248,["207"] = 196,["208"] = 251,["209"] = 252,["210"] = 252,["211"] = 252,["212"] = 252,["213"] = 252,["214"] = 252,["215"] = 251,["216"] = 255,["217"] = 256,["218"] = 257,["219"] = 259,["220"] = 260,["221"] = 262,["222"] = 264,["223"] = 266,["224"] = 268,["225"] = 269,["226"] = 270,["227"] = 271,["228"] = 273,["229"] = 275,["230"] = 276,["231"] = 278,["232"] = 255,["233"] = 281,["234"] = 282,["235"] = 283,["236"] = 284,["237"] = 285,["238"] = 286,["239"] = 287,["240"] = 288,["241"] = 289,["242"] = 290,["244"] = 293,["245"] = 295,["246"] = 295,["247"] = 295,["248"] = 297,["249"] = 297,["250"] = 297,["251"] = 297,["252"] = 297,["253"] = 297,["254"] = 297,["255"] = 297,["256"] = 297,["257"] = 299,["258"] = 300,["259"] = 300,["260"] = 300,["261"] = 300,["262"] = 300,["263"] = 301,["264"] = 301,["265"] = 301,["266"] = 301,["267"] = 301,["268"] = 301,["269"] = 301,["270"] = 301,["271"] = 301,["272"] = 302,["273"] = 302,["274"] = 302,["275"] = 302,["276"] = 302,["277"] = 302,["278"] = 302,["280"] = 281,["281"] = 306,["282"] = 307,["283"] = 308,["285"] = 310,["286"] = 311,["288"] = 306});
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
    local x, y = self.camera:getTranslation()
    self.stars:setViewport(
        x,
        y,
        love.graphics.getWidth(),
        love.graphics.getHeight()
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
