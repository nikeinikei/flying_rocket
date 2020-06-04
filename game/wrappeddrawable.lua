--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 15,["9"] = 16,["10"] = 17,["11"] = 15,["12"] = 20,["13"] = 21,["14"] = 22,["16"] = 20});
local ____exports = {}
____exports.WrappedDrawable = __TS__Class()
local WrappedDrawable = ____exports.WrappedDrawable
WrappedDrawable.name = "WrappedDrawable"
function WrappedDrawable.prototype.____constructor(self, drawable)
    self.drawable = drawable
    self.visible = true
end
function WrappedDrawable.prototype.draw(self)
    if self.visible then
        love.graphics.draw(self.drawable, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
    end
end
return ____exports
