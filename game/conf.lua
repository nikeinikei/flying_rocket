--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 4,["5"] = 6,["6"] = 8,["7"] = 9,["8"] = 11,["9"] = 34,["10"] = 35,["11"] = 36,["12"] = 37,["13"] = 38,["14"] = 39,["18"] = 44,["19"] = 45,["21"] = 48,["22"] = 49,["23"] = 50,["24"] = 52,["25"] = 53,["26"] = 54,["27"] = 55,["28"] = 56,["29"] = 57,["30"] = 48});
require("love.font")
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
    t.window.title = "Flying Rocket"
    t.window.height = windowHeight
    t.window.msaa = 8
    t.window.display = display
    t.window.resizable = false
end
