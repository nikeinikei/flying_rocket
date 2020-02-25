---a stack implementation
---@class Stack
local Stack = {}
Stack.__index = Stack

function Stack:new()
    self.items = {}
    self._size = 0
end

---@param i any
function Stack:push(i)
    self._size = self._size + 1
    self.items[self._size] = i
end

---@return any
function Stack:peek()
    return self.items[self._size]
end

---@return boolean
function Stack:empty()
    return self._size == 0
end

---@return any
function Stack:pop()
    if self._size == 0 then
        error("cannot pop off of an empty stack")
    end

    local top = self.items[self._size]
    self.items[self._size] = nil
    self._size = self._size - 1
    return top
end

---@return void
function Stack:clear()
    self.items = {}
    self._size = 0
end

---@return number
function Stack:size()
    return self._size
end

function Stack:__tostring()
    local repr = "Stack{"
    for i = 1, #self.items do
        repr = repr .. tostring(self.items[i])
        if i < #self.items then
            repr = repr .. ", "
        end
    end
    return repr .. "}"
end

return setmetatable(Stack, {
    __call = function(_, ...)
        local self = setmetatable({}, Stack)
        self:new(...)
        return self
    end
})