return function(keys)
    local enum = {}
    for i = 1, #keys do
        enum[keys[i]] = keys[i]
    end
    return enum
end
