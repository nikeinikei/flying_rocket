local Won = {}

function Won:new()
    self.text = love.graphics.newText(love.graphics.newFont(40), "Congratulations, you won!")
    self.textX = (love.graphics.getWidth() - self.text:getWidth()) / 2
    self.textY = (love.graphics.getHeight() - self.text:getHeight()) / 2
end

function Won:keypressed(key)
    if key == "escape" then
        Application.popState()
    end
end

function Won:draw()
    love.graphics.draw(self.text, self.textX, self.textY)
end

local Won__mt = {
    __index = Won
}

return setmetatable(Won, {
    __call = function(_, ...)
        local o = setmetatable({}, Won__mt)
        o:new(...)
        return o
    end
})