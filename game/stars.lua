--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 6,["8"] = 7,["9"] = 8,["10"] = 9,["11"] = 6,["12"] = 12,["13"] = 13,["14"] = 13,["15"] = 13,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 14,["27"] = 12,["28"] = 18,["29"] = 18,["30"] = 24,["31"] = 25,["32"] = 27,["33"] = 28,["34"] = 29,["35"] = 30,["37"] = 31,["38"] = 31,["40"] = 32,["41"] = 32,["42"] = 33,["43"] = 34,["44"] = 35,["45"] = 35,["46"] = 35,["47"] = 35,["48"] = 35,["49"] = 35,["51"] = 36,["52"] = 36,["53"] = 37,["54"] = 38,["55"] = 39,["56"] = 39,["57"] = 39,["58"] = 39,["59"] = 40,["60"] = 40,["61"] = 40,["62"] = 40,["63"] = 36,["66"] = 32,["69"] = 31,["72"] = 24,["73"] = 46,["74"] = 47,["75"] = 48,["77"] = 46,["78"] = 19,["79"] = 20,["80"] = 53,["81"] = 53,["82"] = 53,["84"] = 58,["85"] = 61,["86"] = 62,["87"] = 62,["88"] = 62,["89"] = 62,["90"] = 62,["91"] = 62,["92"] = 60,["93"] = 70,["94"] = 71,["95"] = 72,["96"] = 73,["97"] = 74,["99"] = 77,["100"] = 78,["101"] = 79,["102"] = 80,["104"] = 82,["105"] = 70,["106"] = 85,["107"] = 86,["108"] = 87,["109"] = 88,["110"] = 89,["111"] = 85,["112"] = 92,["113"] = 93,["114"] = 94,["115"] = 96,["116"] = 97,["117"] = 99,["119"] = 100,["120"] = 100,["122"] = 101,["123"] = 101,["124"] = 102,["125"] = 102,["126"] = 102,["127"] = 102,["128"] = 101,["131"] = 100,["134"] = 105,["135"] = 92,["136"] = 108,["137"] = 109,["138"] = 109,["139"] = 109,["140"] = 110,["142"] = 108,["143"] = 54});
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
