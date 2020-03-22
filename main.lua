require "asserts"
require "application"
require "globals"

local Playing = require "playing"
local LevelBuilder = require "levelbuilder"

function love.load()
    Application.pushState(Playing())
    Application.pushState(LevelBuilder())
end
