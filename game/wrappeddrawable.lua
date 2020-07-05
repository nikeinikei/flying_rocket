--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 3,["8"] = 18,["9"] = 19,["10"] = 20,["11"] = 18,["12"] = 23,["13"] = 24,["14"] = 25,["15"] = 26,["17"] = 26,["18"] = 26,["19"] = 26,["21"] = 28,["23"] = 30,["25"] = 23});
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
        if self.color then
            love.graphics.setColor(
                {
                    self.color:unpacked()
                }
            )
        else
            love.graphics.setColor(1, 1, 1, 1)
        end
        love.graphics.draw(self.drawable, self.x, self.y, self.r, self.sx, self.sy, self.ox, self.oy, self.kx, self.ky)
    end
end
return ____exports
