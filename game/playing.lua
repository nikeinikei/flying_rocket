--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 15,["24"] = 15,["25"] = 16,["26"] = 16,["27"] = 17,["28"] = 17,["29"] = 17,["30"] = 18,["31"] = 18,["32"] = 21,["33"] = 22,["34"] = 23,["35"] = 24,["36"] = 26,["37"] = 27,["38"] = 44,["39"] = 44,["40"] = 44,["41"] = 52,["42"] = 44,["43"] = 54,["44"] = 56,["45"] = 56,["46"] = 56,["47"] = 56,["48"] = 57,["49"] = 58,["50"] = 59,["51"] = 60,["52"] = 62,["53"] = 63,["54"] = 64,["55"] = 66,["56"] = 68,["57"] = 68,["58"] = 68,["59"] = 68,["60"] = 68,["61"] = 68,["62"] = 68,["63"] = 68,["64"] = 69,["65"] = 68,["66"] = 68,["67"] = 71,["68"] = 71,["69"] = 71,["70"] = 71,["71"] = 71,["72"] = 71,["73"] = 71,["74"] = 71,["75"] = 72,["76"] = 71,["77"] = 71,["78"] = 52,["79"] = 76,["80"] = 77,["81"] = 76,["82"] = 80,["83"] = 81,["84"] = 80,["85"] = 85,["86"] = 85,["87"] = 85,["88"] = 85,["89"] = 103,["90"] = 85,["91"] = 97,["92"] = 105,["93"] = 106,["94"] = 107,["95"] = 107,["96"] = 107,["97"] = 109,["98"] = 110,["99"] = 112,["100"] = 113,["101"] = 115,["102"] = 117,["103"] = 124,["104"] = 126,["105"] = 133,["106"] = 135,["107"] = 136,["108"] = 137,["109"] = 144,["110"] = 146,["112"] = 149,["113"] = 151,["114"] = 152,["115"] = 153,["116"] = 155,["117"] = 157,["118"] = 158,["119"] = 103,["120"] = 161,["121"] = 162,["122"] = 161,["123"] = 165,["124"] = 166,["125"] = 165,["126"] = 169,["127"] = 170,["128"] = 170,["129"] = 171,["130"] = 170,["131"] = 173,["132"] = 173,["133"] = 173,["134"] = 174,["135"] = 169,["136"] = 177,["137"] = 178,["138"] = 179,["139"] = 180,["140"] = 182,["141"] = 177,["142"] = 189,["143"] = 190,["144"] = 190,["145"] = 190,["146"] = 191,["148"] = 194,["149"] = 195,["150"] = 196,["151"] = 197,["153"] = 200,["154"] = 189,["155"] = 204,["156"] = 210,["157"] = 211,["158"] = 212,["159"] = 213,["161"] = 215,["162"] = 216,["164"] = 218,["165"] = 204,["166"] = 221,["167"] = 222,["168"] = 222,["169"] = 222,["170"] = 222,["171"] = 222,["172"] = 222,["173"] = 223,["174"] = 224,["175"] = 225,["177"] = 228,["178"] = 229,["179"] = 230,["181"] = 232,["182"] = 233,["183"] = 234,["184"] = 235,["187"] = 239,["188"] = 240,["189"] = 241,["190"] = 242,["192"] = 244,["195"] = 248,["196"] = 249,["197"] = 250,["198"] = 251,["201"] = 221,["202"] = 256,["203"] = 256,["204"] = 259,["205"] = 260,["206"] = 261,["207"] = 261,["208"] = 261,["209"] = 264,["210"] = 265,["211"] = 265,["212"] = 265,["213"] = 259,["214"] = 268,["215"] = 269,["216"] = 270,["217"] = 271,["218"] = 271,["219"] = 271,["220"] = 268,["221"] = 274,["222"] = 275,["223"] = 276,["224"] = 274,["225"] = 279,["226"] = 280,["227"] = 281,["228"] = 282,["229"] = 283,["230"] = 284,["231"] = 285,["232"] = 295,["233"] = 279,["234"] = 298,["235"] = 299,["236"] = 301,["237"] = 302,["238"] = 303,["239"] = 304,["241"] = 298,["242"] = 308,["243"] = 309,["244"] = 310,["246"] = 312,["248"] = 315,["249"] = 316,["250"] = 317,["252"] = 319,["253"] = 320,["255"] = 322,["256"] = 324,["257"] = 325,["258"] = 327,["259"] = 328,["260"] = 329,["261"] = 330,["262"] = 331,["263"] = 337,["264"] = 338,["268"] = 342,["269"] = 343,["270"] = 344,["271"] = 345,["272"] = 346,["274"] = 348,["277"] = 351,["279"] = 354,["280"] = 354,["281"] = 354,["282"] = 355,["284"] = 358,["285"] = 359,["286"] = 359,["287"] = 359,["288"] = 308,["289"] = 362,["290"] = 363,["291"] = 363,["292"] = 363,["293"] = 363,["294"] = 363,["295"] = 363,["296"] = 362,["297"] = 366,["298"] = 367,["299"] = 368,["300"] = 370,["301"] = 371,["302"] = 373,["303"] = 375,["304"] = 377,["305"] = 379,["306"] = 380,["307"] = 381,["308"] = 382,["309"] = 384,["310"] = 386,["311"] = 387,["312"] = 389,["313"] = 366,["314"] = 392,["315"] = 393,["316"] = 394,["317"] = 395,["318"] = 396,["319"] = 397,["320"] = 398,["321"] = 399,["322"] = 400,["323"] = 401,["325"] = 404,["326"] = 406,["327"] = 406,["328"] = 406,["329"] = 408,["330"] = 408,["331"] = 408,["332"] = 408,["333"] = 408,["334"] = 408,["335"] = 408,["336"] = 408,["337"] = 408,["338"] = 410,["339"] = 411,["340"] = 411,["341"] = 411,["342"] = 411,["343"] = 411,["344"] = 412,["345"] = 412,["346"] = 412,["347"] = 412,["348"] = 412,["349"] = 412,["350"] = 412,["351"] = 412,["352"] = 412,["353"] = 413,["354"] = 413,["355"] = 413,["356"] = 413,["357"] = 413,["358"] = 413,["359"] = 413,["361"] = 392,["362"] = 417,["363"] = 418,["364"] = 419,["366"] = 421,["367"] = 422,["369"] = 417});
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
local ____gui = require("gui")
local Button = ____gui.Button
local TextInput = ____gui.TextInput
local ____wrappeddrawable = require("wrappeddrawable")
local WrappedDrawable = ____wrappeddrawable.WrappedDrawable
local borderUserData = "border"
local rocketStartingLocationUserData = "rocketStartingLocationUserData"
local rocketLandingLocationUserdata = "rocketLandingLocationUserdata"
local refuelStationUserData = "refuelStationUserData"
local physicsTicks = 60
local timePerTick = 1 / physicsTicks
local SaveReplayGameState = __TS__Class()
SaveReplayGameState.name = "SaveReplayGameState"
__TS__ClassExtends(SaveReplayGameState, GameState)
function SaveReplayGameState.prototype.____constructor(self, replay)
    GameState.prototype.____constructor(self)
    self.replay = replay
    local text = love.graphics.newText(
        love.graphics.newFont(40),
        "Save Replay?"
    )
    local width = text:getWidth()
    self.wantReplayText = __TS__New(WrappedDrawable, text)
    self.wantReplayText.x = (love.graphics.getWidth() - width) / 2
    self.wantReplayText.y = 300
    local buttonWidth = 130
    local buttonHeight = 70
    local y = 450
    self.replayNameTextInput = __TS__New(TextInput, 200, 200, 600, 200, "Replay Name")
    self.yesButton = __TS__New(
        Button,
        400,
        y,
        buttonWidth,
        buttonHeight,
        "Yes",
        function()
            Application.popState()
        end
    )
    self.noButton = __TS__New(
        Button,
        600,
        y,
        buttonWidth,
        buttonHeight,
        "No",
        function()
            Application.popState()
        end
    )
