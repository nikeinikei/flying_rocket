--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 7,["9"] = 8,["10"] = 9,["11"] = 10,["12"] = 11,["13"] = 7,["14"] = 17,["15"] = 18,["16"] = 17});
local ____exports = {}
____exports.Color = __TS__Class()
local Color = ____exports.Color
Color.name = "Color"
function Color.prototype.____constructor(self, r, g, b, a)
    self.r = r
    self.g = g
    self.b = b
    self.a = a
end
function Color.prototype.unpacked(self)
    return self.r, self.g, self.b, self.a
end
return ____exports
