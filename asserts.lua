--[[
this file contains a lot of convenience functions for assertions
to make the program more robust
]]

---@param v any
---@param t string
local function assertType(v, t)
    assert(type(v) == t)
end

---@param v any
function assertNil(v)
    assertType(v, "nil")
end

---@param v any
function assertNotNil(v)
    assert(v ~= nil)
end

---@param v any
function assertBoolean(v)
    assertType(v, "boolean")
end

---@param v any
function assertString(v)
    assertType(v, "string")
end

---@param v any
function assertNumber(v)
    assertType(v, "number")
end

---@param v any
function assertFunction(v)
    assertType(v, "function")
end

---@param v any
function assertTable(v)
    assertType(v, "table")
end

---@param v any
function assertThread(v)
    assertType(v, "thread")
end

---@param v any
function assertUserdata(v)
    assertType(v, "userdata")
end

---@param v any
function assertNilOrBoolean(v)
    if v ~= nil then
        assertType(v, "boolean")
    end
end

---@param v any
function assertNilOrString(v)
    if v ~= nil then
        assertType(v, "string")
    end
end

---@param v any
function assertNilOrNumber(v)
    if v ~= nil then
        assertType(v, "number")
    end
end

---@param v any
function assertNilOrFunction(v)
    if v ~= nil then
        assertType(v, "function")
    end
end

---@param v any
function assertNilOrTable(v)
    if v ~= nil then
        assertType(v, "table")
    end
end

---@param v any
function assertNilOrThread(v)
    if v ~= nil then
        assertType(v, "thread")
    end
end

---@param v any
function assertNilOrUserdata(v)
    if v ~= nil then
        assertType(v, "userdata")
    end
end

function assertTableHasProperties(t, ...)
    local props = { ... }
    for i = 1, #props do
        local prop = props[i]
        if t[prop] == nil then
            error(t .. " doesn't have prop " .. prop)
        end
    end
end

function assertTableHasPropertiesWithTypes(t, ...)
    local props = { ... }
    for i = 1, #props do
        local prop = props[i]
        if t[prop.key] == nil then
            error(t .. " doesnt have property with name " .. prop.key)
        end
        if type(t[prop.key]) ~= prop.type then
            error("property " .. prop.key " .. is not of type " .. prop.type)
        end
    end
end
