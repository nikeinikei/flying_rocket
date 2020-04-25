local Gui = require "gui"
local Button = Gui.Button
local TextInput = Gui.TextInput
local LevelBuilder = require "levelbuilder"
local Levels = require "levels"
local LevelPicker = require "levelpicker"

local Menu = {}

local function LevelBuilderButtonCallback(self)
    -- anonymous gamestate
    local width = 1000
    local height = 400
    local x = love.graphics.getWidth() / 2 - width / 2
    local y = love.graphics.getHeight() / 2 - height / 2
    local textInputPrompt = __TS__New(TextInput, x, y, width, height, "level name:", function(name)
        if #name == 0 then
            love.window.showMessageBox("Invalid Level Name", "empty string is not allowed.", "error")
        else
            if Levels.nameUsed(name) then
                love.window.showMessageBox("Invalid Level Name", "level name already in use", "error")
            else
                Application.popState()
                Application.pushState(LevelBuilder(name))
            end
        end
    end)

    Application.pushState(textInputPrompt)
end

local buttonSchemes = {
    { 
        name = "Play", 
        callback = function(self)
            Application.pushState(LevelPicker())
        end
    },
    {
        name = "LevelBuilder", 
        callback = LevelBuilderButtonCallback 
    },
    { 
        name = "Options", 
        callback = function(self)
            love.window.showMessageBox("Not implemented", "Options are currently not available")
        end
    },
    { 
        name = "Exit", 
        callback = love.event.quit
    },
}

local windowHeight = love.graphics.getHeight()

local numberOfButtons = #buttonSchemes
local buttonHeight = 70
local buttonWidth = 400

local startY = 150
local buttonPadding = (windowHeight * 0.70) / #buttonSchemes

function Menu:new()
    local x = love.graphics.getWidth() / 2 - buttonWidth / 2

    self.buttons = {}
    for i = 1, numberOfButtons do
        self.buttons[i] = __TS__New(
            Button,
            x, 
            startY + (i - 1) * buttonPadding, 
            buttonWidth, 
            buttonHeight,
            buttonSchemes[i].name,
            function() buttonSchemes[i].callback(self) end
        )
    end
end

function Menu:getObjects()
    return self.buttons
end

function Menu:keypressed(key)
    if key == "escape" then
        love.event.quit()
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