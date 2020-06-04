local WeakCollection = {}

function WeakCollection:new()
    self.items = setmetatable({}, {
        __mode = "v"
    })
end

function WeakCollection:add(e)
    local i = 1
    while true do
        if self.items[i] == nil then
            self.items[i] = e
            break
        end
        i = i + 1
    end
end

function WeakCollection:forEach(c)
    for k, v in pairs(self.items) do
        c(v)
    end
end

local WeakCollection__mt = {
    __index = WeakCollection,
    __tostring = function(self)
        local flattened = {}
        local i = 1
        for _, v in pairs(self.items) do
            flattened[i] = tostring(v)
            i = i + 1
        end
        return table.concat(flattened, ", ")
    end
}

return setmetatable(WeakCollection, {
    __call = function(_, ...)
        local o = setmetatable({}, WeakCollection__mt)
        o:new(...)
        return o
    end
})