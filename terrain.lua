local Terrain = {}

function Terrain:new()
    
end

return setmetatable(Terrain, {
    __call = function(_, ...)
        local o = setmetatable({}, {
            __index = Terrain
        })
        o:new()
        return o
    end
})