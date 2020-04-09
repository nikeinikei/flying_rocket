local utf8 = require "utf8"

local TextInputPrompt = {}

local promptPaddingPercentage = 0.05
local promptHeightPercentage = 0.30
local inputHeightPadding = 0.10
local inputHeightPercentage = 0.45

function TextInputPrompt:new(x, y, w, h, prompt, callback)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.prompt = prompt
    self.callback = callback

    local fontSize = promptHeightPercentage * h
    self.font = love.graphics.newFont(fontSize)
    self.promptText = love.graphics.newText(self.font, prompt)

    local promptTextWidth = self.promptText:getWidth()
    local promptTextHeight = self.promptText:getHeight()

    self.promptTextX = x + (w - promptTextWidth) / 2
    self.promptTextY = y + promptPaddingPercentage * h

    self.inputText = love.graphics.newText(self.font, "")
    self.inputTextScrape = ""
    self.inputTextX = x + w / 2
    self.inputTextY = y + (promptPaddingPercentage + promptHeightPercentage + inputHeightPadding) * h
end

local function recalculatePosition(self)
    local width = self.inputText:getWidth()
    self.inputTextX = self.x + (self.w - width) / 2
end

function TextInputPrompt:keypressed(key, code, isrepeat)
    if key == "backspace" then
        local byteOffset = utf8.offset(self.inputTextScrape, -1)

        if byteOffset then
            self.inputTextScrape = string.sub(self.inputTextScrape, 1, byteOffset - 1)
            self.inputText:set(self.inputTextScrape)
            recalculatePosition(self)
        end
    end
    if key == "return" then
        self.callback(self.inputTextScrape)
    end
end

function TextInputPrompt:textinput(text)
    self.inputTextScrape = self.inputTextScrape .. text
    self.inputText:set(self.inputTextScrape)
    recalculatePosition(self)
end

function TextInputPrompt:draw()
    love.graphics.setColor(160 / 255, 32 / 255, 240 / 255, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.promptText, self.promptTextX, self.promptTextY)
    love.graphics.draw(self.inputText, self.inputTextX, self.inputTextY)
end

local TextInputPrompt__mt = {
    __index = TextInputPrompt
}

return setmetatable(TextInputPrompt, {
    __call = function(_, ...)
        local o = setmetatable({}, TextInputPrompt__mt)
        o:new(...)
        return o
    end
})