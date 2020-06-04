--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["8"] = 2,["9"] = 1,["10"] = 5,["11"] = 4,["12"] = 1,["13"] = 9,["14"] = 8});
local ____exports = {}
____exports.Settings = {}
local Settings = ____exports.Settings
do
    local development = false
    function Settings.setDevelopment(val)
        development = true
    end
    function Settings.isDevelopment()
        return development
    end
end
return ____exports
