--simple script to create new simple class in lua

local template = [[local CLASS = {}

function CLASS:new()
end

local CLASS__mt = {
    __index = CLASS
}

return setmetatable(CLASS, {
    __call = function(_, ...)
        local o = setmetatable({}, CLASS__mt)
        o:new(...)
        return o
    end
})]]

local className = arg[1]
if className == nil then
    print("usage: createClass <class-name>")
else
    local contents = string.gsub(template, "CLASS", className)
    local fileName = className:lower() .. ".lua"
    local file = io.open(fileName, "w")
    file:write(contents)
    file:close()
end
