-- if a function accepts t as an argument it can be a table
-- if it's s it has to be a sequence

local f = {}

--no operation
f.noop = function() end

--identity function
f.id = function(x) return x end

f.map = function(t, mapper, target)
    target = target or {}

    for k, v in pairs(t) do
        target[k] = mapper(v)
    end

    return target
end

f.filter = function(s, predicate, target)
    target = target or {}

    local j = 1

    for i = 1, #s do
        local element = s[i]
        if predicate(element) then
            target[j] = element
            j = j + 1
        end
    end

    return target
end

return f