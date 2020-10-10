--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["4"] = 1,["5"] = 2,["6"] = 4,["7"] = 5,["8"] = 7,["9"] = 8,["10"] = 9,["11"] = 10,["12"] = 11,["13"] = 12,["15"] = 14,["16"] = 15,["18"] = 18,["19"] = 19,["20"] = 20,["21"] = 21,["22"] = 4});
require("love.font")
require("love.window")
love.conf = function(t)
    t.identity = "flying_rocket"
    local desiredWidth = 1400
    local desiredHeight = 800
    local windowWidth, windowHeight = love.window.getDesktopDimensions(1)
    if (desiredWidth >= windowWidth) or (desiredHeight >= windowHeight) then
        t.window.width = 800
        t.window.height = 600
    else
        t.window.width = desiredWidth
        t.window.height = desiredHeight
    end
    t.window.minwidth = 800
    t.window.minheight = 600
    t.window.msaa = 4
    t.window.resizable = true
end
