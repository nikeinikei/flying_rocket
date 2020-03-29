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
    self.level = {
        name = name,
        terrainPoints = Array(),
        rocketStartingLocation = {
            x = -1000, 
            y = -1000,
            w = 200,
            h = 20
        },
        rocketLandingLocation = {
            x = -1000, 
            y = -1000,
            w = 200,
            h = 20
        }
    }

    self.mode = Modes.Inspection
end

function LevelBuilder:mousepressed(mouseX, mouseY, button, istouch, presses)
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
        Levels.addLevel(self.level)
        Application.popState()
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
        love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
    end

    local rect = self.level.rocketLandingLocation
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