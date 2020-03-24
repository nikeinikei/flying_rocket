require "globals"

local Playing = require "playing"
local LevelBuilder = require "levelbuilder"
local Menu = require "menu"

function love.load()
    Application.pushState(Menu())
end
