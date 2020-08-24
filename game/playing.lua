--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 9,["15"] = 9,["16"] = 10,["17"] = 10,["18"] = 11,["19"] = 11,["20"] = 12,["21"] = 12,["22"] = 13,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 15,["27"] = 15,["28"] = 17,["29"] = 17,["30"] = 18,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 21,["35"] = 22,["36"] = 23,["37"] = 24,["38"] = 26,["39"] = 27,["40"] = 57,["41"] = 57,["42"] = 57,["43"] = 65,["44"] = 57,["45"] = 67,["46"] = 69,["47"] = 69,["48"] = 69,["49"] = 69,["50"] = 70,["51"] = 71,["52"] = 72,["53"] = 73,["54"] = 75,["55"] = 76,["56"] = 77,["57"] = 79,["58"] = 81,["59"] = 81,["60"] = 81,["61"] = 81,["62"] = 81,["63"] = 81,["64"] = 81,["65"] = 81,["66"] = 82,["67"] = 83,["68"] = 84,["70"] = 86,["71"] = 88,["73"] = 81,["74"] = 81,["75"] = 91,["76"] = 91,["77"] = 91,["78"] = 91,["79"] = 91,["80"] = 91,["81"] = 91,["82"] = 91,["83"] = 92,["84"] = 91,["85"] = 91,["86"] = 65,["87"] = 96,["88"] = 97,["89"] = 96,["90"] = 100,["91"] = 101,["92"] = 100,["93"] = 105,["94"] = 105,["95"] = 105,["96"] = 105,["97"] = 125,["98"] = 105,["99"] = 118,["100"] = 127,["101"] = 128,["103"] = 130,["105"] = 132,["106"] = 133,["108"] = 135,["109"] = 136,["110"] = 137,["111"] = 138,["112"] = 138,["113"] = 138,["114"] = 140,["115"] = 141,["116"] = 143,["117"] = 144,["118"] = 146,["119"] = 148,["120"] = 155,["121"] = 157,["122"] = 164,["123"] = 166,["124"] = 167,["125"] = 168,["126"] = 175,["127"] = 177,["129"] = 180,["130"] = 182,["131"] = 183,["132"] = 184,["133"] = 186,["134"] = 188,["135"] = 189,["136"] = 190,["137"] = 191,["138"] = 194,["139"] = 125,["140"] = 197,["141"] = 197,["142"] = 201,["143"] = 201,["144"] = 205,["145"] = 206,["146"] = 205,["147"] = 209,["148"] = 210,["149"] = 209,["150"] = 213,["151"] = 214,["152"] = 216,["153"] = 217,["154"] = 218,["156"] = 220,["157"] = 221,["159"] = 224,["160"] = 213,["161"] = 230,["162"] = 231,["163"] = 230,["164"] = 234,["165"] = 235,["166"] = 234,["167"] = 238,["168"] = 239,["169"] = 239,["170"] = 240,["171"] = 239,["172"] = 242,["173"] = 242,["174"] = 242,["175"] = 243,["176"] = 238,["177"] = 246,["178"] = 247,["179"] = 248,["180"] = 249,["181"] = 251,["182"] = 246,["183"] = 258,["184"] = 259,["185"] = 259,["186"] = 259,["187"] = 260,["189"] = 263,["190"] = 264,["191"] = 265,["192"] = 266,["194"] = 269,["195"] = 258,["196"] = 273,["197"] = 279,["198"] = 280,["199"] = 281,["200"] = 282,["202"] = 284,["203"] = 285,["205"] = 287,["206"] = 273,["207"] = 290,["208"] = 291,["209"] = 291,["210"] = 291,["211"] = 291,["212"] = 291,["213"] = 291,["214"] = 292,["215"] = 293,["216"] = 294,["218"] = 297,["219"] = 298,["220"] = 299,["222"] = 301,["223"] = 302,["224"] = 303,["225"] = 304,["228"] = 308,["229"] = 309,["230"] = 310,["231"] = 311,["233"] = 313,["236"] = 317,["237"] = 318,["238"] = 319,["239"] = 320,["242"] = 290,["243"] = 325,["244"] = 326,["245"] = 325,["246"] = 332,["248"] = 333,["250"] = 333,["251"] = 332,["252"] = 336,["253"] = 337,["254"] = 338,["255"] = 338,["256"] = 338,["257"] = 341,["258"] = 342,["259"] = 342,["260"] = 342,["261"] = 343,["262"] = 343,["263"] = 343,["264"] = 343,["265"] = 343,["266"] = 343,["267"] = 336,["268"] = 346,["269"] = 347,["270"] = 348,["271"] = 349,["272"] = 349,["273"] = 349,["274"] = 350,["275"] = 350,["276"] = 350,["277"] = 350,["278"] = 350,["279"] = 350,["280"] = 346,["281"] = 353,["282"] = 354,["283"] = 355,["284"] = 353,["285"] = 358,["286"] = 359,["287"] = 360,["288"] = 361,["289"] = 362,["290"] = 363,["291"] = 364,["292"] = 374,["293"] = 358,["294"] = 377,["295"] = 378,["296"] = 379,["298"] = 382,["299"] = 384,["300"] = 385,["301"] = 386,["302"] = 386,["303"] = 386,["305"] = 388,["306"] = 389,["307"] = 390,["308"] = 391,["310"] = 377,["311"] = 395,["312"] = 396,["313"] = 397,["314"] = 398,["315"] = 400,["316"] = 401,["318"] = 404,["319"] = 405,["320"] = 407,["321"] = 408,["322"] = 409,["323"] = 410,["324"] = 411,["325"] = 417,["326"] = 418,["330"] = 422,["331"] = 423,["332"] = 424,["333"] = 425,["334"] = 426,["336"] = 428,["339"] = 431,["341"] = 434,["342"] = 434,["343"] = 434,["344"] = 435,["346"] = 438,["347"] = 439,["348"] = 439,["349"] = 439,["350"] = 395,["351"] = 442,["352"] = 443,["353"] = 443,["354"] = 443,["355"] = 443,["356"] = 443,["357"] = 443,["358"] = 442,["359"] = 446,["360"] = 447,["361"] = 448,["362"] = 450,["363"] = 451,["364"] = 453,["365"] = 455,["366"] = 457,["367"] = 459,["368"] = 460,["369"] = 461,["370"] = 462,["371"] = 464,["372"] = 466,["373"] = 467,["374"] = 469,["375"] = 446,["376"] = 472,["377"] = 473,["378"] = 474,["379"] = 475,["380"] = 476,["381"] = 477,["382"] = 478,["383"] = 479,["384"] = 480,["385"] = 481,["387"] = 484,["388"] = 486,["389"] = 486,["390"] = 486,["391"] = 488,["392"] = 488,["393"] = 488,["394"] = 488,["395"] = 488,["396"] = 488,["397"] = 488,["398"] = 488,["399"] = 488,["400"] = 490,["401"] = 491,["402"] = 491,["403"] = 491,["404"] = 491,["405"] = 491,["406"] = 492,["407"] = 492,["408"] = 492,["409"] = 492,["410"] = 492,["411"] = 492,["412"] = 492,["413"] = 492,["414"] = 492,["415"] = 493,["416"] = 493,["417"] = 493,["418"] = 493,["419"] = 493,["420"] = 493,["421"] = 493,["423"] = 472,["424"] = 497,["425"] = 498,["426"] = 499,["427"] = 500,["429"] = 502,["430"] = 503,["432"] = 497});
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
____exports.Playing = __TS__Class()
local Playing = ____exports.Playing
Playing.name = "Playing"
__TS__ClassExtends(Playing, GameState)
function Playing.prototype.____constructor(self, level, gameController)
    GameState.prototype.____constructor(self)
    self.refueling = false
    if gameController then
        self.usingCustomController = true
    else
        self.usingCustomController = false
    end
    if gameController then
        print("using custom controller")
    end
    self.gameController = gameController or self
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
    self.gameController:init(self.level)
    self.gameUpdateChannel = love.thread.newChannel()
    self.gameInputChannel = love.thread.newChannel()
    self.clock = __TS__New(Clock)
