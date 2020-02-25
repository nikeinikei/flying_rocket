local debug = {}

debug.shallowSequenceToString = function(t)
    local sb = {}

    for i = 1, #t do
        table.insert(sb, tostring(t[i]))
    end

    return table.concat(sb, ", ")
end

return debug
