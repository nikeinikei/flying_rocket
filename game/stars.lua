--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 6,["8"] = 7,["9"] = 8,["10"] = 9,["11"] = 6,["12"] = 12,["13"] = 13,["14"] = 13,["15"] = 13,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 14,["27"] = 12,["28"] = 18,["29"] = 18,["30"] = 24,["31"] = 25,["32"] = 27,["33"] = 28,["34"] = 29,["35"] = 30,["37"] = 31,["38"] = 31,["40"] = 32,["41"] = 32,["42"] = 33,["43"] = 34,["44"] = 35,["45"] = 36,["46"] = 36,["47"] = 36,["48"] = 35,["49"] = 35,["51"] = 38,["52"] = 38,["53"] = 39,["54"] = 40,["55"] = 41,["56"] = 41,["57"] = 41,["58"] = 41,["59"] = 42,["60"] = 42,["61"] = 42,["62"] = 42,["63"] = 38,["66"] = 32,["69"] = 31,["72"] = 24,["73"] = 48,["74"] = 49,["75"] = 50,["77"] = 48,["78"] = 19,["79"] = 20,["80"] = 55,["81"] = 55,["82"] = 55,["84"] = 60,["85"] = 63,["86"] = 64,["87"] = 64,["88"] = 64,["89"] = 64,["90"] = 64,["91"] = 64,["92"] = 62,["93"] = 72,["94"] = 73,["95"] = 74,["96"] = 75,["97"] = 76,["99"] = 79,["100"] = 80,["101"] = 81,["102"] = 82,["104"] = 84,["105"] = 72,["106"] = 87,["107"] = 88,["108"] = 89,["109"] = 90,["110"] = 91,["111"] = 87,["112"] = 94,["113"] = 95,["114"] = 96,["115"] = 98,["116"] = 99,["117"] = 101,["119"] = 102,["120"] = 102,["122"] = 103,["123"] = 103,["124"] = 104,["125"] = 104,["126"] = 104,["127"] = 104,["128"] = 103,["131"] = 102,["134"] = 107,["135"] = 94,["136"] = 110,["137"] = 111,["138"] = 111,["139"] = 111,["140"] = 112,["142"] = 110,["143"] = 56});
local ____exports = {}
local Star = __TS__Class()
Star.name = "Star"
function Star.prototype.____constructor(self, x, y, r)
    self.x = x
    self.y = y
    self.r = r
end
function Star.prototype.draw(self)
    love.graphics.setColor(
        1,
        1,
        1,
        love.math.noise(
            self.x,
            self.y,
            math.max(
                love.timer.getTime() * 0.4,
                0.4
            )
        )
    )
    love.graphics.circle("fill", self.x, self.y, self.r)
end
local Chunk = __TS__Class()
Chunk.name = "Chunk"
function Chunk.prototype.____constructor(self, x, y, chunkLength)
    self.stars = {}
    local n = 10
    local length = chunkLength / n
    local area = length * length
    local medianNumberOfStars = area * Chunk.starDensity
    do
        local i = 0
        while i < n do
            do
                local j = 0
                while j < n do
                    local currentX = x + (i * length)
                    local currentY = y + (j * length)
                    local numberOfStars = math.floor(
                        math.max(
                            love.math.randomNormal(Chunk.deviation, medianNumberOfStars),
                            0
                        )
                    )
                    do
                        local i = 0
                        while i < numberOfStars do
                            local starX = love.math.random(currentX, currentX + length)
                            local starY = love.math.random(currentY, currentY + length)
                            local r = math.max(
                                love.math.randomNormal(0.4, 3),
                                1
                            )
                            table.insert(
                                self.stars,
                                __TS__New(Star, starX, starY, r)
                            )
                            i = i + 1
                        end
                    end
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
end
function Chunk.prototype.draw(self)
    for ____, star in ipairs(self.stars) do
        star:draw()
    end
end
Chunk.starDensity = 5 / (500 * 500)
Chunk.deviation = 2
____exports.Stars = __TS__Class()
local Stars = ____exports.Stars
Stars.name = "Stars"
function Stars.prototype.____constructor(self)
    self.activeChunks = {}
    self.chunks = {}
    self.viewport = {
        x = 0,
        y = 0,
        w = love.graphics.getWidth(),
        h = love.graphics.getHeight()
    }
end
function Stars.prototype.getChunk(self, i, j)
    local col = self.chunks[i]
    if not col then
        col = {}
        self.chunks[i] = col
    end
    local entry = col[j]
    if not entry then
        entry = __TS__New(Chunk, i * ____exports.Stars.chunkLength, j * ____exports.Stars.chunkLength, ____exports.Stars.chunkLength)
        col[j] = entry
    end
    return entry
end
function Stars.prototype.setViewport(self, x, y, w, h)
    self.viewport.x = x
    self.viewport.y = y
    self.viewport.w = w
    self.viewport.h = h
end
function Stars.prototype.getActiveChunks(self)
    local firstI = math.floor(self.viewport.x / ____exports.Stars.chunkLength)
    local firstJ = math.floor(self.viewport.y / ____exports.Stars.chunkLength)
    local lastI = math.floor((self.viewport.x + self.viewport.w) / ____exports.Stars.chunkLength)
    local lastJ = math.floor((self.viewport.y + self.viewport.h) / ____exports.Stars.chunkLength)
    __TS__ArraySetLength(self.activeChunks, 0)
    do
        local i = firstI
        while i <= lastI do
            do
                local j = firstJ
                while j <= lastJ do
                    table.insert(
                        self.activeChunks,
                        self:getChunk(i, j)
                    )
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    return self.activeChunks
end
function Stars.prototype.draw(self)
    for ____, chunk in ipairs(
        self:getActiveChunks()
    ) do
        chunk:draw()
    end
end
Stars.chunkLength = 1000
return ____exports
