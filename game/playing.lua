--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 14,["24"] = 14,["25"] = 16,["26"] = 17,["27"] = 18,["28"] = 19,["29"] = 21,["30"] = 21,["31"] = 21,["32"] = 35,["33"] = 33,["34"] = 36,["35"] = 37,["36"] = 38,["37"] = 38,["38"] = 38,["39"] = 40,["40"] = 41,["41"] = 43,["42"] = 44,["43"] = 46,["44"] = 48,["45"] = 55,["46"] = 57,["47"] = 64,["48"] = 66,["49"] = 67,["50"] = 68,["51"] = 75,["52"] = 77,["54"] = 80,["55"] = 81,["56"] = 82,["57"] = 83,["58"] = 35,["59"] = 86,["60"] = 87,["61"] = 87,["62"] = 88,["63"] = 87,["64"] = 90,["65"] = 90,["66"] = 90,["67"] = 91,["68"] = 86,["69"] = 94,["70"] = 95,["71"] = 96,["72"] = 97,["73"] = 99,["74"] = 94,["75"] = 106,["76"] = 107,["77"] = 107,["78"] = 107,["79"] = 108,["81"] = 111,["82"] = 112,["83"] = 113,["84"] = 114,["86"] = 117,["87"] = 106,["88"] = 122,["89"] = 127,["90"] = 128,["91"] = 129,["92"] = 130,["94"] = 132,["95"] = 133,["97"] = 135,["98"] = 121,["99"] = 138,["100"] = 139,["101"] = 139,["102"] = 139,["103"] = 139,["104"] = 139,["105"] = 139,["106"] = 140,["107"] = 141,["108"] = 142,["110"] = 145,["111"] = 146,["112"] = 147,["114"] = 149,["115"] = 150,["116"] = 151,["117"] = 152,["120"] = 156,["121"] = 157,["122"] = 158,["123"] = 159,["125"] = 161,["128"] = 165,["129"] = 166,["130"] = 167,["131"] = 168,["134"] = 138,["135"] = 173,["136"] = 174,["137"] = 174,["138"] = 174,["139"] = 177,["140"] = 178,["141"] = 178,["142"] = 178,["143"] = 173,["144"] = 181,["145"] = 182,["146"] = 183,["147"] = 183,["148"] = 183,["149"] = 181,["150"] = 186,["151"] = 187,["152"] = 188,["153"] = 186,["154"] = 191,["155"] = 192,["156"] = 193,["158"] = 195,["160"] = 198,["161"] = 199,["162"] = 200,["164"] = 202,["165"] = 203,["167"] = 205,["168"] = 207,["169"] = 208,["170"] = 210,["171"] = 211,["172"] = 212,["173"] = 213,["174"] = 214,["175"] = 220,["176"] = 221,["180"] = 225,["181"] = 226,["182"] = 227,["183"] = 228,["184"] = 229,["186"] = 231,["189"] = 234,["191"] = 237,["192"] = 237,["193"] = 237,["194"] = 238,["196"] = 241,["197"] = 242,["198"] = 243,["199"] = 243,["200"] = 243,["201"] = 243,["202"] = 243,["203"] = 243,["204"] = 191,["205"] = 246,["206"] = 247,["207"] = 247,["208"] = 247,["209"] = 247,["210"] = 247,["211"] = 247,["212"] = 246,["213"] = 250,["214"] = 251,["215"] = 252,["216"] = 254,["217"] = 255,["218"] = 257,["219"] = 259,["220"] = 261,["221"] = 263,["222"] = 264,["223"] = 265,["224"] = 266,["225"] = 268,["226"] = 270,["227"] = 271,["228"] = 273,["229"] = 250,["230"] = 276,["231"] = 277,["232"] = 278,["233"] = 279,["234"] = 280,["235"] = 281,["236"] = 282,["237"] = 283,["238"] = 284,["239"] = 285,["241"] = 288,["242"] = 290,["243"] = 290,["244"] = 290,["245"] = 292,["246"] = 292,["247"] = 292,["248"] = 292,["249"] = 292,["250"] = 292,["251"] = 292,["252"] = 292,["253"] = 292,["254"] = 294,["255"] = 295,["256"] = 295,["257"] = 295,["258"] = 295,["259"] = 295,["260"] = 296,["261"] = 296,["262"] = 296,["263"] = 296,["264"] = 296,["265"] = 296,["266"] = 296,["267"] = 296,["268"] = 296,["269"] = 297,["270"] = 297,["271"] = 297,["272"] = 297,["273"] = 297,["274"] = 297,["275"] = 297,["277"] = 276,["278"] = 301,["279"] = 302,["280"] = 303,["282"] = 305,["283"] = 306,["285"] = 301});
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
