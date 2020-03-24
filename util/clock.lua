local Clock = {}

function Clock:new()
    self.startTime = love.timer.getTime()
end

function Clock:getElapsed()
    return love.timer.getTime() - self.startTime
end

function Clock:restart()
    local newTime = love.timer.getTime()
    local elapsed = newTime - self.startTime
    self.startTime = newTime
    return elapsed
end

local Clock__mt = {
    __index = Clock
}

return setmetatable(Clock, {
    __call = function(_, ...)
        local o = setmetatable({}, Clock__mt)
        o:new(...)
        return o
    end
})