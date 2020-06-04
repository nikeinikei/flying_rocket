--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 4,["7"] = 6,["8"] = 6,["9"] = 6,["10"] = 10,["11"] = 11,["12"] = 12,["13"] = 10,["14"] = 15,["15"] = 16,["16"] = 17,["17"] = 19,["18"] = 20,["19"] = 21,["20"] = 22,["21"] = 23,["22"] = 24,["23"] = 25,["25"] = 27,["27"] = 30,["28"] = 31,["30"] = 34,["31"] = 35,["32"] = 36,["33"] = 37,["34"] = 38,["35"] = 39,["36"] = 40,["37"] = 41,["38"] = 42,["39"] = 43,["41"] = 45,["43"] = 48,["44"] = 49,["46"] = 15});
local ____exports = {}
local highlightedLineWidth = 5
local normalLineWidth = 1
____exports.GridRenderer = __TS__Class()
local GridRenderer = ____exports.GridRenderer
GridRenderer.name = "GridRenderer"
function GridRenderer.prototype.____constructor(self, length, camera)
    self.length = length
    self.camera = camera
end
function GridRenderer.prototype.draw(self)
    local tx, ty = self.camera:getTranslation()
    local windowWidth, windowHeight = love.graphics.getDimensions()
    local lastX = tx + windowWidth
    local firstX = math.floor(tx / self.length) * self.length
    local currentX = firstX
    while currentX <= lastX do
        local useThickerLine = currentX == 0
        if useThickerLine then
            love.graphics.setLineWidth(highlightedLineWidth)
        else
            love.graphics.setLineWidth(normalLineWidth)
        end
        love.graphics.line(currentX, ty, currentX, ty + windowHeight)
        currentX = currentX + self.length
    end
    local diff = windowHeight % self.length
    local highestY = ty + windowHeight
    local offset = (highestY - diff) % self.length
    local firstY = ((offset == 0) and highestY) or (highestY - offset)
    local lastY = ty
    local currentY = firstY
    while currentY >= lastY do
        local useThickerLine = currentY == windowHeight
        if useThickerLine then
            love.graphics.setLineWidth(highlightedLineWidth)
        else
            love.graphics.setLineWidth(normalLineWidth)
        end
        love.graphics.line(tx, currentY, tx + windowWidth, currentY)
        currentY = currentY - self.length
    end
end
return ____exports
