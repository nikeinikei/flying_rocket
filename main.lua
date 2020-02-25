local Playing = require "playing"
require "asserts"
require "application"

function love.load()
    Application.pushState(Playing())
end
