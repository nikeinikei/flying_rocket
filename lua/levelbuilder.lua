local enum = require "util.enum"
local json = require "libs.json"
local Array = require "util.array"
local Levels = require "levels"
local Button = require "gui.button"

local LevelBuilder = {}

local Modes = enum {
    "TerrainBuilding",
    "RocketStartingLocation",
    "RocketLandingLocation",
    "Inspection"
}

local locationNotSetErrorMessage = [[
Rocket starting location or landing location were not set.
These are mandatory for the level to be saved.
]]

local buttonSchemes = {
    {
        name = "Inspection",
        mode = Modes.Inspection
    },
    {
        name = "Starting location",
        mode = Modes.RocketStartingLocation
    },
    {
        name = "Landing location",
        mode = Modes.RocketLandingLocation
    },
    {
        name = "Terrain",
        mode = Modes.TerrainBuilding
    }
}

function LevelBuilder:new(name)
    self.level = {
        name = name,
        terrainPoints = Array(),
        rocketStartingLocation = {
            x = nil, 
            y = nil,
            w = 200,
            h = 20
        },
        rocketLandingLocation = {
            x = nil, 
            y = nil,
            w = 200,
            h = 20
        }
    }

    do
        local startX = 10
        local buttonHeight = 30
        local buttonWidth = 200
        local buttonPadding = 20
        local distance = buttonWidth + buttonPadding

        self.mode = Modes.Inspection
        self.buttons = Array()
        self.newMode = false
        for i = 1, #buttonSchemes do
            local scheme = buttonSchemes[i]
            local x = startX + (i - 1) * distance
            local y = 0
            local w = buttonWidth
            local h = buttonHeight
            local text = scheme.name
            local callback = function()
                if self.mode ~= scheme.mode then
                    self.mode = scheme.mode
                    self.newMode= true
                end
            end
            self.buttons:push(Button(x, y, w, h, text, callback))
        end
    end
end

function LevelBuilder:update(dt)
    for button in self.buttons:iter() do
        button:update(dt)
    end
end

function LevelBuilder:mousepressed(mouseX, mouseY, button, istouch, presses)
    for button in self.buttons:iter() do
        button:mousepressed(mouseX, mouseY, button, istouch, presses)
    end
    if self.newMode == false then
        if self.mode == Modes.TerrainBuilding and button == 1 then
            self.level.terrainPoints:push(mouseX, mouseY)
        end
        if self.mode == Modes.RocketStartingLocation and button == 1 then
            self.level.rocketStartingLocation.x = mouseX
            self.level.rocketStartingLocation.y = mouseY
            self.mode = Modes.Inspection
        end
        if self.mode == Modes.RocketLandingLocation and button == 1 then
            self.level.rocketLandingLocation.x = mouseX
            self.level.rocketLandingLocation.y = mouseY
            self.mode = Modes.Inspection
        end
    end
    self.newMode = false
end

function LevelBuilder:keypressed(key, code, isrepeat)
    if key == "1" then
        self.mode = Modes.TerrainBuilding
    end
    if key == "2" then
        self.mode = Modes.RocketStartingLocation
    end
    if key == "3" then
        self.mode = Modes.RocketLandingLocation
    end
    if key == "4" then
        self.mode = Modes.Inspection
    end
    if key == "s" then
        if self.level.rocketStartingLocation.x and self.level.rocketStartingLocation.y and self.level.rocketLandingLocation.x and self.level.rocketLandingLocation.y then
            Levels.addLevel(self.level)
            Application.popState()
        else
            love.window.showMessageBox("Unable to save", locationNotSetErrorMessage, "error")
        end
    end
    if key == "escape" then
        love.event.quit()
    end
end

function LevelBuilder:draw()
    local mouseX, mouseY = love.mouse.getPosition()

    if self.level.terrainPoints:size() >= 2 then
        if self.mode == Modes.TerrainBuilding then
            self.level.terrainPoints:push(mouseX, mouseY)
        end

        love.graphics.line(self.level.terrainPoints:items())

        if self.mode == Modes.TerrainBuilding then
            self.level.terrainPoints:pop(2)
        end
    end

    local rect = self.level.rocketStartingLocation
    if self.mode == Modes.RocketStartingLocation then
        love.graphics.rectangle("fill", mouseX, mouseY, rect.w, rect.h)
    else
        if rect.x and rect.y then
            love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
        end
    end

    local rect = self.level.rocketLandingLocation
    if self.mode == Modes.RocketLandingLocation then
        love.graphics.rectangle("fill", mouseX, mouseY, rect.w, rect.h)
    else
        if rect.x and rect.y then
            love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
        end
    end

    for button in self.buttons:iter() do
        button:draw()
    end
end

local LevelBuilder__mt = {
    __index = LevelBuilder
}

return setmetatable(LevelBuilder, {
    __call = function(_, ...)
        local o = setmetatable({}, LevelBuilder__mt)
        o:new(...)
        return o
    end
})