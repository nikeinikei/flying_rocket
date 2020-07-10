--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 14,["22"] = 14,["23"] = 15,["24"] = 15,["25"] = 16,["26"] = 16,["27"] = 18,["28"] = 19,["29"] = 20,["30"] = 21,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 37,["36"] = 23,["37"] = 35,["38"] = 39,["39"] = 40,["40"] = 41,["41"] = 41,["42"] = 41,["43"] = 43,["44"] = 44,["45"] = 46,["46"] = 47,["47"] = 49,["48"] = 51,["49"] = 58,["50"] = 60,["51"] = 67,["52"] = 69,["53"] = 70,["54"] = 71,["55"] = 78,["56"] = 80,["58"] = 83,["59"] = 84,["60"] = 85,["61"] = 86,["62"] = 37,["63"] = 89,["64"] = 90,["65"] = 89,["66"] = 93,["67"] = 94,["68"] = 93,["69"] = 97,["70"] = 98,["71"] = 98,["72"] = 99,["73"] = 98,["74"] = 101,["75"] = 101,["76"] = 101,["77"] = 102,["78"] = 97,["79"] = 105,["80"] = 106,["81"] = 107,["82"] = 108,["83"] = 110,["84"] = 105,["85"] = 117,["86"] = 118,["87"] = 118,["88"] = 118,["89"] = 119,["91"] = 122,["92"] = 123,["93"] = 124,["94"] = 125,["96"] = 128,["97"] = 117,["98"] = 132,["99"] = 138,["100"] = 139,["101"] = 140,["102"] = 141,["104"] = 143,["105"] = 144,["107"] = 146,["108"] = 132,["109"] = 149,["110"] = 150,["111"] = 150,["112"] = 150,["113"] = 150,["114"] = 150,["115"] = 150,["116"] = 151,["117"] = 152,["118"] = 153,["120"] = 156,["121"] = 157,["122"] = 158,["124"] = 160,["125"] = 161,["126"] = 162,["127"] = 163,["130"] = 167,["131"] = 168,["132"] = 169,["133"] = 170,["135"] = 172,["138"] = 176,["139"] = 177,["140"] = 178,["141"] = 179,["144"] = 149,["145"] = 184,["146"] = 185,["147"] = 185,["148"] = 185,["149"] = 188,["150"] = 189,["151"] = 189,["152"] = 189,["153"] = 184,["154"] = 192,["155"] = 193,["156"] = 194,["157"] = 194,["158"] = 194,["159"] = 192,["160"] = 197,["161"] = 198,["162"] = 199,["163"] = 197,["164"] = 202,["165"] = 203,["166"] = 204,["168"] = 206,["170"] = 209,["171"] = 210,["172"] = 211,["174"] = 213,["175"] = 214,["177"] = 216,["178"] = 218,["179"] = 219,["180"] = 221,["181"] = 222,["182"] = 223,["183"] = 224,["184"] = 225,["185"] = 231,["186"] = 232,["190"] = 236,["191"] = 237,["192"] = 238,["193"] = 239,["194"] = 240,["196"] = 242,["199"] = 245,["201"] = 248,["202"] = 248,["203"] = 248,["204"] = 249,["206"] = 252,["207"] = 253,["208"] = 253,["209"] = 253,["210"] = 202,["211"] = 256,["212"] = 257,["213"] = 257,["214"] = 257,["215"] = 257,["216"] = 257,["217"] = 257,["218"] = 256,["219"] = 260,["220"] = 261,["221"] = 262,["222"] = 264,["223"] = 265,["224"] = 267,["225"] = 269,["226"] = 271,["227"] = 273,["228"] = 274,["229"] = 275,["230"] = 276,["231"] = 278,["232"] = 280,["233"] = 281,["234"] = 283,["235"] = 260,["236"] = 286,["237"] = 287,["238"] = 288,["239"] = 289,["240"] = 290,["241"] = 291,["242"] = 292,["243"] = 293,["244"] = 294,["245"] = 295,["247"] = 298,["248"] = 300,["249"] = 300,["250"] = 300,["251"] = 302,["252"] = 302,["253"] = 302,["254"] = 302,["255"] = 302,["256"] = 302,["257"] = 302,["258"] = 302,["259"] = 302,["260"] = 304,["261"] = 305,["262"] = 305,["263"] = 305,["264"] = 305,["265"] = 305,["266"] = 306,["267"] = 306,["268"] = 306,["269"] = 306,["270"] = 306,["271"] = 306,["272"] = 306,["273"] = 306,["274"] = 306,["275"] = 307,["276"] = 307,["277"] = 307,["278"] = 307,["279"] = 307,["280"] = 307,["281"] = 307,["283"] = 286,["284"] = 311,["285"] = 312,["286"] = 313,["288"] = 315,["289"] = 316,["291"] = 311});
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
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local borderUserData = "border"
local rocketStartingLocationUserData = "rocketStartingLocationUserData"
local rocketLandingLocationUserdata = "rocketLandingLocationUserdata"
local refuelStationUserData = "refuelStationUserData"
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
