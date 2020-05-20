local loveWindow = require "love.window"

local display = 1
local desktopWidth, desktopHeight = loveWindow.getDesktopDimensions(display)

local availableDimensions = {
    {
        w = 1920,
        h = 1080
    },
    {
        w = 1600,
        h = 900
    },
    {
        w = 1360,
        h = 768
    },
    {
        w = 1280,
        h = 720
    },
    {
        w = 800,
        h = 600
    }
}

local windowWidth, windowHeight
for i = 1, #availableDimensions do
    local availableDimension = availableDimensions[i]
    if availableDimension.w < desktopWidth and availableDimension.h < desktopHeight then
        windowWidth = availableDimension.w
        windowHeight = availableDimension.h
        break
    end
end

if windowWidth == nil or windowHeight == nil then
    error("your monitor is too small.")
end

function love.conf(t)
    t.version = "11.3"
    t.identity = "flying_rocket"

    t.window.width = windowWidth
    t.window.height = windowHeight
    t.window.msaa = 8
    t.window.display = display
    t.window.resizable = false
end
