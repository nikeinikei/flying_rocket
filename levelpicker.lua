local Levels = require "levels"
local f = require "functional"
local Button = require "gui.button"
local Playing = require "playing"

local LevelPicker = {}

function LevelPicker:new()
    self.levels = Levels.getLevels()
    local names = f.map(self.levels, function(level)
        return level.name
    end)
    self.buttons = {}
    local x = 200
    local w = 400
    local h = 70
    local startY = 200
    local padding = 150
    for i = 1, #names do
        local y = startY + (i - 1) * padding
        self.buttons[i] = Button(
            x,
            y,
            w,
            h,
            names[i],
            function() 
                Application.popState()
                Application.pushState(Playing(self.levels[i]))
            end
        )
    end
    if #self.levels == 0 then
        self.noLevelsText = love.graphics.newText(love.graphics.newFont(40), "No Levels available")
    end
end

function LevelPicker:keypressed(key)
    if key == "escape" then
        Application.popState()
    end
end

function LevelPicker:mousepressed(...)
    for i = 1, #self.buttons do
        self.buttons[i]:mousepressed(...)
    end
end

function LevelPicker:update(dt)
    for i = 1, #self.buttons do 
        self.buttons[i]:update(dt)
    end
end

function LevelPicker:draw()
    for i = 1, #self.buttons do
        self.buttons[i]:draw()
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