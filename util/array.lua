-- javascript like implementation
local Array = {}

function Array:new(size, generatorOrDefault)
    if size == nil then
        self._items = {}
        self._size = 0
    else
        if generatorOrDefault == nil then
            error("no generator or default provided")
        end
        self._items = {}
        self._size = size
        if type(generatorOrDefault) == "function" then
            local generator = generatorOrDefault
            for i = 1, size do
                self._items[i] = generator(i)
            end
        else
            local default = generatorOrDefault
            for i = 1, size do
                self._items[i] = default
            end
        end
    end
end

function Array:clear()
    for i = self._size, 1, -1 do
        self._items[i] = nil
    end
    self._size = 0
end

function Array:push(e, ...)
    self._size = self._size + 1
    self._items[self._size] = e
    local moreItemsToAdd = { ... }
    if #moreItemsToAdd > 0 then
        for i = self._size + 1, self._size + 1 + #moreItemsToAdd do
            self._items[i] = moreItemsToAdd[i - self._size]
        end
        self._size = self._size + #moreItemsToAdd
    end
end

function Array:pop(n)
    n = n or 1
    if n == 0 then
        return
    end
    if self._size < n then
        error("cannot pop " .. tostring(n) " elements, the size is only " .. tostring(self._size))
    end

    local item = self._items[self._size]
    self._items[self._size] = nil
    self._size = self._size - 1
    return item, self:pop(n - 1)
end

function Array:items()
    return self._items
end

function Array:size()
    return self._size
end

function Array:iter()
    local i = 0
    return function()
        i = i + 1
        if i <= self._size then
            return self._items[i]
        end
    end
end

local function Array__tostring(self)
    return "[" .. table.concat(self._items, ",") .. "]"
end

local function Array__len(self)
    return self._size
end

local function Array__index(self, k, v)
    if type(k) == "number" then
        return self._items[k]
    else
        return Array[k]
    end
end

local Array__mt =  {
    __index = Array__index,
    __tostring = Array__tostring,
    __len = Array__len  --not working in luajit
}

return setmetatable(Array, {
    __call = function(_, ...)
        local o = setmetatable({}, Array__mt)
        o:new(...)
        return o
    end
})