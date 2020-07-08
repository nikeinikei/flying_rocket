--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 3,["8"] = 9,["9"] = 10,["10"] = 12,["11"] = 13,["12"] = 9,["13"] = 17,["14"] = 18,["15"] = 17,["16"] = 21,["17"] = 22,["18"] = 23,["19"] = 25,["20"] = 26,["21"] = 21,["22"] = 29,["23"] = 30,["24"] = 29});
local ____exports = {}
____exports.PlayingCamera = __TS__Class()
local PlayingCamera = ____exports.PlayingCamera
PlayingCamera.name = "PlayingCamera"
function PlayingCamera.prototype.____constructor(self, rocket)
    self.rocket = rocket
    self.tx = 0
    self.ty = 0
end
function PlayingCamera.prototype.getTranslation(self)
    return self.tx, self.ty
end
function PlayingCamera.prototype.update(self, dt)
    local rocketX, rocketY = self.rocket:getPosition()
    local windowWidth, windowHeight = love.graphics.getDimensions()
    self.tx = rocketX - (windowWidth / 2)
    self.ty = rocketY - (windowHeight / 2)
end
function PlayingCamera.prototype.apply(self)
    love.graphics.translate(-self.tx, -self.ty)
end
return ____exports