end
Playing.prototype["end"] = function(self)
end
function Playing.prototype.init(self, level)
end
function Playing.prototype.getGameUpdateChannel(self)
    return self.gameUpdateChannel
end
function Playing.prototype.getGameInputChannel(self)
    return self.gameInputChannel
end
function Playing.prototype.getInput(self)
    local pedal = (love.keyboard.isDown(Controls.game.applyThrust) and 1) or 0
    local rotation = 0
    if love.keyboard.isDown(Controls.game.rotateLeft) then
        rotation = -1
    end
    if love.keyboard.isDown(Controls.game.rotateRight) then
        rotation = rotation + 1
    end
    return {pedal = pedal, rotation = rotation}
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
function Playing.prototype.constructReplay(self)
    return {frame = self.frames, level = self.level}
end
function Playing.prototype.endGame(self)
    (function()
        local ____self = self.gameController
        return ____self["end"](____self)
    end)()
end
function Playing.prototype.win(self)
    self:endGame()
    local metrics = {
        timeTaken = self.clock:getElapsed()
    }
    Application.popState()
    Application.pushState(
        __TS__New(Won, metrics)
    )
    Application.pushState(
        __TS__New(
            SaveReplayGameState,
            self:constructReplay()
        )
    )
end
function Playing.prototype.lose(self)
    self:endGame()
    Application.popState()
    Application.pushState(
        __TS__New(Lost)
    )
    Application.pushState(
        __TS__New(
            SaveReplayGameState,
            self:constructReplay()
        )
    )
end
function Playing.prototype.notMoving(self, dx, dy)
    local EPSILON = 0.0001
    return (math.abs(dx) < EPSILON) and (math.abs(dy) < EPSILON)
end
function Playing.prototype.recordReplayFrame(self)
    local rocketBody = self.rocket:getBody()
    local x, y = rocketBody:getPosition()
    local tilt = self.rocket:getTilt()
    local pedal = self.rocket:getPedal()
    local thrust = self.rocket:getThrust()
    local frame = {rocket = {x = x, y = y, pedal = pedal, thrust = thrust, tilt = tilt}}
    __TS__ArrayPush(self.frames, frame)
end
function Playing.prototype.update(self, dt)
    if self.usingCustomController then
        self.gameController:update(dt)
    end
    self.elapsed = self.elapsed + dt
    while self.elapsed >= timePerTick do
        if self.usingCustomController == false then
            self.gameInputChannel:push(
                self:getInput()
            )
        end
        self:physicsUpdate(timePerTick)
        love.graphics.captureScreenshot(self.gameUpdateChannel)
        self:recordReplayFrame()
        self.elapsed = self.elapsed - timePerTick
    end
end
function Playing.prototype.physicsUpdate(self, dt)
    local popped = self.gameController:getGameInputChannel():pop()
    if popped then
        local gameInput = popped
        self.rocket:setPedal(gameInput.pedal)
        self.rocket:setRotation(gameInput.rotation)
    end
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
        self:endGame()
        Application.popState()
    end
    if key == "p" then
        self:pause()
    end
end
return ____exports
