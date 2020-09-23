--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 8,["16"] = 10,["17"] = 10,["18"] = 11,["19"] = 11,["20"] = 12,["21"] = 12,["22"] = 13,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 15,["27"] = 15,["28"] = 16,["29"] = 16,["30"] = 18,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 20,["35"] = 20,["36"] = 22,["37"] = 23,["38"] = 24,["39"] = 25,["40"] = 26,["41"] = 28,["42"] = 29,["43"] = 46,["44"] = 46,["45"] = 46,["46"] = 54,["47"] = 46,["48"] = 56,["49"] = 58,["50"] = 58,["51"] = 58,["52"] = 58,["53"] = 59,["54"] = 60,["55"] = 61,["56"] = 62,["57"] = 64,["58"] = 65,["59"] = 66,["60"] = 68,["61"] = 70,["62"] = 70,["63"] = 70,["64"] = 70,["65"] = 70,["66"] = 70,["67"] = 70,["68"] = 70,["69"] = 71,["70"] = 72,["71"] = 73,["73"] = 75,["74"] = 77,["76"] = 70,["77"] = 70,["78"] = 80,["79"] = 80,["80"] = 80,["81"] = 80,["82"] = 80,["83"] = 80,["84"] = 80,["85"] = 80,["86"] = 81,["87"] = 80,["88"] = 80,["89"] = 54,["90"] = 85,["91"] = 86,["92"] = 85,["93"] = 89,["94"] = 90,["95"] = 89,["96"] = 94,["97"] = 95,["98"] = 95,["99"] = 96,["100"] = 96,["101"] = 97,["102"] = 97,["103"] = 104,["104"] = 104,["105"] = 104,["106"] = 104,["107"] = 124,["108"] = 104,["109"] = 118,["110"] = 121,["111"] = 126,["112"] = 127,["113"] = 128,["114"] = 128,["115"] = 128,["116"] = 130,["117"] = 131,["118"] = 133,["119"] = 134,["120"] = 136,["121"] = 138,["122"] = 145,["123"] = 147,["124"] = 154,["125"] = 156,["126"] = 157,["127"] = 158,["128"] = 165,["129"] = 167,["131"] = 170,["132"] = 172,["133"] = 173,["134"] = 174,["135"] = 175,["136"] = 176,["137"] = 177,["138"] = 178,["139"] = 179,["140"] = 181,["141"] = 182,["143"] = 184,["144"] = 185,["145"] = 187,["146"] = 189,["147"] = 191,["148"] = 193,["149"] = 124,["150"] = 196,["151"] = 197,["152"] = 196,["153"] = 200,["154"] = 201,["155"] = 200,["156"] = 204,["157"] = 205,["158"] = 204,["159"] = 208,["160"] = 209,["161"] = 208,["162"] = 212,["163"] = 213,["164"] = 212,["165"] = 216,["166"] = 217,["167"] = 216,["168"] = 220,["169"] = 221,["170"] = 220,["171"] = 224,["172"] = 225,["173"] = 225,["174"] = 226,["175"] = 225,["176"] = 228,["177"] = 228,["178"] = 228,["179"] = 229,["180"] = 224,["181"] = 232,["182"] = 233,["183"] = 234,["184"] = 235,["185"] = 237,["186"] = 232,["187"] = 244,["188"] = 245,["189"] = 245,["190"] = 245,["191"] = 246,["193"] = 249,["194"] = 250,["195"] = 251,["196"] = 252,["198"] = 255,["199"] = 244,["200"] = 259,["201"] = 265,["202"] = 266,["203"] = 267,["204"] = 268,["206"] = 270,["207"] = 271,["209"] = 273,["210"] = 259,["211"] = 276,["212"] = 277,["213"] = 277,["214"] = 277,["215"] = 277,["216"] = 277,["217"] = 277,["218"] = 277,["219"] = 278,["220"] = 279,["221"] = 280,["223"] = 283,["224"] = 284,["225"] = 285,["227"] = 287,["228"] = 288,["229"] = 289,["230"] = 290,["233"] = 294,["234"] = 295,["235"] = 296,["236"] = 297,["238"] = 299,["241"] = 303,["242"] = 304,["243"] = 305,["244"] = 306,["247"] = 310,["248"] = 311,["249"] = 312,["251"] = 276,["252"] = 316,["253"] = 317,["254"] = 316,["255"] = 323,["256"] = 323,["257"] = 324,["258"] = 325,["259"] = 326,["261"] = 323,["262"] = 330,["263"] = 331,["264"] = 331,["265"] = 331,["266"] = 334,["267"] = 334,["268"] = 334,["269"] = 337,["270"] = 337,["271"] = 337,["272"] = 334,["273"] = 334,["274"] = 330,["275"] = 340,["276"] = 341,["277"] = 341,["278"] = 341,["279"] = 344,["280"] = 344,["281"] = 344,["282"] = 341,["283"] = 341,["284"] = 340,["285"] = 347,["286"] = 348,["287"] = 349,["288"] = 347,["289"] = 352,["290"] = 353,["291"] = 354,["292"] = 355,["293"] = 356,["294"] = 357,["295"] = 358,["296"] = 368,["297"] = 352,["298"] = 371,["299"] = 372,["300"] = 373,["301"] = 374,["302"] = 375,["303"] = 376,["304"] = 377,["305"] = 379,["307"] = 382,["308"] = 383,["309"] = 385,["310"] = 386,["313"] = 389,["314"] = 391,["315"] = 392,["316"] = 393,["317"] = 394,["320"] = 398,["321"] = 399,["322"] = 399,["323"] = 399,["324"] = 371,["325"] = 402,["326"] = 403,["327"] = 404,["328"] = 406,["329"] = 407,["330"] = 408,["331"] = 409,["332"] = 410,["333"] = 416,["334"] = 417,["338"] = 421,["339"] = 422,["340"] = 423,["341"] = 424,["342"] = 425,["344"] = 427,["347"] = 430,["349"] = 433,["350"] = 433,["351"] = 433,["352"] = 434,["354"] = 402,["355"] = 438,["356"] = 439,["357"] = 439,["358"] = 439,["359"] = 439,["360"] = 439,["361"] = 439,["362"] = 438,["363"] = 442,["364"] = 443,["365"] = 444,["366"] = 446,["367"] = 447,["368"] = 449,["369"] = 451,["370"] = 453,["371"] = 455,["372"] = 456,["373"] = 457,["374"] = 458,["375"] = 460,["376"] = 462,["377"] = 463,["378"] = 465,["379"] = 442,["380"] = 468,["381"] = 469,["382"] = 469,["383"] = 469,["384"] = 469,["385"] = 469,["386"] = 469,["387"] = 470,["388"] = 470,["389"] = 470,["390"] = 471,["392"] = 468,["393"] = 475,["394"] = 476,["395"] = 477,["396"] = 478,["397"] = 479,["398"] = 480,["399"] = 481,["400"] = 482,["401"] = 483,["402"] = 484,["403"] = 485,["404"] = 486,["406"] = 489,["407"] = 491,["408"] = 491,["409"] = 491,["410"] = 492,["411"] = 493,["412"] = 494,["413"] = 494,["414"] = 494,["415"] = 494,["416"] = 494,["417"] = 494,["418"] = 494,["419"] = 500,["421"] = 503,["422"] = 503,["423"] = 503,["424"] = 503,["425"] = 503,["426"] = 503,["427"] = 503,["428"] = 503,["429"] = 503,["430"] = 505,["431"] = 506,["432"] = 506,["433"] = 506,["434"] = 506,["435"] = 506,["436"] = 507,["437"] = 507,["438"] = 507,["439"] = 507,["440"] = 507,["441"] = 507,["442"] = 507,["443"] = 507,["444"] = 507,["445"] = 508,["446"] = 508,["447"] = 508,["448"] = 508,["449"] = 508,["450"] = 508,["451"] = 508,["453"] = 475,["454"] = 512,["455"] = 513,["456"] = 514,["458"] = 516,["459"] = 517,["461"] = 512,["462"] = 105,["463"] = 525,["464"] = 525,["465"] = 525,["466"] = 525,["467"] = 527,["468"] = 528,["469"] = 530,["470"] = 531,["471"] = 532,["473"] = 534,["474"] = 535,["476"] = 538,["477"] = 540,["478"] = 525,["479"] = 527});
local ____exports = {}
local ____Color4 = require("Color4")
local Color = ____Color4.Color
local ____controls = require("controls")
local Controls = ____controls.Controls
local ____replays = require("fs.replays")
local Replays = ____replays.Replays
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local ____gui = require("gui")
local Button = ____gui.Button
local TextInput = ____gui.TextInput
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
local ____wrappeddrawable = require("wrappeddrawable")
local WrappedDrawable = ____wrappeddrawable.WrappedDrawable
local borderUserData = "border"
local rocketStartingLocationUserData = "rocketStartingLocationUserData"
local rocketLandingLocationUserdata = "rocketLandingLocationUserdata"
local refuelStationUserData = "refuelStationUserData"
local groundTerrainUserdata = "groundTerrainUserData"
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
            local name = self.replayNameTextInput:getText()
            if #name == 0 then
                love.window.showMessageBox("no name provided", "A name is needed to save a replay", "warning")
            else
                Replays.addReplay(self.replay, name)
                Application.popState()
            end
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
    return {self.wantReplayText, self.replayNameTextInput, self.yesButton, self.noButton}
