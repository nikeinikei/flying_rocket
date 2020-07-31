--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 7,["14"] = 9,["15"] = 9,["16"] = 10,["17"] = 10,["18"] = 11,["19"] = 11,["20"] = 12,["21"] = 12,["22"] = 13,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 15,["27"] = 15,["28"] = 17,["29"] = 17,["30"] = 18,["31"] = 18,["32"] = 19,["33"] = 19,["34"] = 21,["35"] = 22,["36"] = 23,["37"] = 24,["38"] = 26,["39"] = 27,["40"] = 62,["41"] = 62,["42"] = 62,["43"] = 70,["44"] = 62,["45"] = 72,["46"] = 74,["47"] = 74,["48"] = 74,["49"] = 74,["50"] = 75,["51"] = 76,["52"] = 77,["53"] = 78,["54"] = 80,["55"] = 81,["56"] = 82,["57"] = 84,["58"] = 86,["59"] = 86,["60"] = 86,["61"] = 86,["62"] = 86,["63"] = 86,["64"] = 86,["65"] = 86,["66"] = 87,["67"] = 88,["68"] = 89,["70"] = 91,["71"] = 93,["73"] = 86,["74"] = 86,["75"] = 96,["76"] = 96,["77"] = 96,["78"] = 96,["79"] = 96,["80"] = 96,["81"] = 96,["82"] = 96,["83"] = 97,["84"] = 96,["85"] = 96,["86"] = 70,["87"] = 101,["88"] = 102,["89"] = 101,["90"] = 105,["91"] = 106,["92"] = 105,["93"] = 110,["94"] = 110,["95"] = 110,["96"] = 110,["97"] = 130,["98"] = 110,["99"] = 124,["100"] = 132,["101"] = 133,["103"] = 135,["104"] = 136,["105"] = 137,["106"] = 138,["107"] = 138,["108"] = 138,["109"] = 140,["110"] = 141,["111"] = 143,["112"] = 144,["113"] = 146,["114"] = 148,["115"] = 155,["116"] = 157,["117"] = 164,["118"] = 166,["119"] = 167,["120"] = 168,["121"] = 175,["122"] = 177,["124"] = 180,["125"] = 182,["126"] = 183,["127"] = 184,["128"] = 186,["129"] = 188,["130"] = 189,["131"] = 191,["132"] = 130,["133"] = 194,["134"] = 194,["135"] = 198,["136"] = 198,["137"] = 202,["138"] = 202,["139"] = 206,["140"] = 207,["141"] = 209,["142"] = 210,["143"] = 211,["145"] = 213,["146"] = 214,["148"] = 217,["149"] = 206,["150"] = 223,["151"] = 224,["152"] = 223,["153"] = 227,["154"] = 228,["155"] = 227,["156"] = 231,["157"] = 232,["158"] = 232,["159"] = 233,["160"] = 232,["161"] = 235,["162"] = 235,["163"] = 235,["164"] = 236,["165"] = 231,["166"] = 239,["167"] = 240,["168"] = 241,["169"] = 242,["170"] = 244,["171"] = 239,["172"] = 251,["173"] = 252,["174"] = 252,["175"] = 252,["176"] = 253,["178"] = 256,["179"] = 257,["180"] = 258,["181"] = 259,["183"] = 262,["184"] = 251,["185"] = 266,["186"] = 272,["187"] = 273,["188"] = 274,["189"] = 275,["191"] = 277,["192"] = 278,["194"] = 280,["195"] = 266,["196"] = 283,["197"] = 284,["198"] = 284,["199"] = 284,["200"] = 284,["201"] = 284,["202"] = 284,["203"] = 285,["204"] = 286,["205"] = 287,["207"] = 290,["208"] = 291,["209"] = 292,["211"] = 294,["212"] = 295,["213"] = 296,["214"] = 297,["217"] = 301,["218"] = 302,["219"] = 303,["220"] = 304,["222"] = 306,["225"] = 310,["226"] = 311,["227"] = 312,["228"] = 313,["231"] = 283,["232"] = 318,["233"] = 319,["234"] = 318,["235"] = 325,["237"] = 326,["239"] = 326,["240"] = 325,["241"] = 329,["242"] = 330,["243"] = 331,["244"] = 331,["245"] = 331,["246"] = 334,["247"] = 335,["248"] = 335,["249"] = 335,["250"] = 336,["251"] = 336,["252"] = 336,["253"] = 336,["254"] = 336,["255"] = 336,["256"] = 329,["257"] = 339,["258"] = 340,["259"] = 341,["260"] = 342,["261"] = 342,["262"] = 342,["263"] = 343,["264"] = 343,["265"] = 343,["266"] = 343,["267"] = 343,["268"] = 343,["269"] = 339,["270"] = 346,["271"] = 347,["272"] = 348,["273"] = 346,["274"] = 351,["275"] = 352,["276"] = 353,["277"] = 354,["278"] = 355,["279"] = 356,["280"] = 357,["281"] = 367,["282"] = 351,["283"] = 370,["284"] = 371,["285"] = 373,["286"] = 374,["287"] = 375,["288"] = 376,["289"] = 376,["290"] = 376,["291"] = 376,["292"] = 376,["293"] = 376,["294"] = 376,["295"] = 381,["296"] = 382,["298"] = 370,["299"] = 386,["300"] = 387,["301"] = 389,["302"] = 390,["303"] = 392,["304"] = 393,["305"] = 395,["306"] = 396,["307"] = 397,["308"] = 398,["309"] = 399,["310"] = 405,["311"] = 406,["315"] = 410,["316"] = 411,["317"] = 412,["318"] = 413,["319"] = 414,["321"] = 416,["324"] = 419,["326"] = 422,["327"] = 422,["328"] = 422,["329"] = 423,["331"] = 426,["332"] = 427,["333"] = 427,["334"] = 427,["335"] = 386,["336"] = 430,["337"] = 431,["338"] = 431,["339"] = 431,["340"] = 431,["341"] = 431,["342"] = 431,["343"] = 430,["344"] = 434,["345"] = 435,["346"] = 436,["347"] = 438,["348"] = 439,["349"] = 441,["350"] = 443,["351"] = 445,["352"] = 447,["353"] = 448,["354"] = 449,["355"] = 450,["356"] = 452,["357"] = 454,["358"] = 455,["359"] = 457,["360"] = 434,["361"] = 460,["362"] = 461,["363"] = 462,["364"] = 463,["365"] = 464,["366"] = 465,["367"] = 466,["368"] = 467,["369"] = 468,["370"] = 469,["372"] = 472,["373"] = 474,["374"] = 474,["375"] = 474,["376"] = 476,["377"] = 476,["378"] = 476,["379"] = 476,["380"] = 476,["381"] = 476,["382"] = 476,["383"] = 476,["384"] = 476,["385"] = 478,["386"] = 479,["387"] = 479,["388"] = 479,["389"] = 479,["390"] = 479,["391"] = 480,["392"] = 480,["393"] = 480,["394"] = 480,["395"] = 480,["396"] = 480,["397"] = 480,["398"] = 480,["399"] = 480,["400"] = 481,["401"] = 481,["402"] = 481,["403"] = 481,["404"] = 481,["405"] = 481,["406"] = 481,["408"] = 460,["409"] = 485,["410"] = 486,["411"] = 487,["413"] = 489,["414"] = 490,["416"] = 485});
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
    self.clock = __TS__New(Clock)
    self:recordFrame()
    self.gameController:init(self.level)
end
Playing.prototype["end"] = function(self)
end
function Playing.prototype.init(self, level)
end
function Playing.prototype.sendUpdate(self, gameUpdate)
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
        local x, y = self.rocket:getBody():getPosition()
        self.gameController:sendUpdate(
            {
                tilt = self.rocket:getTilt(),
                x = x,
                y = y
            }
        )
        self:recordFrame()
        self.elapsed = self.elapsed - timePerTick
    end
end
function Playing.prototype.physicsUpdate(self, dt)
    local gameInput = self.gameController:getInput()
    self.rocket:setPedal(gameInput.pedal)
    self.rocket:setRotation(gameInput.rotation)
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
