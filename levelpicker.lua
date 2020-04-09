local Levels = require "levels"
local f = require "util.functional"
local Button = require "gui.button"
local Playing = require "playing"
local Array = require "util.array"

local LevelPicker = {}

local 
    LevelPicker__createButtons

function LevelPicker__createButtons(self)
    self.buttons:clear()
    local names = f.map(self.levels, function(level)
        return level.name
    end)
    self.buttons = Array()
    local x = 200
    local w = 400
    local h = 70
    local startY = 200
    local padding = 150
    for i = 1, #names do
        local y = startY + (i - 1) * padding
        self.buttons:push(Button(
            x,
            y,
            w,
            h,
            names[i],
            function() 
                Application.popState()
                Application.pushState(Playing(self.levels[i]))
            end)
        )
        self.buttons:push(Button(
            x + w + 10,
            y,
            300,
            h,
            "Delete",
            function()
                Levels.removeLevel(i)
                LevelPicker__createButtons(self)
            end)
        )
    end
    if #self.levels == 0 then
        self.noLevelsText = love.graphics.newText(love.graphics.newFont(40), "No Levels available")
    end
end

function LevelPicker:new()
    self.levels = Levels.getLevels()
    self.buttons = Array()
    LevelPicker__createButtons(self)
end

function LevelPicker:keypressed(key)
    if key == "escape" then
        Application.popState()
    end
end

function LevelPicker:mousepressed(...)
    for button in self.buttons:iter() do
        button:mousepressed(...)
    end
end

function LevelPicker:update(dt)
    for button in self.buttons:iter() do 
        button:update(dt)
    end
end

function LevelPicker:draw()
    for button in self.buttons:iter() do
        button:draw()
    end
    if self.noLevelsText then
        love.graphics.draw(self.noLevelsText, 200, 200)
    end
end

local LevelPicker__mt = {
    __index = LevelPicker
}

return setmetatable(LevelPicker, {
    __call = function(_, ...)
        local o = setmetatable({}, LevelPicker__mt)
        o:new(...)
        return o
    end
})