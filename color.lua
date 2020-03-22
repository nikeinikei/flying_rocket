local Color = {}

function Color:new(r, g, b, a)
    assertNumber(r)
    assertNumber(g)
    assertNumber(b)
    assertNumber(a)

    self.r = r
    self.g = g
    self.b = b
    self.a = a
end

function Color:unpack()
    return self.r, self.g, self.b, self.a
end

local Color__mt = {
    __index = Color
}

return setmetatable(Color, {
    __call = function(_, ...)
        local o = setmetatable({}, Color__mt)
        o:new(...)
        return o
    end
})