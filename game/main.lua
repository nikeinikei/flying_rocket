--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 4,["6"] = 4,["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 1,["14"] = 2,["15"] = 9,["16"] = 10,["17"] = 11,["18"] = 12,["21"] = 9,["22"] = 17,["23"] = 18,["24"] = 20,["25"] = 22,["26"] = 23,["27"] = 24,["28"] = 25,["31"] = 28,["32"] = 28,["33"] = 28,["35"] = 17});
local ____exports = {}
local ____recreateApplication = require("debug.recreateApplication")
local RecreateApplication = ____recreateApplication.RecreateApplication
local ____campaignLevels = require("fs.campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
local ____menu = require("menu")
local Menu = ____menu.Menu
local ____settings = require("settings")
local Settings = ____settings.Settings
require("application")
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
    local states = RecreateApplication.attempt()
    if states then
        for ____, state in ipairs(states) do
            Application.pushState(state)
        end
    else
        Application.pushState(
            __TS__New(Menu)
        )
    end
end
return ____exports
