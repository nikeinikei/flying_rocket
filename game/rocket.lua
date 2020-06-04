--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 2,["7"] = 4,["8"] = 4,["9"] = 4,["10"] = 15,["11"] = 16,["12"] = 17,["13"] = 18,["14"] = 19,["15"] = 20,["16"] = 21,["17"] = 22,["18"] = 15,["19"] = 25,["20"] = 26,["21"] = 25,["22"] = 29,["23"] = 30,["24"] = 29,["25"] = 33,["26"] = 34,["27"] = 33,["28"] = 37,["29"] = 38,["30"] = 37,["31"] = 42,["32"] = 43,["33"] = 42,["34"] = 46,["35"] = 47,["36"] = 48,["37"] = 49,["38"] = 51,["39"] = 52,["40"] = 53,["41"] = 54,["42"] = 46,["43"] = 57,["44"] = 58,["45"] = 58,["46"] = 58,["47"] = 58,["48"] = 58,["49"] = 58,["50"] = 57,["51"] = 5,["52"] = 6,["53"] = 7});
local ____exports = {}
local rotationSpeed = (2 * math.pi) / 20
local maxThrust = 400
____exports.Rocket = __TS__Class()
local Rocket = ____exports.Rocket
Rocket.name = "Rocket"
function Rocket.prototype.____constructor(self, world, x, y)
    self.body = love.physics.newBody(world, x, y, "dynamic")
    self.body:setMass(1)
    self.shape = love.physics.newRectangleShape(____exports.Rocket.width, ____exports.Rocket.height)
    self.fixture = love.physics.newFixture(self.body, self.shape)
    self.fixture:setUserData(____exports.Rocket.userData)
    self.rotation = 0
    self.thrust = 0.9
end
function Rocket.prototype.getBody(self)
    return self.body
end
function Rocket.prototype.getTilt(self)
    return self.body:getAngle()
end
function Rocket.prototype.setThrust(self, thrust)
    self.thrust = thrust
end
function Rocket.prototype.setRotation(self, rotation)
    self.rotation = rotation
end
function Rocket.prototype.getPosition(self)
    return self.body:getPosition()
end
function Rocket.prototype.update(self, dt)
    local angle = self.body:getAngle()
    angle = angle + ((rotationSpeed * dt) * self.rotation)
    self.body:setAngle(angle)
    local effectiveThrust = self.thrust * maxThrust
    local effectiveThrustX = math.sin(angle) * effectiveThrust
    local effectiveThrustY = -math.cos(angle) * effectiveThrust
    self.body:applyForce(effectiveThrustX, effectiveThrustY)
end
function Rocket.prototype.draw(self)
    love.graphics.polygon(
        "fill",
        self.body:getWorldPoints(
            self.shape:getPoints()
        )
    )
end
Rocket.width = 50
Rocket.height = 50
Rocket.userData = "Rocket"
return ____exports
