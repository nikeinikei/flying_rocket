--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 6,["7"] = 11,["9"] = 11,["10"] = 13,["11"] = 12,["12"] = 11,["13"] = 17,["14"] = 16});
local ____exports = {}
local rxiJsonLibrary = require("libs.json")
____exports.json = {}
local json = ____exports.json
do
    function json.encode(luaTable)
        return rxiJsonLibrary.encode(luaTable)
    end
    function json.decode(json)
        return rxiJsonLibrary.decode(json)
    end
end
return ____exports
