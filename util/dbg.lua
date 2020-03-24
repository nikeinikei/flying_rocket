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

debug.printShallowTable = function(t)
    local c = {}

    for k, v in pairs(t) do
        table.insert(c, tostring(k) .. " = " .. tostring(v))
    end

    print("{" .. table.concat(c, ", ") .. "}")
end

return debug
