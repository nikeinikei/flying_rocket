--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 3,["6"] = 4,["7"] = 6,["8"] = 29,["9"] = 30,["10"] = 31,["11"] = 32,["12"] = 33,["13"] = 34,["17"] = 39,["18"] = 40,["20"] = 43,["21"] = 44,["22"] = 45,["23"] = 47,["24"] = 48,["25"] = 49,["26"] = 50,["27"] = 51,["28"] = 43});
loveWindow = require("love.window")
display = 1
desktopWidth, desktopHeight = loveWindow.getDesktopDimensions(display)
availableDimensions = {{w = 1920, h = 1080}, {w = 1600, h = 900}, {w = 1360, h = 768}, {w = 1280, h = 720}, {w = 800, h = 600}}
windowWidth = 0
windowHeight = 0
for ____, availableDimension in ipairs(availableDimensions) do
    if (availableDimension.w < desktopWidth) and (availableDimension.h < desktopHeight) then
        windowWidth = availableDimension.w
        windowHeight = availableDimension.h
        break
    end
end
if (windowWidth == 0) and (windowHeight == 0) then
    error("your monitor is too small")
end
love.conf = function(t)
    t.version = "11.3"
    t.identity = "flying_rocket"
    t.window.width = windowWidth
    t.window.height = windowHeight
    t.window.msaa = 8
    t.window.display = display
    t.window.resizable = false
end
