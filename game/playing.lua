--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 15,["24"] = 15,["25"] = 16,["26"] = 16,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 23,["32"] = 24,["33"] = 26,["34"] = 26,["35"] = 26,["36"] = 26,["37"] = 42,["38"] = 26,["39"] = 38,["40"] = 44,["41"] = 45,["42"] = 46,["43"] = 46,["44"] = 46,["45"] = 48,["46"] = 49,["47"] = 51,["48"] = 52,["49"] = 54,["50"] = 56,["51"] = 63,["52"] = 65,["53"] = 72,["54"] = 74,["55"] = 75,["56"] = 76,["57"] = 83,["58"] = 85,["60"] = 88,["61"] = 90,["62"] = 91,["63"] = 92,["64"] = 93,["65"] = 42,["66"] = 96,["67"] = 97,["68"] = 96,["69"] = 100,["70"] = 101,["71"] = 100,["72"] = 104,["73"] = 105,["74"] = 105,["75"] = 106,["76"] = 105,["77"] = 108,["78"] = 108,["79"] = 108,["80"] = 109,["81"] = 104,["82"] = 112,["83"] = 113,["84"] = 114,["85"] = 115,["86"] = 117,["87"] = 112,["88"] = 124,["89"] = 125,["90"] = 125,["91"] = 125,["92"] = 126,["94"] = 129,["95"] = 130,["96"] = 131,["97"] = 132,["99"] = 135,["100"] = 124,["101"] = 139,["102"] = 145,["103"] = 146,["104"] = 147,["105"] = 148,["107"] = 150,["108"] = 151,["110"] = 153,["111"] = 139,["112"] = 156,["113"] = 157,["114"] = 157,["115"] = 157,["116"] = 157,["117"] = 157,["118"] = 157,["119"] = 158,["120"] = 159,["121"] = 160,["123"] = 163,["124"] = 164,["125"] = 165,["127"] = 167,["128"] = 168,["129"] = 169,["130"] = 170,["133"] = 174,["134"] = 175,["135"] = 176,["136"] = 177,["138"] = 179,["141"] = 183,["142"] = 184,["143"] = 185,["144"] = 186,["147"] = 156,["148"] = 191,["149"] = 192,["150"] = 192,["151"] = 192,["152"] = 195,["153"] = 196,["154"] = 196,["155"] = 196,["156"] = 191,["157"] = 199,["158"] = 200,["159"] = 201,["160"] = 201,["161"] = 201,["162"] = 199,["163"] = 204,["164"] = 205,["165"] = 206,["166"] = 204,["167"] = 209,["168"] = 210,["169"] = 212,["170"] = 213,["171"] = 214,["173"] = 209,["174"] = 218,["175"] = 219,["176"] = 220,["178"] = 222,["180"] = 225,["181"] = 226,["182"] = 227,["184"] = 229,["185"] = 230,["187"] = 232,["188"] = 234,["189"] = 235,["190"] = 237,["191"] = 238,["192"] = 239,["193"] = 240,["194"] = 241,["195"] = 247,["196"] = 248,["200"] = 252,["201"] = 253,["202"] = 254,["203"] = 255,["204"] = 256,["206"] = 258,["209"] = 261,["211"] = 264,["212"] = 264,["213"] = 264,["214"] = 265,["216"] = 268,["217"] = 269,["218"] = 269,["219"] = 269,["220"] = 218,["221"] = 272,["222"] = 273,["223"] = 273,["224"] = 273,["225"] = 273,["226"] = 273,["227"] = 273,["228"] = 272,["229"] = 276,["230"] = 277,["231"] = 278,["232"] = 280,["233"] = 281,["234"] = 283,["235"] = 285,["236"] = 287,["237"] = 289,["238"] = 290,["239"] = 291,["240"] = 292,["241"] = 294,["242"] = 296,["243"] = 297,["244"] = 299,["245"] = 276,["246"] = 302,["247"] = 303,["248"] = 304,["249"] = 305,["250"] = 306,["251"] = 307,["252"] = 308,["253"] = 309,["254"] = 310,["255"] = 311,["257"] = 314,["258"] = 316,["259"] = 316,["260"] = 316,["261"] = 318,["262"] = 318,["263"] = 318,["264"] = 318,["265"] = 318,["266"] = 318,["267"] = 318,["268"] = 318,["269"] = 318,["270"] = 320,["271"] = 321,["272"] = 321,["273"] = 321,["274"] = 321,["275"] = 321,["276"] = 322,["277"] = 322,["278"] = 322,["279"] = 322,["280"] = 322,["281"] = 322,["282"] = 322,["283"] = 322,["284"] = 322,["285"] = 323,["286"] = 323,["287"] = 323,["288"] = 323,["289"] = 323,["290"] = 323,["291"] = 323,["293"] = 302,["294"] = 327,["295"] = 328,["296"] = 329,["298"] = 331,["299"] = 332,["301"] = 327});
local ____exports = {}
local ____controls = require("controls")
local Controls = ____controls.Controls
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
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
local physicsTicks = 60
local timePerTick = 1 / physicsTicks
____exports.Playing = __TS__Class()
local Playing = ____exports.Playing
Playing.name = "Playing"
__TS__ClassExtends(Playing, GameState)
function Playing.prototype.____constructor(self, level)
    GameState.prototype.____constructor(self)
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
    self.elapsed = 0
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
    self.elapsed = self.elapsed + dt
    while self.elapsed >= timePerTick do
        self:physicsUpdate(timePerTick)
        self.elapsed = self.elapsed - timePerTick
    end
end
function Playing.prototype.physicsUpdate(self, dt)
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
