--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 6,["11"] = 7,["12"] = 8,["13"] = 9,["16"] = 6,["17"] = 14,["18"] = 15,["19"] = 17,["20"] = 17,["21"] = 17,["22"] = 14});
local ____exports = {}
local ____menu = require("menu")
local Menu = ____menu.Menu
local ____settings = require("settings")
local Settings = ____settings.Settings
require("globals")
local function parseArgs(args)
    for ____, arg in ipairs(args) do
        if arg == "--dev" then
            Settings.setDevelopment(true)
        end
    end
end
love.load = function(args)
    parseArgs(args)
    Application.pushState(
        __TS__New(Menu)
    )
end
return ____exports
