--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 15,["6"] = 15,["7"] = 15,["8"] = 23,["9"] = 24,["10"] = 25,["11"] = 26,["12"] = 27,["13"] = 28,["14"] = 23,["15"] = 36,["16"] = 36,["17"] = 40,["18"] = 40});
local ____exports = {}
____exports.ParticleSystem = __TS__Class()
local ParticleSystem = ____exports.ParticleSystem
ParticleSystem.name = "ParticleSystem"
function ParticleSystem.prototype.____constructor(self, world, drawable)
    self.world = world
    self.drawable = drawable
    self.particles = {}
    self.emissionRate = 0
    self.velocities = {minX = 0, maxX = 0, minY = 0, maxY = 0}
end
function ParticleSystem.prototype.update(self, dt)
end
function ParticleSystem.prototype.draw(self)
end
return ____exports
