--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 8,["16"] = 10,["17"] = 10,["18"] = 11,["19"] = 11,["20"] = 12,["21"] = 12,["22"] = 13,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 15,["27"] = 15,["28"] = 16,["29"] = 16,["30"] = 18,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 20,["35"] = 20,["36"] = 22,["37"] = 23,["38"] = 24,["39"] = 25,["40"] = 26,["41"] = 28,["42"] = 29,["43"] = 46,["44"] = 46,["45"] = 46,["46"] = 54,["47"] = 46,["48"] = 56,["49"] = 58,["50"] = 58,["51"] = 58,["52"] = 58,["53"] = 59,["54"] = 60,["55"] = 61,["56"] = 62,["57"] = 64,["58"] = 65,["59"] = 66,["60"] = 68,["61"] = 70,["62"] = 70,["63"] = 70,["64"] = 70,["65"] = 70,["66"] = 70,["67"] = 70,["68"] = 70,["69"] = 71,["70"] = 72,["71"] = 73,["73"] = 75,["74"] = 77,["76"] = 70,["77"] = 70,["78"] = 80,["79"] = 80,["80"] = 80,["81"] = 80,["82"] = 80,["83"] = 80,["84"] = 80,["85"] = 80,["86"] = 81,["87"] = 80,["88"] = 80,["89"] = 54,["90"] = 85,["91"] = 86,["92"] = 85,["93"] = 89,["94"] = 90,["95"] = 89,["96"] = 94,["97"] = 95,["98"] = 95,["99"] = 96,["100"] = 96,["101"] = 97,["102"] = 97,["103"] = 104,["104"] = 104,["105"] = 104,["106"] = 104,["107"] = 125,["108"] = 104,["109"] = 117,["110"] = 120,["111"] = 127,["112"] = 128,["113"] = 129,["114"] = 129,["115"] = 129,["116"] = 131,["117"] = 132,["118"] = 134,["119"] = 135,["120"] = 137,["121"] = 139,["122"] = 146,["123"] = 148,["124"] = 155,["125"] = 157,["126"] = 158,["127"] = 159,["128"] = 166,["129"] = 168,["131"] = 171,["132"] = 173,["133"] = 174,["134"] = 175,["135"] = 176,["136"] = 177,["137"] = 178,["138"] = 179,["139"] = 180,["140"] = 182,["141"] = 183,["143"] = 185,["144"] = 186,["145"] = 188,["146"] = 190,["147"] = 192,["148"] = 194,["149"] = 125,["150"] = 197,["151"] = 198,["152"] = 197,["153"] = 201,["154"] = 202,["155"] = 201,["156"] = 205,["157"] = 206,["158"] = 205,["159"] = 209,["160"] = 210,["161"] = 209,["162"] = 213,["163"] = 214,["164"] = 213,["165"] = 217,["166"] = 218,["167"] = 217,["168"] = 221,["169"] = 222,["170"] = 221,["171"] = 225,["172"] = 226,["173"] = 226,["174"] = 227,["175"] = 226,["176"] = 229,["177"] = 229,["178"] = 229,["179"] = 230,["180"] = 225,["181"] = 233,["182"] = 234,["183"] = 235,["184"] = 236,["185"] = 238,["186"] = 233,["187"] = 245,["188"] = 246,["189"] = 246,["190"] = 246,["191"] = 247,["193"] = 250,["194"] = 251,["195"] = 252,["196"] = 253,["198"] = 256,["199"] = 245,["200"] = 260,["201"] = 266,["202"] = 267,["203"] = 268,["204"] = 269,["206"] = 271,["207"] = 272,["209"] = 274,["210"] = 260,["211"] = 277,["212"] = 278,["213"] = 278,["214"] = 278,["215"] = 278,["216"] = 278,["217"] = 278,["218"] = 278,["219"] = 279,["220"] = 280,["221"] = 281,["223"] = 284,["224"] = 285,["225"] = 286,["227"] = 288,["228"] = 289,["229"] = 290,["230"] = 291,["233"] = 295,["234"] = 296,["235"] = 297,["236"] = 298,["238"] = 300,["241"] = 304,["242"] = 305,["243"] = 306,["244"] = 307,["247"] = 311,["248"] = 312,["249"] = 313,["251"] = 277,["252"] = 317,["253"] = 318,["254"] = 317,["255"] = 324,["256"] = 324,["257"] = 325,["258"] = 326,["259"] = 327,["261"] = 324,["262"] = 331,["263"] = 332,["264"] = 332,["265"] = 332,["266"] = 335,["267"] = 335,["268"] = 335,["269"] = 335,["270"] = 335,["271"] = 335,["272"] = 335,["273"] = 335,["274"] = 331,["275"] = 338,["276"] = 339,["277"] = 339,["278"] = 339,["279"] = 339,["280"] = 339,["281"] = 339,["282"] = 339,["283"] = 339,["284"] = 338,["285"] = 342,["286"] = 343,["287"] = 344,["288"] = 342,["289"] = 347,["290"] = 348,["291"] = 349,["292"] = 350,["293"] = 351,["294"] = 352,["295"] = 353,["296"] = 363,["297"] = 347,["298"] = 366,["299"] = 367,["300"] = 368,["301"] = 369,["302"] = 370,["303"] = 371,["304"] = 372,["305"] = 374,["307"] = 377,["308"] = 378,["309"] = 380,["310"] = 381,["313"] = 384,["314"] = 386,["315"] = 387,["316"] = 388,["317"] = 389,["320"] = 393,["321"] = 394,["322"] = 394,["323"] = 394,["324"] = 366,["325"] = 397,["326"] = 398,["327"] = 399,["328"] = 401,["329"] = 402,["330"] = 403,["331"] = 404,["332"] = 405,["333"] = 411,["334"] = 412,["338"] = 416,["339"] = 417,["340"] = 418,["341"] = 419,["342"] = 420,["344"] = 422,["347"] = 425,["349"] = 428,["350"] = 428,["351"] = 428,["352"] = 429,["354"] = 397,["355"] = 433,["356"] = 434,["357"] = 434,["358"] = 434,["359"] = 434,["360"] = 434,["361"] = 434,["362"] = 433,["363"] = 437,["364"] = 438,["365"] = 439,["366"] = 441,["367"] = 442,["368"] = 444,["369"] = 446,["370"] = 448,["371"] = 450,["372"] = 451,["373"] = 452,["374"] = 453,["375"] = 455,["376"] = 457,["377"] = 458,["378"] = 460,["379"] = 437,["380"] = 463,["381"] = 464,["382"] = 464,["383"] = 464,["384"] = 464,["385"] = 464,["386"] = 464,["387"] = 465,["388"] = 465,["389"] = 465,["390"] = 466,["392"] = 463,["393"] = 470,["394"] = 471,["395"] = 472,["396"] = 473,["397"] = 474,["398"] = 475,["399"] = 476,["400"] = 477,["401"] = 478,["402"] = 479,["403"] = 480,["404"] = 481,["406"] = 484,["407"] = 486,["408"] = 486,["409"] = 486,["410"] = 487,["411"] = 488,["412"] = 489,["413"] = 489,["414"] = 489,["415"] = 489,["416"] = 489,["417"] = 489,["418"] = 489,["419"] = 496,["421"] = 499,["422"] = 499,["423"] = 499,["424"] = 499,["425"] = 499,["426"] = 499,["427"] = 499,["428"] = 499,["429"] = 499,["430"] = 501,["431"] = 502,["432"] = 502,["433"] = 502,["434"] = 502,["435"] = 502,["436"] = 503,["437"] = 503,["438"] = 503,["439"] = 503,["440"] = 503,["441"] = 503,["442"] = 503,["443"] = 503,["444"] = 503,["445"] = 504,["446"] = 504,["447"] = 504,["448"] = 504,["449"] = 504,["450"] = 504,["451"] = 504,["453"] = 470,["454"] = 508,["455"] = 509,["456"] = 510,["458"] = 512,["459"] = 513,["461"] = 508,["462"] = 105,["463"] = 521,["464"] = 521,["465"] = 521,["466"] = 521,["467"] = 522,["468"] = 523,["469"] = 525,["470"] = 526,["471"] = 527,["473"] = 529,["474"] = 530,["476"] = 533,["477"] = 535,["478"] = 521,["479"] = 522});
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
