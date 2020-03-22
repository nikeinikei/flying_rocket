local Button = require "gui.button"
local TextInputPrompt = require "gui.textinputprompt"
local LevelBuilder = require "levelbuilder"

local Menu = {}

local function LevelBuilderButtonCallback(self)
    -- anonymous gamestate
    local width = 1000
    local height = 400
    local x = love.graphics.getWidth() / 2 - width / 2
    local y = love.graphics.getHeight() / 2 - height / 2
    local textInputPrompt = TextInputPrompt(x, y, width, height, "level name:", function(name)
        Application.popState()
        Application.pushState(LevelBuilder(name))
    end)

    Application.pushState(textInputPrompt)
end

local buttonSchemes = {
    { 
        name = "Play", 
        callback = function(self) end
    },
    {
        name = "LevelBuilder", 
        callback = LevelBuilderButtonCallback 
    },
    { 
        name = "Options", 
        callback = function(self) end
    },
    { 
        name = "Exit", 
        callback = love.event.quit
    },
}

local numberOfButtons = #buttonSchemes
local buttonHeight = 70
local buttonWidth = 400

local startY = 200
local buttonPadding = 150

function Menu:new()
    local x = love.graphics.getWidth() / 2 - buttonWidth / 2

    self.buttons = {}
    for i = 1, numberOfButtons do
        self.buttons[i] = Button(
            x, 
            startY + (i - 1) * buttonPadding, 
            buttonWidth, 
            buttonHeight,
            buttonSchemes[i].name,
            function() buttonSchemes[i].callback(self) end
        )
    end
end

function Menu:mousepressed(...)
    for i = 1, #self.buttons do
        self.buttons[i]:mousepressed(...)
    end
end

function Menu:update(dt)
    for i = 1, #self.buttons do
        self.buttons[i]:update(dt)
    end
end

function Menu:draw()
    for i = 1, #self.buttons do
        self.buttons[i]:draw()
    end
end

local Menu__mt = {
    __index = Menu
}

return setmetatable(Menu, {
    __call = function(_, ...)
        local o = setmetatable({}, Menu__mt)
        o:new(...)
        return o
    end
})