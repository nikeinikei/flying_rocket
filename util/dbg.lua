local debug = {}

debug.shallowSequenceToString = function(t)
    local sb = {}

    for i = 1, #t do
        table.insert(sb, tostring(t[i]))
    end

    return "[" .. table.concat(sb, ", ") .. "]"
end

debug.printShallowSequence = function(t)
    print(debug.shallowSequenceToString(t))
end

debug.shallowTableToString = function(t)
    local c = {}

    for k, v in pairs(t) do
        table.insert(c, tostring(k) .. " = " .. tostring(v))
    end

    return "{" .. table.concat(c, ", ") .. "}"
end

debug.printShallowTable = function(t)
    print(debug.shallowTableToString(t))
end

return debug