end
function SaveReplayGameState.prototype.getName(self)
    return "SaveReplayGameState"
end
____exports.GameEndReason = {}
____exports.GameEndReason.Won = 0
____exports.GameEndReason[____exports.GameEndReason.Won] = "Won"
____exports.GameEndReason.Lost = 1
____exports.GameEndReason[____exports.GameEndReason.Lost] = "Lost"
____exports.GameEndReason.Quit = 2
____exports.GameEndReason[____exports.GameEndReason.Quit] = "Quit"
____exports.AbstractPlaying = __TS__Class()
local AbstractPlaying = ____exports.AbstractPlaying
AbstractPlaying.name = "AbstractPlaying"
__TS__ClassExtends(AbstractPlaying, GameState)
function AbstractPlaying.prototype.____constructor(self, level)
    GameState.prototype.____constructor(self)
    self.refueling = false
    self.resetNextFrame = false
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
    self.groundTerrains = {}
    for ____, groundTerrain in ipairs(self.level.groundTerrain) do
        local points = groundTerrain.points
        local body = love.physics.newBody(self.world, 0, 0, "static")
        local shape = love.physics.newChainShape(true, groundTerrain.points)
        local fixture = love.physics.newFixture(body, shape)
        fixture:setUserData(groundTerrainUserdata)
        local color = __TS__New(Color, groundTerrain.color.r, groundTerrain.color.g, groundTerrain.color.b)
        __TS__ArrayPush(self.groundTerrains, {points, body, shape, fixture, color})
    end
    self.camera = __TS__New(PlayingCamera, self.rocket)
    self.stars = __TS__New(Stars)
    self.frames = {}
    self:recordReplayFrame()
    self.countdownTime = ____exports.AbstractPlaying.countDownTime
    self.clock = __TS__New(Clock)