end
function SaveReplayGameState.prototype.getObjects(self)
    return {self.wantReplayText, self.yesButton, self.noButton}
end
function SaveReplayGameState.prototype.getName(self)
    return "SaveReplayGameState"
end
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
    self.frames = {}
    self.clock = __TS__New(Clock)
    self:recordFrame()
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
Playing.prototype["end"] = function(self)
end
function Playing.prototype.win(self)
    self["end"](self)
    local metrics = {
        timeTaken = self.clock:getElapsed()
    }
    Application.popState()
    Application.pushState(
        __TS__New(Won, metrics)
    )
end
function Playing.prototype.lose(self)
    self["end"](self)
    Application.popState()
    Application.pushState(
        __TS__New(Lost)
    )
end
function Playing.prototype.notMoving(self, dx, dy)
    local EPSILON = 0.0001
    return (math.abs(dx) < EPSILON) and (math.abs(dy) < EPSILON)
end
function Playing.prototype.recordFrame(self)
    local rocketBody = self.rocket:getBody()
    local x, y = rocketBody:getPosition()
    local tilt = self.rocket:getTilt()
    local pedal = self.rocket:getPedal()
    local thrust = self.rocket:getThrust()
    local frame = {rocket = {x = x, y = y, pedal = pedal, thrust = thrust, tilt = tilt}}
    __TS__ArrayPush(self.frames, frame)
end
function Playing.prototype.update(self, dt)
    self.elapsed = self.elapsed + dt
    while self.elapsed >= timePerTick do
        self:physicsUpdate(timePerTick)
        self:recordFrame()
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
