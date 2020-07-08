--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 6,["8"] = 7,["9"] = 8,["10"] = 9,["11"] = 6,["12"] = 12,["13"] = 12,["14"] = 16,["16"] = 17,["17"] = 18,["19"] = 16,["20"] = 22,["21"] = 22,["22"] = 28,["23"] = 29,["24"] = 31,["25"] = 32,["26"] = 33,["27"] = 34,["29"] = 35,["30"] = 35,["32"] = 36,["33"] = 36,["34"] = 37,["35"] = 38,["36"] = 39,["37"] = 39,["38"] = 39,["39"] = 39,["40"] = 39,["41"] = 39,["43"] = 40,["44"] = 40,["45"] = 41,["46"] = 42,["47"] = 43,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 44,["52"] = 44,["53"] = 44,["54"] = 44,["55"] = 40,["58"] = 36,["61"] = 35,["64"] = 28,["65"] = 50,["66"] = 51,["67"] = 52,["69"] = 50,["70"] = 56,["71"] = 57,["72"] = 58,["74"] = 56,["75"] = 23,["76"] = 24,["77"] = 63,["78"] = 63,["79"] = 63,["81"] = 68,["82"] = 71,["83"] = 72,["84"] = 72,["85"] = 72,["86"] = 72,["87"] = 72,["88"] = 72,["89"] = 70,["90"] = 80,["91"] = 81,["92"] = 82,["93"] = 83,["94"] = 84,["96"] = 87,["97"] = 88,["98"] = 89,["99"] = 90,["101"] = 92,["102"] = 80,["103"] = 95,["104"] = 96,["105"] = 97,["106"] = 98,["107"] = 99,["108"] = 95,["109"] = 102,["110"] = 103,["111"] = 104,["112"] = 106,["113"] = 107,["114"] = 109,["116"] = 110,["117"] = 110,["119"] = 111,["120"] = 111,["121"] = 112,["122"] = 112,["123"] = 112,["124"] = 112,["125"] = 111,["128"] = 110,["131"] = 115,["132"] = 102,["133"] = 118,["134"] = 119,["135"] = 119,["136"] = 119,["137"] = 120,["139"] = 118,["140"] = 124,["141"] = 125,["142"] = 125,["143"] = 125,["144"] = 126,["146"] = 124,["147"] = 64});
local ____exports = {}
local Star = __TS__Class()
Star.name = "Star"
function Star.prototype.____constructor(self, x, y, r)
    self.x = x
    self.y = y
    self.r = r
end
function Star.prototype.update(self, dt)
end
function Star.prototype.draw(self)
    do
        love.graphics.setColor(1, 1, 1, 1)
        love.graphics.circle("fill", self.x, self.y, self.r)
    end
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
function Chunk.prototype.update(self, dt)
    for ____, star in ipairs(self.stars) do
        star:update(dt)
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
function Stars.prototype.update(self, dt)
    for ____, chunk in ipairs(
        self:getActiveChunks()
    ) do
        chunk:update(dt)
    end
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