end
function AbstractPlaying.prototype.reset(self)
    self.resetNextFrame = true
end
function AbstractPlaying.prototype.setPedal(self, pedal)
    self.rocket:setPedal(pedal)
end
function AbstractPlaying.prototype.setRotation(self, rotation)
    self.rocket:setRotation(rotation)
end
function AbstractPlaying.prototype.getPedal(self)
    return self.rocket:getPedal()
end
function AbstractPlaying.prototype.getRotation(self)
    return self.rocket:getRotation()
end
function AbstractPlaying.prototype.getName(self)
    return "Playing"
end
function AbstractPlaying.prototype.serialize(self)
    return {name = "Playing", level = self.level.name}
end
function AbstractPlaying.prototype.pause(self)
    local onUnpaused
    onUnpaused = function()
        self.clock:resume()
    end
    Application.pushState(
        __TS__New(Paused, self, onUnpaused)
    )
    self.clock:pause()
end
function AbstractPlaying.prototype.newStaticRectangle(self, world, x, y, w, h)
    local body = love.physics.newBody(world, x, y, "static")
    local shape = love.physics.newRectangleShape(w, h)
    local fixture = love.physics.newFixture(body, shape)
    return {body = body, shape = shape, fixture = fixture}
end
function AbstractPlaying.prototype.isSafeLanding(self, rocket)
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
function AbstractPlaying.prototype.matchFixtures(self, fixtureA, fixtureB, userDataA, userDataB)
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
function AbstractPlaying.prototype.beginContact(self, a, b, contact)
    local rocket
    local border
    local terrain
    local rocketStartingLocation
    local rocketLandingLocation
    local refuelStation
    local groundTerrain
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
    rocket, groundTerrain = self:matchFixtures(a, b, Rocket.userData, groundTerrainUserdata)
    if rocket then
        self:lose()
    end
end
function AbstractPlaying.prototype.constructReplay(self)
    return {frame = self.frames, level = self.level}
end
function AbstractPlaying.prototype.endGame(self, _gameEndReason, ...)
    local nextStates = {...}
    Application.popState()
    for ____, nextState in ipairs(nextStates) do
        Application.pushState(nextState)
    end
end
function AbstractPlaying.prototype.win(self)
    local metrics = {
        timeTaken = self.clock:getElapsed()
    }
    self:endGame(
        ____exports.GameEndReason.Won,
        __TS__New(Won, metrics),
        __TS__New(
            SaveReplayGameState,
            self:constructReplay()
        )
    )
