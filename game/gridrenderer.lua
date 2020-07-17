--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 4,["8"] = 5,["9"] = 6,["10"] = 7,["11"] = 9,["12"] = 9,["13"] = 9,["14"] = 13,["15"] = 14,["16"] = 15,["17"] = 13,["18"] = 18,["19"] = 19,["20"] = 21,["21"] = 22,["22"] = 23,["23"] = 24,["24"] = 25,["25"] = 26,["26"] = 27,["28"] = 27,["29"] = 27,["30"] = 27,["31"] = 28,["33"] = 30,["35"] = 30,["36"] = 30,["37"] = 30,["38"] = 31,["40"] = 34,["41"] = 35,["43"] = 38,["44"] = 39,["45"] = 40,["46"] = 41,["47"] = 42,["48"] = 43,["49"] = 44,["51"] = 44,["52"] = 44,["53"] = 44,["54"] = 45,["56"] = 47,["58"] = 47,["59"] = 47,["60"] = 47,["61"] = 48,["63"] = 51,["64"] = 52,["66"] = 18});
local ____exports = {}
local ____Color4 = require("Color4")
local Color = ____Color4.Color
local highlightedLineWidth = 7
local normalLineWidth = 2.5
local highlightedColor = __TS__New(Color, 0, 0, 1)
local normalColor = __TS__New(Color, 1, 1, 1)
____exports.GridRenderer = __TS__Class()
local GridRenderer = ____exports.GridRenderer
GridRenderer.name = "GridRenderer"
function GridRenderer.prototype.____constructor(self, length, camera)
    self.length = length
    self.camera = camera
end
function GridRenderer.prototype.draw(self)
    local tx, ty, viewportWidth, viewportHeight = self.camera:getViewport()
    local lastX = tx + viewportWidth
    local firstX = math.floor(tx / self.length) * self.length
    local currentX = firstX
    while currentX <= lastX do
        local useThickerLine = currentX == 0
        if useThickerLine then
            love.graphics.setColor(
                {
                    highlightedColor:unpacked()
                }
            )
            love.graphics.setLineWidth(highlightedLineWidth)
        else
            love.graphics.setColor(
                {
                    normalColor:unpacked()
                }
            )
            love.graphics.setLineWidth(normalLineWidth)
        end
        love.graphics.line(currentX, ty, currentX, ty + viewportHeight)
        currentX = currentX + self.length
    end
    local lastY = ty + viewportHeight
    local firstY = math.floor(ty / self.length) * self.length
    local currentY = firstY
    while currentY <= lastY do
        local useThickerLine = currentY == 0
        if useThickerLine then
            love.graphics.setColor(
                {
                    highlightedColor:unpacked()
                }
            )
            love.graphics.setLineWidth(highlightedLineWidth)
        else
            love.graphics.setColor(
                {
                    normalColor:unpacked()
                }
            )
            love.graphics.setLineWidth(normalLineWidth)
        end
        love.graphics.line(tx, currentY, tx + viewportWidth, currentY)
        currentY = currentY + self.length
    end
end
return ____exports
