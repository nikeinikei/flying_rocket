--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 8,["9"] = 9,["10"] = 10,["11"] = 11,["12"] = 13,["13"] = 14,["14"] = 8,["15"] = 17,["16"] = 18,["17"] = 18,["18"] = 19,["19"] = 20,["20"] = 22,["21"] = 18,["22"] = 18,["23"] = 25,["24"] = 25,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 30,["29"] = 25,["30"] = 25,["31"] = 33,["32"] = 35,["33"] = 17});
local ____exports = {}
____exports.ScaledScreenshotter = __TS__Class()
local ScaledScreenshotter = ____exports.ScaledScreenshotter
ScaledScreenshotter.name = "ScaledScreenshotter"
function ScaledScreenshotter.prototype.____constructor(self, width, height, drawFunction)
    self.mainCanvas = love.graphics.newCanvas()
    self.scaledCanvas = love.graphics.newCanvas(width, height)
    self.drawFunction = drawFunction
    self.sx = width / love.graphics.getWidth()
    self.sy = height / love.graphics.getHeight()
end
function ScaledScreenshotter.prototype.captureScreenshot(self)
    self.mainCanvas:renderTo(
        function()
            love.graphics.clear()
            love.graphics.setBlendMode("alpha")
            self.drawFunction()
        end
    )
    self.scaledCanvas:renderTo(
        function()
            love.graphics.clear()
            love.graphics.setBlendMode("alpha", "premultiplied")
            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.draw(self.mainCanvas, 0, 0, 0, self.sx, self.sy)
        end
    )
    love.graphics.setBlendMode("alpha")
    return self.scaledCanvas:newImageData()
end
return ____exports
