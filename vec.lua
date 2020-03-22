local Vec = {}

function Vec:new(x, y)
    self.x = x or 0
    self.y = y or 0
end

function Vec:scale(s)
    self.x = self.x * s
    self.y = self.y * s
end

function Vec.createUnitVectorFromAngle()
    error("missing implementation")
end

local function vector__add(a, b)
    if type(a) == "number" then
        return Vec(b.x + a, b.y + a)
    elseif type(b) == "number" then
        return Vec(a.x + b, a.y + b)
    else
        return Vec(
            a.x + b.x,
            a.y + b.y
        )
    end
end

local function vector__mul(a, b)
    if type(a) == "number" then
        return Vec(b.x * a, b.y * a)
    elseif type(b) == "number" then
        return Vec(a.x * b, a.y * b)
    else
        return Vec(a.x * b.x, a.y * b.y)
    end
end

local function vector__tostring(self)
    return "Vec{x=" .. self.x .. ",y=" .. self.y .. "}" 
end

return setmetatable(Vec, {
    __call = function(_, ...)
        local o = setmetatable({}, {
            __index = Vec, 
            __add = vector__add,
            __mul = vector__mul,
            __tostring = vector__tostring
        })
        o:new(...)
        return o
    end
})
