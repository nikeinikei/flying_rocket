local Color = require "color"

local Button = {}

function Button:new(x, y, w, h, text, callback)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.callback = callback
    self.hovered = false
    self.baseColor = Color(1, 0, 1, 1)
    self.hoveredColor = Color(0.933, 0.51, 0.933, 1)
    self.font = love.graphics.newFont(h / 1.5)
    self.text = love.graphics.newText(self.font, text)
    self.textX = x + (w - self.text:getWidth()) / 2
    self.textY = y + (h - self.text:getHeight()) / 2
end

function Button:mousepressed()
    if self.hovered then
        if self.callback then
            self.callback()
        end
        return true
    else
        return false
    end
end

function Button:update(dt)
    local x, y = love.mouse.getPosition()

    if self.x <= x and x <= self.x + self.w and self.y <= y and y <= self.y + self.h then
        self.hovered = true
    else
        self.hovered = false
    end
end

function Button:draw()
    if self.hovered then
        love.graphics.setColor(self.hoveredColor:unpack())
    else
        love.graphics.setColor(self.baseColor:unpack())
    end

    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.text, self.textX, self.textY)
end

local Button__mt = {
    __index = Button
}

return setmetatable(Button, {
    __call = function(_, ...)
        local o = setmetatable({}, Button__mt)
        o:new(...)
        return o
    end
})