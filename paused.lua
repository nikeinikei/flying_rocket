local Paused = {}

function Paused:new(playing, onUnpaused)
    self.playing = playing
    self.onUnpaused = onUnpaused
end

local function Paused_resume(self)
    Application.popState()
    if self.onUnpaused then
        self.onUnpaused()
    end
end

function Paused:keypressed(key)
    if key == "escape" then 
        Paused_resume(self)
    end
end

function Paused:draw()
    love.graphics.setColor(1, 1, 1, 1)
    self.playing:draw()
    local grey = 0.8
    love.graphics.setColor(grey, grey, grey, grey)
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

local Paused__mt = {
    __index = Paused
}

return setmetatable(Paused, {
    __call = function(_, ...)
        local o = setmetatable({}, Paused__mt)
        o:new(...)
        return o
    end
})