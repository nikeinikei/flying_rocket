--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["7"] = 3,["9"] = 4,["10"] = 3,["11"] = 7,["12"] = 6,["13"] = 3,["14"] = 11,["15"] = 10,["16"] = 3,["17"] = 15,["18"] = 14,["19"] = 3,["20"] = 19,["21"] = 18});
local ____exports = {}
local web = love.system.getOS() == "Web"
____exports.Settings = {}
local Settings = ____exports.Settings
do
    local development = false
    function Settings.setDevelopment(val)
        development = val
    end
    function Settings.isDevelopment()
        return development
    end
    function Settings.getRestartFilePath()
        return "restart.json"
    end
    function Settings.isWeb()
        return web
    end
end
return ____exports
