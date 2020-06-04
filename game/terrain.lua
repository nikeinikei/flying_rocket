--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 10,["9"] = 11,["10"] = 12,["11"] = 13,["12"] = 14,["13"] = 15,["14"] = 16,["15"] = 17,["16"] = 18,["17"] = 19,["18"] = 21,["19"] = 22,["20"] = 23,["22"] = 10,["23"] = 27,["24"] = 28,["25"] = 29,["26"] = 30,["28"] = 27,["29"] = 2});
local ____exports = {}
____exports.Terrain = __TS__Class()
local Terrain = ____exports.Terrain
Terrain.name = "Terrain"
function Terrain.prototype.____constructor(self, world, points)
    self.points = points
    self.body = {}
    self.shape = {}
    self.fixture = {}
    for ____, ps in ipairs(points) do
        local body = love.physics.newBody(world, 0, 0, "static")
        local shape = love.physics.newChainShape(false, ps)
        local fixture = love.physics.newFixture(body, shape)
        fixture:setUserData(____exports.Terrain.userData)
        __TS__ArrayPush(self.body, body)
        __TS__ArrayPush(self.shape, shape)
        __TS__ArrayPush(self.fixture, fixture)
    end
end
function Terrain.prototype.draw(self)
    for ____, ps in ipairs(self.points) do
        love.graphics.setLineWidth(5)
        love.graphics.line(ps)
    end
end
Terrain.userData = "Terrain"
return ____exports
