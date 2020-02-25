local Terrain = {}

local function createDrawablePointsFromPoints(points)
    local drawable = {}

    for i = 1, #points do
        local point = points[i]
        table.insert(drawable, point.x)
        table.insert(drawable, point.y)
    end

    return drawable
end

-- points are of shape {{x = 0, y = 0}, {x = 0, y = 0}, ... }
function Terrain:new(points)
    self.points = points
    self.drawablePoints = createDrawablePointsFromPoints(points)
end

function Terrain:draw()
    love.graphics.line(self.drawablePoints)
end

return setmetatable(Terrain, {
    __call = function(_, ...)
        local o = setmetatable({}, {
            __index = Terrain
        })
        o:new(...)
        return o
    end
})