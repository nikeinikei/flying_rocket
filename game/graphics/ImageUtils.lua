--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["8"] = 1,["9"] = 3,["10"] = 4,["11"] = 5,["12"] = 6,["13"] = 6,["14"] = 7,["15"] = 6,["16"] = 6,["17"] = 9,["18"] = 9,["19"] = 9,["20"] = 2});
local ____exports = {}
____exports.ImageUtils = {}
local ImageUtils = ____exports.ImageUtils
do
    function ImageUtils.scaleImageToDimensions(image, desiredWidth, desiredHeight)
        local canvas = love.graphics.newCanvas(desiredWidth, desiredHeight)
        local imageWidth, imageHeight = image:getDimensions()
        local sx, sy = desiredWidth / imageWidth, desiredHeight / imageHeight
        canvas:renderTo(
            function()
                love.graphics.draw(image, 0, 0, 0, sx, sy)
            end
        )
        return love.graphics.newImage(
            canvas:newImageData()
        )
    end
end
return ____exports
