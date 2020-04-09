local Clock = {}

function Clock:new()
    self.startTime = love.timer.getTime()
    self.pauseTime = nil
end

function Clock:pause()
    self.pauseTime = love.timer.getTime()
end

function Clock:resume()
    local elapsed = self:getElapsed()
    self.startTime = love.timer.getTime() - elapsed
    self.pauseTime = nil
end

function Clock:getElapsed()
    if self.pauseTime then
        return self.pauseTime - self.startTime
    else
        return love.timer.getTime() - self.startTime
    end
end

function Clock:restart()
    local elapsed = self:getElapsed()
    self.startTime = love.timer.getTime()
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