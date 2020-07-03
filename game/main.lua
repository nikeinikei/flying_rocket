--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 1,["12"] = 2,["13"] = 8,["14"] = 9,["15"] = 10,["16"] = 11,["19"] = 8,["20"] = 16,["21"] = 17,["22"] = 19,["23"] = 21,["24"] = 21,["25"] = 21,["26"] = 16});
local ____exports = {}
local ____campaignLevels = require("campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
local ____menu = require("menu")
local Menu = ____menu.Menu
local ____settings = require("settings")
local Settings = ____settings.Settings
require("globals")
require("customerrorhandler")
local function parseArgs(args)
    for ____, arg in ipairs(args) do
        if arg == "--dev" then
            Settings.setDevelopment(true)
        end
    end
end
love.load = function(args)
    parseArgs(args)
    CampaignLevels.init()
    Application.pushState(
        __TS__New(Menu)
    )
end
return ____exports
