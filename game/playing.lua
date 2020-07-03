--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 15,["24"] = 16,["25"] = 17,["26"] = 18,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 33,["31"] = 31,["32"] = 34,["33"] = 35,["34"] = 36,["35"] = 36,["36"] = 36,["37"] = 38,["38"] = 39,["39"] = 41,["40"] = 42,["41"] = 44,["42"] = 46,["43"] = 53,["44"] = 55,["45"] = 62,["46"] = 64,["47"] = 65,["48"] = 66,["49"] = 73,["50"] = 75,["52"] = 78,["53"] = 80,["54"] = 81,["55"] = 82,["56"] = 33,["57"] = 85,["58"] = 86,["59"] = 86,["60"] = 87,["61"] = 86,["62"] = 89,["63"] = 89,["64"] = 89,["65"] = 90,["66"] = 85,["67"] = 93,["68"] = 94,["69"] = 95,["70"] = 96,["71"] = 98,["72"] = 93,["73"] = 105,["74"] = 106,["75"] = 106,["76"] = 106,["77"] = 107,["79"] = 110,["80"] = 111,["81"] = 112,["82"] = 113,["84"] = 116,["85"] = 105,["86"] = 121,["87"] = 126,["88"] = 127,["89"] = 128,["90"] = 129,["92"] = 131,["93"] = 132,["95"] = 134,["96"] = 120,["97"] = 137,["98"] = 138,["99"] = 138,["100"] = 138,["101"] = 138,["102"] = 138,["103"] = 138,["104"] = 139,["105"] = 140,["106"] = 141,["108"] = 144,["109"] = 145,["110"] = 146,["112"] = 148,["113"] = 149,["114"] = 150,["115"] = 151,["118"] = 155,["119"] = 156,["120"] = 157,["121"] = 158,["123"] = 160,["126"] = 164,["127"] = 165,["128"] = 166,["129"] = 167,["132"] = 137,["133"] = 172,["134"] = 173,["135"] = 173,["136"] = 173,["137"] = 176,["138"] = 177,["139"] = 177,["140"] = 177,["141"] = 172,["142"] = 180,["143"] = 181,["144"] = 182,["145"] = 182,["146"] = 182,["147"] = 180,["148"] = 185,["149"] = 186,["150"] = 187,["151"] = 185,["152"] = 190,["153"] = 191,["154"] = 192,["156"] = 194,["158"] = 197,["159"] = 198,["160"] = 199,["162"] = 201,["163"] = 202,["165"] = 204,["166"] = 206,["167"] = 207,["168"] = 209,["169"] = 210,["170"] = 211,["171"] = 212,["172"] = 213,["173"] = 219,["174"] = 220,["178"] = 224,["179"] = 225,["180"] = 226,["181"] = 227,["182"] = 228,["184"] = 230,["187"] = 233,["189"] = 236,["190"] = 236,["191"] = 236,["192"] = 237,["194"] = 240,["195"] = 190,["196"] = 243,["197"] = 244,["198"] = 244,["199"] = 244,["200"] = 244,["201"] = 244,["202"] = 244,["203"] = 243,["204"] = 247,["205"] = 248,["206"] = 249,["207"] = 250,["208"] = 251,["209"] = 252,["210"] = 253,["211"] = 254,["212"] = 255,["214"] = 258,["215"] = 259,["216"] = 259,["217"] = 259,["218"] = 259,["219"] = 259,["220"] = 259,["221"] = 259,["222"] = 259,["223"] = 259,["224"] = 261,["225"] = 262,["226"] = 262,["227"] = 262,["228"] = 262,["229"] = 262,["230"] = 263,["231"] = 263,["232"] = 263,["233"] = 263,["234"] = 263,["235"] = 263,["236"] = 263,["237"] = 263,["238"] = 263,["239"] = 264,["240"] = 264,["241"] = 264,["242"] = 264,["243"] = 264,["244"] = 264,["245"] = 264,["247"] = 247,["248"] = 268,["249"] = 269,["250"] = 270,["252"] = 272,["253"] = 273,["255"] = 268});
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
local ____settings = require("settings")
local Settings = ____settings.Settings
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
