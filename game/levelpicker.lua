--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 8,["14"] = 8,["15"] = 8,["17"] = 14,["18"] = 15,["19"] = 15,["20"] = 15,["21"] = 15,["22"] = 16,["23"] = 17,["24"] = 17,["25"] = 17,["26"] = 17,["27"] = 17,["28"] = 17,["29"] = 17,["30"] = 17,["31"] = 18,["32"] = 17,["33"] = 17,["34"] = 20,["35"] = 13,["36"] = 23,["37"] = 24,["38"] = 23,["39"] = 27,["40"] = 28,["41"] = 29,["43"] = 27,["44"] = 33,["45"] = 34,["46"] = 35,["48"] = 33,["49"] = 39,["50"] = 40,["51"] = 41,["53"] = 43,["54"] = 44,["56"] = 39,["57"] = 48,["58"] = 49,["59"] = 50,["61"] = 48,["62"] = 54,["63"] = 55,["64"] = 56,["66"] = 54,["67"] = 60,["68"] = 61,["69"] = 62,["71"] = 60,["72"] = 66,["73"] = 67,["74"] = 69,["75"] = 71,["76"] = 72,["78"] = 74,["80"] = 75,["81"] = 75,["82"] = 76,["83"] = 77,["84"] = 78,["85"] = 79,["86"] = 80,["87"] = 80,["88"] = 81,["89"] = 81,["90"] = 81,["91"] = 81,["92"] = 81,["93"] = 81,["94"] = 81,["95"] = 81,["96"] = 82,["97"] = 83,["98"] = 83,["99"] = 83,["100"] = 81,["101"] = 80,["102"] = 85,["103"] = 85,["104"] = 85,["105"] = 85,["106"] = 85,["107"] = 85,["108"] = 85,["109"] = 85,["110"] = 86,["111"] = 87,["112"] = 85,["113"] = 80,["114"] = 89,["115"] = 89,["116"] = 89,["117"] = 89,["118"] = 89,["119"] = 89,["120"] = 89,["121"] = 89,["122"] = 90,["123"] = 92,["124"] = 92,["125"] = 92,["126"] = 92,["127"] = 92,["128"] = 94,["129"] = 94,["130"] = 94,["131"] = 94,["132"] = 94,["133"] = 89,["134"] = 80,["135"] = 80,["136"] = 75,["140"] = 66});
local ____exports = {}
local ____gui = require("gui")
local Button = ____gui.Button
local ____levels = require("levels")
local Levels = ____levels.Levels
local ____playing = require("playing")
local Playing = ____playing.Playing
local ____wrappeddrawable = require("wrappeddrawable")
local WrappedDrawable = ____wrappeddrawable.WrappedDrawable
____exports.LevelPicker = __TS__Class()
local LevelPicker = ____exports.LevelPicker
LevelPicker.name = "LevelPicker"
function LevelPicker.prototype.____constructor(self)
    self.buttons = {}
    local levelsNotAvailableText = love.graphics.newText(
        love.graphics.newFont(50),
        "no levels available"
    )
    self.levelsNotAvailableTextWrapped = __TS__New(WrappedDrawable, levelsNotAvailableText)
    self.importButton = __TS__New(
        Button,
        50,
        20,
        400,
        70,
        "Import Level",
        function()
            love.window.showMessageBox("Import level", "to import a level just drop it into this window!", "info")
        end
    )
    self:createButtons()
end
function LevelPicker.prototype.getObjects(self)
    return {self.levelsNotAvailableTextWrapped, self.importButton}
end
function LevelPicker.prototype.textinput(self, text)
    for ____, button in ipairs(self.buttons) do
        button:textinput(text)
    end
end
function LevelPicker.prototype.mousepressed(self, x, y, mouseButton, istouch, presses)
    for ____, button in ipairs(self.buttons) do
        button:mousepressed(x, y, mouseButton, istouch, presses)
    end
end
function LevelPicker.prototype.keypressed(self, key, code, isrepeat)
    for ____, button in ipairs(self.buttons) do
        button:keypressed(key, code, isrepeat)
    end
    if key == "escape" then
        Application.popState()
    end
end
function LevelPicker.prototype.update(self, dt)
    for ____, button in ipairs(self.buttons) do
        button:update(dt)
    end
end
function LevelPicker.prototype.draw(self)
    for ____, button in ipairs(self.buttons) do
        button:draw()
    end
end
function LevelPicker.prototype.filedropped(self, file)
    if Levels.importLevelFromFile(file) then
        self:createButtons()
    end
end
function LevelPicker.prototype.createButtons(self)
    __TS__ArraySetLength(self.buttons, 0)
    local levels = Levels.getLevels()
    if #levels == 0 then
        self.levelsNotAvailableTextWrapped.visible = true
    else
        self.levelsNotAvailableTextWrapped.visible = false
        do
            local i = 0
            while i < #levels do
                local level = levels[i + 1]
                local y = 120 + (i * 100)
                local height = 70
                local index = i
                __TS__ArrayPush(
                    self.buttons,
                    __TS__New(
                        Button,
                        50,
                        y,
                        400,
                        height,
                        levels[i + 1].name,
                        function()
                            Application.popState()
                            Application.pushState(
                                __TS__New(Playing, level)
                            )
                        end
                    ),
                    __TS__New(
                        Button,
                        500,
                        y,
                        150,
                        height,
                        "Delete",
                        function()
                            Levels.removeLevel(level)
                            self:createButtons()
                        end
                    ),
                    __TS__New(
                        Button,
                        700,
                        y,
                        400,
                        height,
                        "Export",
                        function()
                            local fileName = Levels.exportLevel(level)
                            local fullPath = (((((tostring(
                                love.filesystem.getAppdataDirectory()
                            ) .. "/") .. "LOVE") .. "/") .. tostring(
                                love.filesystem.getIdentity(nil)
                            )) .. "/") .. tostring(fileName)
                            love.window.showMessageBox(
                                "Export successful",
                                "successfully exported to " .. tostring(fullPath),
                                "info"
                            )
                        end
                    )
                )
                i = i + 1
            end
        end
    end
end
return ____exports
