local json = require "libs.json"
local Array = require "util.array"

local Levels = {}

local fileName = "levels.json"
local levels

local function init()
    if love.filesystem.getInfo(fileName) then
        levels = json.decode(love.filesystem.read(fileName))
        for i = 1, #levels do
            setmetatable(levels[i].terrainPoints, getmetatable(Array()))
        end
    else
        levels = {}
    end
end

local function save()
    love.filesystem.write(fileName, json.encode(levels))
end

Levels.addLevel = function(level)
    table.insert(levels, level)
    save()
end

Levels.removeLevel = function(levelIndex)
    table.remove(levels, levelIndex)
    save()
end

Levels.nameUsed = function(name)
    for i = 1, #levels do
        if levels[i].name == name then
            return true
        end
    end
    return false
end

Levels.getLevels = function()
    return levels
end

init()
save()

return Levels