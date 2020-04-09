local Lost = {}

function Lost:new()
    self.text = love.graphics.newText(love.graphics.newFont(40), "You lost")
    self.textX = (love.graphics.getWidth() - self.text:getWidth()) / 2
    self.textY = (love.graphics.getHeight() - self.text:getHeight()) / 2
end

function Lost:keypressed(key)
    if key == "escape" then
        Application.popState()
    end
end 

function Lost:draw()
    love.graphics.draw(self.text, self.textX, self.textY)
end

local Lost__mt = {
    __index = Lost
}

return setmetatable(Lost, {
    __call = function(_, ...)
        local o = setmetatable({}, Lost__mt)
        o:new(...)
        return o
    end
})