end
function AbstractPlaying.prototype.lose(self)
    self:endGame(
        ____exports.GameEndReason.Lost,
        __TS__New(Lost),
        __TS__New(
            SaveReplayGameState,
            self:constructReplay()
        )
    )
end
function AbstractPlaying.prototype.notMoving(self, dx, dy)
    local EPSILON = 0.0001
    return (math.abs(dx) < EPSILON) and (math.abs(dy) < EPSILON)
end
function AbstractPlaying.prototype.recordReplayFrame(self)
    local rocketBody = self.rocket:getBody()
    local x, y = rocketBody:getPosition()
    local tilt = self.rocket:getTilt()
    local pedal = self.rocket:getPedal()
    local thrust = self.rocket:getThrust()
    local frame = {rocket = {x = x, y = y, pedal = pedal, thrust = thrust, tilt = tilt}}
    __TS__ArrayPush(self.frames, frame)
end
function AbstractPlaying.prototype.update(self, dt)
    if self.resetNextFrame then
        self.clock:restart()
        __TS__ArraySetLength(self.frames, 0)
        self.rocket:reset()
        self.elapsed = 0
        self.countdownTime = ____exports.AbstractPlaying.countDownTime
        self.resetNextFrame = false
    end
    if self.countdownTime ~= nil then
        self.countdownTime = self.countdownTime - dt
        if self.countdownTime <= 0 then
            self.countdownTime = nil
        end
    else
        self.elapsed = self.elapsed + dt
        while self.elapsed >= timePerTick do
            self:physicsUpdate(timePerTick)
            self:recordReplayFrame()
            self.elapsed = self.elapsed - timePerTick
        end
    end
    self.camera:update(dt)
    self.stars:setViewport(
        self.camera:getViewport()
    )
end
function AbstractPlaying.prototype.physicsUpdate(self, dt)
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
end
function AbstractPlaying.prototype.drawObject(self, o)
    love.graphics.polygon(
        "fill",
        o.body:getWorldPoints(
            o.shape:getPoints()
        )
    )
end
function AbstractPlaying.prototype.drawFuelIndicator(self, fuel)
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
function AbstractPlaying.prototype.drawGroundTerrain(self)
    for ____, ____value in ipairs(self.groundTerrains) do
        local points = ____value[1]
        local _body = ____value[2]
        local _shape = ____value[3]
        local _fixture = ____value[4]
        local color = ____value[5]
        love.graphics.setColor(
            color:unpacked()
        )
        love.graphics.polygon("fill", points)
    end
end
function AbstractPlaying.prototype.draw(self)
    self.camera:apply()
    self.stars:draw()
    love.graphics.setColor(1, 1, 1, 1)
    self.rocket:draw()
    self.terrain:draw()
    self:drawGroundTerrain()
    love.graphics.setColor(1, 1, 1, 1)
    self:drawObject(self.rocketStartingLocationObject)
    self:drawObject(self.rocketLandingLocationObject)
    for ____, station in ipairs(self.refuelStations) do
        self:drawObject(station)
    end
    love.graphics.origin()
    self:drawFuelIndicator(
        self.rocket:getFuel()
    )
    if self.countdownTime then
        love.graphics.setColor(1, 0, 0, 1)
        love.graphics.printf(
            tostring(self.countdownTime),
            love.graphics.getWidth() / 2,
            love.graphics.getHeight() * 0.4,
            300,
            "center"
        )
        love.graphics.setColor(1, 1, 1, 1)
    end
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
function AbstractPlaying.prototype.keypressed(self, key)
    if key == "escape" then
        self:endGame(____exports.GameEndReason.Quit)
    end
    if key == "p" then
        self:pause()
    end
end
AbstractPlaying.countDownTime = 3
____exports.Playing = __TS__Class()
local Playing = ____exports.Playing
Playing.name = "Playing"
__TS__ClassExtends(Playing, ____exports.AbstractPlaying)
function Playing.prototype.update(self, dt)
    local pedal = (love.keyboard.isDown(Controls.game.applyThrust) and 1) or 0
    local rotation = 0
    if love.keyboard.isDown(Controls.game.rotateLeft) then
        rotation = -1
    end
    if love.keyboard.isDown(Controls.game.rotateRight) then
        rotation = rotation + 1
    end
    self:setPedal(pedal)
    self:setRotation(rotation)
    Playing.____super.prototype.update(self, dt)
end
return ____exports
