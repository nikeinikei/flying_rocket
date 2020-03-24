local enum = require "util.enum"
local json = require "libs.json"
local Array = require "util.array"
local Levels = require "levels"

local LevelBuilder = {}

local Modes = enum {
    "TerrainBuilding",
    "RocketStartingLocation",
    "RocketLandingLocation",
    "Inspection"
}

function LevelBuilder:new(name)
    self.name = name
    self.terrainPoints = Array()
    self.rocketStartingLocation = {
        x = -1000, 
        y = -1000,
        w = 200,
        h = 20
    }
    self.rocketLandingLocation = {
        x = -1000, 
        y = -1000,
        w = 200,
        h = 20
    }

    self.mode = Modes.TerrainBuilding
end

function LevelBuilder:mousepressed(mouseX, mouseY, button, istouch, presses)
    if self.mode == Modes.TerrainBuilding and button == 1 then
        self.terrainPoints:push(mouseX, mouseY)
    end
    if self.mode == Modes.RocketStartingLocation and button == 1 then
        self.rocketStartingLocation.x = mouseX
        self.rocketStartingLocation.y = mouseY
        self.mode = Modes.Inspection
    end
    if self.mode == Modes.RocketLandingLocation and button == 1 then
        self.rocketLandingLocation.x = mouseX
        self.rocketLandingLocation.y = mouseY
        self.mode = Modes.Inspection
    end
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
        local level = {
            name = self.name,
            terrainPoints = self.terrainPoints,
            rocketStartingLocation = self.rocketStartingLocation,
            rocketLandingLocation = self.rocketLandingLocation
        }
        Levels.addLevel(level)
        Application.popState()
    end
    if key == "escape" then
        love.event.quit()
    end
end

function LevelBuilder:draw()
    local mouseX, mouseY = love.mouse.getPosition()

    if self.terrainPoints:size() >= 2 then
        if self.mode == Modes.TerrainBuilding then
            self.terrainPoints:push(mouseX, mouseY)
        end

        love.graphics.line(self.terrainPoints:items())

        if self.mode == Modes.TerrainBuilding then
            self.terrainPoints:pop(2)
        end
    end

    local rect = self.rocketStartingLocation
    if self.mode == Modes.RocketStartingLocation then
        love.graphics.rectangle("fill", mouseX, mouseY, rect.w, rect.h)
    else
        love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
    end

    rect = self.rocketLandingLocation
    if self.mode == Modes.RocketLandingLocation then
        love.graphics.rectangle("fill", mouseX, mouseY, rect.w, rect.h)
    else
        love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
    end

    love.graphics.print("mode = " .. self.mode)
end

return setmetatable(LevelBuilder, {
    __call = function(_, ...)
        local o = setmetatable({}, {
            __index = LevelBuilder
        })
        o:new(...)
        return o
    end
})