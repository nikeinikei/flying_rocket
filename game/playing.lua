--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 9,["15"] = 9,["16"] = 10,["17"] = 10,["18"] = 11,["19"] = 11,["20"] = 12,["21"] = 12,["22"] = 13,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 15,["27"] = 15,["28"] = 17,["29"] = 17,["30"] = 18,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 21,["35"] = 22,["36"] = 23,["37"] = 24,["38"] = 26,["39"] = 27,["40"] = 44,["41"] = 44,["42"] = 44,["43"] = 52,["44"] = 44,["45"] = 54,["46"] = 56,["47"] = 56,["48"] = 56,["49"] = 56,["50"] = 57,["51"] = 58,["52"] = 59,["53"] = 60,["54"] = 62,["55"] = 63,["56"] = 64,["57"] = 66,["58"] = 68,["59"] = 68,["60"] = 68,["61"] = 68,["62"] = 68,["63"] = 68,["64"] = 68,["65"] = 68,["66"] = 69,["67"] = 70,["68"] = 71,["70"] = 73,["71"] = 75,["73"] = 68,["74"] = 68,["75"] = 78,["76"] = 78,["77"] = 78,["78"] = 78,["79"] = 78,["80"] = 78,["81"] = 78,["82"] = 78,["83"] = 79,["84"] = 78,["85"] = 78,["86"] = 52,["87"] = 83,["88"] = 84,["89"] = 83,["90"] = 87,["91"] = 88,["92"] = 87,["93"] = 92,["94"] = 92,["95"] = 92,["96"] = 92,["97"] = 110,["98"] = 92,["99"] = 104,["100"] = 112,["101"] = 113,["102"] = 114,["103"] = 114,["104"] = 114,["105"] = 116,["106"] = 117,["107"] = 119,["108"] = 120,["109"] = 122,["110"] = 124,["111"] = 131,["112"] = 133,["113"] = 140,["114"] = 142,["115"] = 143,["116"] = 144,["117"] = 151,["118"] = 153,["120"] = 156,["121"] = 158,["122"] = 159,["123"] = 160,["124"] = 162,["125"] = 164,["126"] = 165,["127"] = 110,["128"] = 168,["129"] = 169,["130"] = 168,["131"] = 172,["132"] = 173,["133"] = 172,["134"] = 176,["135"] = 177,["136"] = 177,["137"] = 178,["138"] = 177,["139"] = 180,["140"] = 180,["141"] = 180,["142"] = 181,["143"] = 176,["144"] = 184,["145"] = 185,["146"] = 186,["147"] = 187,["148"] = 189,["149"] = 184,["150"] = 196,["151"] = 197,["152"] = 197,["153"] = 197,["154"] = 198,["156"] = 201,["157"] = 202,["158"] = 203,["159"] = 204,["161"] = 207,["162"] = 196,["163"] = 211,["164"] = 217,["165"] = 218,["166"] = 219,["167"] = 220,["169"] = 222,["170"] = 223,["172"] = 225,["173"] = 211,["174"] = 228,["175"] = 229,["176"] = 229,["177"] = 229,["178"] = 229,["179"] = 229,["180"] = 229,["181"] = 230,["182"] = 231,["183"] = 232,["185"] = 235,["186"] = 236,["187"] = 237,["189"] = 239,["190"] = 240,["191"] = 241,["192"] = 242,["195"] = 246,["196"] = 247,["197"] = 248,["198"] = 249,["200"] = 251,["203"] = 255,["204"] = 256,["205"] = 257,["206"] = 258,["209"] = 228,["210"] = 263,["211"] = 264,["212"] = 263,["213"] = 270,["214"] = 271,["215"] = 271,["216"] = 271,["217"] = 274,["218"] = 275,["219"] = 275,["220"] = 275,["221"] = 276,["222"] = 276,["223"] = 276,["224"] = 276,["225"] = 276,["226"] = 276,["227"] = 270,["228"] = 279,["229"] = 280,["230"] = 281,["231"] = 281,["232"] = 281,["233"] = 282,["234"] = 282,["235"] = 282,["236"] = 282,["237"] = 282,["238"] = 282,["239"] = 279,["240"] = 285,["241"] = 286,["242"] = 287,["243"] = 285,["244"] = 290,["245"] = 291,["246"] = 292,["247"] = 293,["248"] = 294,["249"] = 295,["250"] = 296,["251"] = 306,["252"] = 290,["253"] = 309,["254"] = 310,["255"] = 312,["256"] = 313,["257"] = 314,["258"] = 315,["260"] = 309,["261"] = 319,["262"] = 320,["263"] = 321,["265"] = 323,["267"] = 326,["268"] = 327,["269"] = 328,["271"] = 330,["272"] = 331,["274"] = 333,["275"] = 335,["276"] = 336,["277"] = 338,["278"] = 339,["279"] = 340,["280"] = 341,["281"] = 342,["282"] = 348,["283"] = 349,["287"] = 353,["288"] = 354,["289"] = 355,["290"] = 356,["291"] = 357,["293"] = 359,["296"] = 362,["298"] = 365,["299"] = 365,["300"] = 365,["301"] = 366,["303"] = 369,["304"] = 370,["305"] = 370,["306"] = 370,["307"] = 319,["308"] = 373,["309"] = 374,["310"] = 374,["311"] = 374,["312"] = 374,["313"] = 374,["314"] = 374,["315"] = 373,["316"] = 377,["317"] = 378,["318"] = 379,["319"] = 381,["320"] = 382,["321"] = 384,["322"] = 386,["323"] = 388,["324"] = 390,["325"] = 391,["326"] = 392,["327"] = 393,["328"] = 395,["329"] = 397,["330"] = 398,["331"] = 400,["332"] = 377,["333"] = 403,["334"] = 404,["335"] = 405,["336"] = 406,["337"] = 407,["338"] = 408,["339"] = 409,["340"] = 410,["341"] = 411,["342"] = 412,["344"] = 415,["345"] = 417,["346"] = 417,["347"] = 417,["348"] = 419,["349"] = 419,["350"] = 419,["351"] = 419,["352"] = 419,["353"] = 419,["354"] = 419,["355"] = 419,["356"] = 419,["357"] = 421,["358"] = 422,["359"] = 422,["360"] = 422,["361"] = 422,["362"] = 422,["363"] = 423,["364"] = 423,["365"] = 423,["366"] = 423,["367"] = 423,["368"] = 423,["369"] = 423,["370"] = 423,["371"] = 423,["372"] = 424,["373"] = 424,["374"] = 424,["375"] = 424,["376"] = 424,["377"] = 424,["378"] = 424,["380"] = 403,["381"] = 428,["382"] = 429,["383"] = 430,["385"] = 432,["386"] = 433,["388"] = 428});
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
function Playing.prototype.constructReplay(self)
    return {frame = self.frames, level = self.level}
end
function Playing.prototype.win(self)
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
