--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 9,["15"] = 9,["16"] = 10,["17"] = 10,["18"] = 11,["19"] = 11,["20"] = 12,["21"] = 12,["22"] = 13,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 15,["27"] = 15,["28"] = 17,["29"] = 17,["30"] = 18,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 21,["35"] = 22,["36"] = 23,["37"] = 24,["38"] = 26,["39"] = 27,["40"] = 44,["41"] = 44,["42"] = 44,["43"] = 52,["44"] = 44,["45"] = 54,["46"] = 56,["47"] = 56,["48"] = 56,["49"] = 56,["50"] = 57,["51"] = 58,["52"] = 59,["53"] = 60,["54"] = 62,["55"] = 63,["56"] = 64,["57"] = 66,["58"] = 68,["59"] = 68,["60"] = 68,["61"] = 68,["62"] = 68,["63"] = 68,["64"] = 68,["65"] = 68,["66"] = 69,["67"] = 70,["68"] = 71,["70"] = 73,["71"] = 75,["73"] = 68,["74"] = 68,["75"] = 78,["76"] = 78,["77"] = 78,["78"] = 78,["79"] = 78,["80"] = 78,["81"] = 78,["82"] = 78,["83"] = 79,["84"] = 78,["85"] = 78,["86"] = 52,["87"] = 83,["88"] = 84,["89"] = 83,["90"] = 87,["91"] = 88,["92"] = 87,["93"] = 96,["94"] = 96,["95"] = 96,["96"] = 96,["97"] = 111,["98"] = 96,["99"] = 107,["100"] = 113,["101"] = 114,["102"] = 115,["103"] = 115,["104"] = 115,["105"] = 117,["106"] = 118,["107"] = 120,["108"] = 121,["109"] = 123,["110"] = 125,["111"] = 132,["112"] = 134,["113"] = 141,["114"] = 143,["115"] = 144,["116"] = 145,["117"] = 152,["118"] = 154,["120"] = 157,["121"] = 159,["122"] = 160,["123"] = 161,["124"] = 163,["125"] = 165,["126"] = 167,["127"] = 111,["128"] = 170,["129"] = 171,["130"] = 170,["131"] = 174,["132"] = 175,["133"] = 174,["134"] = 178,["135"] = 179,["136"] = 178,["137"] = 182,["138"] = 183,["139"] = 182,["140"] = 186,["141"] = 187,["142"] = 186,["143"] = 190,["144"] = 191,["145"] = 190,["146"] = 194,["147"] = 195,["148"] = 195,["149"] = 196,["150"] = 195,["151"] = 198,["152"] = 198,["153"] = 198,["154"] = 199,["155"] = 194,["156"] = 202,["157"] = 203,["158"] = 204,["159"] = 205,["160"] = 207,["161"] = 202,["162"] = 214,["163"] = 215,["164"] = 215,["165"] = 215,["166"] = 216,["168"] = 219,["169"] = 220,["170"] = 221,["171"] = 222,["173"] = 225,["174"] = 214,["175"] = 229,["176"] = 235,["177"] = 236,["178"] = 237,["179"] = 238,["181"] = 240,["182"] = 241,["184"] = 243,["185"] = 229,["186"] = 246,["187"] = 247,["188"] = 247,["189"] = 247,["190"] = 247,["191"] = 247,["192"] = 247,["193"] = 248,["194"] = 249,["195"] = 250,["197"] = 253,["198"] = 254,["199"] = 255,["201"] = 257,["202"] = 258,["203"] = 259,["204"] = 260,["207"] = 264,["208"] = 265,["209"] = 266,["210"] = 267,["212"] = 269,["215"] = 273,["216"] = 274,["217"] = 275,["218"] = 276,["221"] = 246,["222"] = 281,["223"] = 282,["224"] = 281,["225"] = 288,["226"] = 288,["227"] = 291,["228"] = 292,["229"] = 293,["230"] = 293,["231"] = 293,["232"] = 296,["233"] = 297,["234"] = 297,["235"] = 297,["236"] = 298,["237"] = 298,["238"] = 298,["239"] = 298,["240"] = 298,["241"] = 298,["242"] = 291,["243"] = 301,["244"] = 302,["245"] = 303,["246"] = 304,["247"] = 304,["248"] = 304,["249"] = 305,["250"] = 305,["251"] = 305,["252"] = 305,["253"] = 305,["254"] = 305,["255"] = 301,["256"] = 308,["257"] = 309,["258"] = 310,["259"] = 308,["260"] = 313,["261"] = 314,["262"] = 315,["263"] = 316,["264"] = 317,["265"] = 318,["266"] = 319,["267"] = 329,["268"] = 313,["269"] = 332,["270"] = 333,["271"] = 335,["272"] = 336,["273"] = 337,["274"] = 338,["276"] = 332,["277"] = 342,["278"] = 343,["279"] = 344,["280"] = 346,["281"] = 347,["282"] = 348,["283"] = 349,["284"] = 350,["285"] = 356,["286"] = 357,["290"] = 361,["291"] = 362,["292"] = 363,["293"] = 364,["294"] = 365,["296"] = 367,["299"] = 370,["301"] = 373,["302"] = 373,["303"] = 373,["304"] = 374,["306"] = 377,["307"] = 378,["308"] = 378,["309"] = 378,["310"] = 342,["311"] = 381,["312"] = 382,["313"] = 382,["314"] = 382,["315"] = 382,["316"] = 382,["317"] = 382,["318"] = 381,["319"] = 385,["320"] = 386,["321"] = 387,["322"] = 389,["323"] = 390,["324"] = 392,["325"] = 394,["326"] = 396,["327"] = 398,["328"] = 399,["329"] = 400,["330"] = 401,["331"] = 403,["332"] = 405,["333"] = 406,["334"] = 408,["335"] = 385,["336"] = 411,["337"] = 412,["338"] = 413,["339"] = 414,["340"] = 415,["341"] = 416,["342"] = 417,["343"] = 418,["344"] = 419,["345"] = 420,["347"] = 423,["348"] = 425,["349"] = 425,["350"] = 425,["351"] = 427,["352"] = 427,["353"] = 427,["354"] = 427,["355"] = 427,["356"] = 427,["357"] = 427,["358"] = 427,["359"] = 427,["360"] = 429,["361"] = 430,["362"] = 430,["363"] = 430,["364"] = 430,["365"] = 430,["366"] = 431,["367"] = 431,["368"] = 431,["369"] = 431,["370"] = 431,["371"] = 431,["372"] = 431,["373"] = 431,["374"] = 431,["375"] = 432,["376"] = 432,["377"] = 432,["378"] = 432,["379"] = 432,["380"] = 432,["381"] = 432,["383"] = 411,["384"] = 436,["385"] = 437,["386"] = 438,["387"] = 439,["389"] = 441,["390"] = 442,["392"] = 436,["393"] = 450,["394"] = 450,["395"] = 450,["396"] = 450,["397"] = 451,["398"] = 452,["399"] = 454,["400"] = 455,["401"] = 456,["403"] = 458,["404"] = 459,["406"] = 462,["407"] = 464,["408"] = 450,["409"] = 451});
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
____exports.AbstractPlaying = __TS__Class()
local AbstractPlaying = ____exports.AbstractPlaying
AbstractPlaying.name = "AbstractPlaying"
__TS__ClassExtends(AbstractPlaying, GameState)
function AbstractPlaying.prototype.____constructor(self, level)
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
    self:recordReplayFrame()
    self.clock = __TS__New(Clock)
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
function AbstractPlaying.prototype.endGame(self)
end
function AbstractPlaying.prototype.win(self)
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
function AbstractPlaying.prototype.lose(self)
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
    self.elapsed = self.elapsed + dt
    while self.elapsed >= timePerTick do
        self:physicsUpdate(timePerTick)
        self:recordReplayFrame()
        self.elapsed = self.elapsed - timePerTick
    end
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
    self.camera:update(dt)
    self.stars:setViewport(
        self.camera:getViewport()
    )
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
        self:endGame()
        Application.popState()
    end
    if key == "p" then
        self:pause()
    end
end
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
