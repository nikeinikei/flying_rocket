--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 7,["10"] = 7,["11"] = 8,["12"] = 8,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 11,["18"] = 11,["19"] = 12,["20"] = 12,["21"] = 13,["22"] = 13,["23"] = 15,["24"] = 15,["25"] = 16,["26"] = 16,["27"] = 17,["28"] = 17,["29"] = 17,["30"] = 18,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 21,["35"] = 22,["36"] = 23,["37"] = 24,["38"] = 26,["39"] = 27,["40"] = 44,["41"] = 44,["42"] = 44,["43"] = 52,["44"] = 44,["45"] = 54,["46"] = 56,["47"] = 56,["48"] = 56,["49"] = 56,["50"] = 57,["51"] = 58,["52"] = 59,["53"] = 60,["54"] = 62,["55"] = 63,["56"] = 64,["57"] = 66,["58"] = 68,["59"] = 68,["60"] = 68,["61"] = 68,["62"] = 68,["63"] = 68,["64"] = 68,["65"] = 68,["66"] = 69,["67"] = 71,["68"] = 68,["69"] = 68,["70"] = 73,["71"] = 73,["72"] = 73,["73"] = 73,["74"] = 73,["75"] = 73,["76"] = 73,["77"] = 73,["78"] = 74,["79"] = 73,["80"] = 73,["81"] = 52,["82"] = 78,["83"] = 79,["84"] = 78,["85"] = 82,["86"] = 83,["87"] = 82,["88"] = 87,["89"] = 87,["90"] = 87,["91"] = 87,["92"] = 105,["93"] = 87,["94"] = 99,["95"] = 107,["96"] = 108,["97"] = 109,["98"] = 109,["99"] = 109,["100"] = 111,["101"] = 112,["102"] = 114,["103"] = 115,["104"] = 117,["105"] = 119,["106"] = 126,["107"] = 128,["108"] = 135,["109"] = 137,["110"] = 138,["111"] = 139,["112"] = 146,["113"] = 148,["115"] = 151,["116"] = 153,["117"] = 154,["118"] = 155,["119"] = 157,["120"] = 159,["121"] = 160,["122"] = 105,["123"] = 163,["124"] = 164,["125"] = 163,["126"] = 167,["127"] = 168,["128"] = 167,["129"] = 171,["130"] = 172,["131"] = 172,["132"] = 173,["133"] = 172,["134"] = 175,["135"] = 175,["136"] = 175,["137"] = 176,["138"] = 171,["139"] = 179,["140"] = 180,["141"] = 181,["142"] = 182,["143"] = 184,["144"] = 179,["145"] = 191,["146"] = 192,["147"] = 192,["148"] = 192,["149"] = 193,["151"] = 196,["152"] = 197,["153"] = 198,["154"] = 199,["156"] = 202,["157"] = 191,["158"] = 206,["159"] = 212,["160"] = 213,["161"] = 214,["162"] = 215,["164"] = 217,["165"] = 218,["167"] = 220,["168"] = 206,["169"] = 223,["170"] = 224,["171"] = 224,["172"] = 224,["173"] = 224,["174"] = 224,["175"] = 224,["176"] = 225,["177"] = 226,["178"] = 227,["180"] = 230,["181"] = 231,["182"] = 232,["184"] = 234,["185"] = 235,["186"] = 236,["187"] = 237,["190"] = 241,["191"] = 242,["192"] = 243,["193"] = 244,["195"] = 246,["198"] = 250,["199"] = 251,["200"] = 252,["201"] = 253,["204"] = 223,["205"] = 258,["206"] = 258,["207"] = 261,["208"] = 262,["209"] = 263,["210"] = 263,["211"] = 263,["212"] = 266,["213"] = 267,["214"] = 267,["215"] = 267,["216"] = 261,["217"] = 270,["218"] = 271,["219"] = 272,["220"] = 273,["221"] = 273,["222"] = 273,["223"] = 270,["224"] = 276,["225"] = 277,["226"] = 278,["227"] = 276,["228"] = 281,["229"] = 282,["230"] = 283,["231"] = 284,["232"] = 285,["233"] = 286,["234"] = 287,["235"] = 297,["236"] = 281,["237"] = 300,["238"] = 301,["239"] = 303,["240"] = 304,["241"] = 305,["242"] = 306,["244"] = 300,["245"] = 310,["246"] = 311,["247"] = 312,["249"] = 314,["251"] = 317,["252"] = 318,["253"] = 319,["255"] = 321,["256"] = 322,["258"] = 324,["259"] = 326,["260"] = 327,["261"] = 329,["262"] = 330,["263"] = 331,["264"] = 332,["265"] = 333,["266"] = 339,["267"] = 340,["271"] = 344,["272"] = 345,["273"] = 346,["274"] = 347,["275"] = 348,["277"] = 350,["280"] = 353,["282"] = 356,["283"] = 356,["284"] = 356,["285"] = 357,["287"] = 360,["288"] = 361,["289"] = 361,["290"] = 361,["291"] = 310,["292"] = 364,["293"] = 365,["294"] = 365,["295"] = 365,["296"] = 365,["297"] = 365,["298"] = 365,["299"] = 364,["300"] = 368,["301"] = 369,["302"] = 370,["303"] = 372,["304"] = 373,["305"] = 375,["306"] = 377,["307"] = 379,["308"] = 381,["309"] = 382,["310"] = 383,["311"] = 384,["312"] = 386,["313"] = 388,["314"] = 389,["315"] = 391,["316"] = 368,["317"] = 394,["318"] = 395,["319"] = 396,["320"] = 397,["321"] = 398,["322"] = 399,["323"] = 400,["324"] = 401,["325"] = 402,["326"] = 403,["328"] = 406,["329"] = 408,["330"] = 408,["331"] = 408,["332"] = 410,["333"] = 410,["334"] = 410,["335"] = 410,["336"] = 410,["337"] = 410,["338"] = 410,["339"] = 410,["340"] = 410,["341"] = 412,["342"] = 413,["343"] = 413,["344"] = 413,["345"] = 413,["346"] = 413,["347"] = 414,["348"] = 414,["349"] = 414,["350"] = 414,["351"] = 414,["352"] = 414,["353"] = 414,["354"] = 414,["355"] = 414,["356"] = 415,["357"] = 415,["358"] = 415,["359"] = 415,["360"] = 415,["361"] = 415,["362"] = 415,["364"] = 394,["365"] = 419,["366"] = 420,["367"] = 421,["369"] = 423,["370"] = 424,["372"] = 419});
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
local ____replays = require("fs.replays")
local Replays = ____replays.Replays
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
            local replays = Replays.getReplays()
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
