local debugPrint = {}

local lines = 0
local height = 15

debugPrint.reset = function()
    lines = 0
end

debugPrint.print = function(msg)
    local y = lines * height
    lines = lines + 1
    love.graphics.print(msg, 0, y)
end

return debugPrint