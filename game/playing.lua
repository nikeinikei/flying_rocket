--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 9,["15"] = 9,["16"] = 10,["17"] = 10,["18"] = 11,["19"] = 11,["20"] = 12,["21"] = 12,["22"] = 13,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 15,["27"] = 15,["28"] = 17,["29"] = 17,["30"] = 18,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 21,["35"] = 22,["36"] = 23,["37"] = 24,["38"] = 26,["39"] = 27,["40"] = 44,["41"] = 44,["42"] = 44,["43"] = 52,["44"] = 44,["45"] = 54,["46"] = 56,["47"] = 56,["48"] = 56,["49"] = 56,["50"] = 57,["51"] = 58,["52"] = 59,["53"] = 60,["54"] = 62,["55"] = 63,["56"] = 64,["57"] = 66,["58"] = 68,["59"] = 68,["60"] = 68,["61"] = 68,["62"] = 68,["63"] = 68,["64"] = 68,["65"] = 68,["66"] = 69,["67"] = 70,["68"] = 71,["70"] = 73,["71"] = 75,["73"] = 68,["74"] = 68,["75"] = 78,["76"] = 78,["77"] = 78,["78"] = 78,["79"] = 78,["80"] = 78,["81"] = 78,["82"] = 78,["83"] = 79,["84"] = 78,["85"] = 78,["86"] = 52,["87"] = 83,["88"] = 84,["89"] = 83,["90"] = 87,["91"] = 88,["92"] = 87,["93"] = 92,["94"] = 93,["95"] = 93,["96"] = 94,["97"] = 94,["98"] = 95,["99"] = 95,["100"] = 102,["101"] = 102,["102"] = 102,["103"] = 102,["104"] = 121,["105"] = 102,["106"] = 115,["107"] = 118,["108"] = 123,["109"] = 124,["110"] = 125,["111"] = 125,["112"] = 125,["113"] = 127,["114"] = 128,["115"] = 130,["116"] = 131,["117"] = 133,["118"] = 135,["119"] = 142,["120"] = 144,["121"] = 151,["122"] = 153,["123"] = 154,["124"] = 155,["125"] = 162,["126"] = 164,["128"] = 167,["129"] = 169,["130"] = 170,["131"] = 171,["132"] = 173,["133"] = 175,["134"] = 177,["135"] = 179,["136"] = 121,["137"] = 182,["138"] = 183,["139"] = 182,["140"] = 186,["141"] = 187,["142"] = 186,["143"] = 190,["144"] = 191,["145"] = 190,["146"] = 194,["147"] = 195,["148"] = 194,["149"] = 198,["150"] = 199,["151"] = 198,["152"] = 202,["153"] = 203,["154"] = 202,["155"] = 206,["156"] = 207,["157"] = 206,["158"] = 210,["159"] = 211,["160"] = 211,["161"] = 212,["162"] = 211,["163"] = 214,["164"] = 214,["165"] = 214,["166"] = 215,["167"] = 210,["168"] = 218,["169"] = 219,["170"] = 220,["171"] = 221,["172"] = 223,["173"] = 218,["174"] = 230,["175"] = 231,["176"] = 231,["177"] = 231,["178"] = 232,["180"] = 235,["181"] = 236,["182"] = 237,["183"] = 238,["185"] = 241,["186"] = 230,["187"] = 245,["188"] = 251,["189"] = 252,["190"] = 253,["191"] = 254,["193"] = 256,["194"] = 257,["196"] = 259,["197"] = 245,["198"] = 262,["199"] = 263,["200"] = 263,["201"] = 263,["202"] = 263,["203"] = 263,["204"] = 263,["205"] = 264,["206"] = 265,["207"] = 266,["209"] = 269,["210"] = 270,["211"] = 271,["213"] = 273,["214"] = 274,["215"] = 275,["216"] = 276,["219"] = 280,["220"] = 281,["221"] = 282,["222"] = 283,["224"] = 285,["227"] = 289,["228"] = 290,["229"] = 291,["230"] = 292,["233"] = 262,["234"] = 297,["235"] = 298,["236"] = 297,["237"] = 304,["238"] = 304,["239"] = 305,["240"] = 306,["241"] = 307,["243"] = 304,["244"] = 311,["245"] = 312,["246"] = 312,["247"] = 312,["248"] = 315,["249"] = 315,["250"] = 315,["251"] = 318,["252"] = 318,["253"] = 318,["254"] = 315,["255"] = 315,["256"] = 311,["257"] = 321,["258"] = 322,["259"] = 322,["260"] = 322,["261"] = 325,["262"] = 325,["263"] = 325,["264"] = 322,["265"] = 322,["266"] = 321,["267"] = 328,["268"] = 329,["269"] = 330,["270"] = 328,["271"] = 333,["272"] = 334,["273"] = 335,["274"] = 336,["275"] = 337,["276"] = 338,["277"] = 339,["278"] = 349,["279"] = 333,["280"] = 352,["281"] = 353,["282"] = 354,["283"] = 355,["284"] = 356,["285"] = 357,["286"] = 358,["287"] = 360,["289"] = 363,["290"] = 364,["291"] = 366,["292"] = 367,["295"] = 370,["296"] = 372,["297"] = 373,["298"] = 374,["299"] = 375,["302"] = 379,["303"] = 380,["304"] = 380,["305"] = 380,["306"] = 352,["307"] = 383,["308"] = 384,["309"] = 385,["310"] = 387,["311"] = 388,["312"] = 389,["313"] = 390,["314"] = 391,["315"] = 397,["316"] = 398,["320"] = 402,["321"] = 403,["322"] = 404,["323"] = 405,["324"] = 406,["326"] = 408,["329"] = 411,["331"] = 414,["332"] = 414,["333"] = 414,["334"] = 415,["336"] = 383,["337"] = 419,["338"] = 420,["339"] = 420,["340"] = 420,["341"] = 420,["342"] = 420,["343"] = 420,["344"] = 419,["345"] = 423,["346"] = 424,["347"] = 425,["348"] = 427,["349"] = 428,["350"] = 430,["351"] = 432,["352"] = 434,["353"] = 436,["354"] = 437,["355"] = 438,["356"] = 439,["357"] = 441,["358"] = 443,["359"] = 444,["360"] = 446,["361"] = 423,["362"] = 449,["363"] = 450,["364"] = 451,["365"] = 452,["366"] = 453,["367"] = 454,["368"] = 455,["369"] = 456,["370"] = 457,["371"] = 458,["373"] = 461,["374"] = 463,["375"] = 463,["376"] = 463,["377"] = 464,["378"] = 465,["379"] = 466,["380"] = 466,["381"] = 466,["382"] = 466,["383"] = 466,["384"] = 466,["385"] = 466,["386"] = 472,["388"] = 475,["389"] = 475,["390"] = 475,["391"] = 475,["392"] = 475,["393"] = 475,["394"] = 475,["395"] = 475,["396"] = 475,["397"] = 477,["398"] = 478,["399"] = 478,["400"] = 478,["401"] = 478,["402"] = 478,["403"] = 479,["404"] = 479,["405"] = 479,["406"] = 479,["407"] = 479,["408"] = 479,["409"] = 479,["410"] = 479,["411"] = 479,["412"] = 480,["413"] = 480,["414"] = 480,["415"] = 480,["416"] = 480,["417"] = 480,["418"] = 480,["420"] = 449,["421"] = 484,["422"] = 485,["423"] = 486,["424"] = 487,["426"] = 489,["427"] = 490,["429"] = 484,["430"] = 103,["431"] = 498,["432"] = 498,["433"] = 498,["434"] = 498,["435"] = 500,["436"] = 501,["437"] = 503,["438"] = 504,["439"] = 505,["441"] = 507,["442"] = 508,["444"] = 511,["445"] = 513,["446"] = 498,["447"] = 500});
local ____exports = {}
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
function AbstractPlaying.prototype.draw(self)
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
        Application.popState()
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
