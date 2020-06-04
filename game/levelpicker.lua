--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 9,["16"] = 9,["17"] = 9,["19"] = 15,["20"] = 16,["21"] = 16,["22"] = 16,["23"] = 16,["24"] = 17,["25"] = 18,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 19,["34"] = 18,["35"] = 18,["36"] = 21,["37"] = 14,["38"] = 24,["39"] = 25,["40"] = 24,["41"] = 28,["42"] = 29,["43"] = 30,["45"] = 28,["46"] = 34,["47"] = 35,["48"] = 36,["50"] = 34,["51"] = 40,["52"] = 41,["53"] = 42,["55"] = 44,["56"] = 45,["58"] = 40,["59"] = 49,["60"] = 50,["61"] = 51,["63"] = 49,["64"] = 55,["65"] = 56,["66"] = 57,["68"] = 55,["69"] = 61,["70"] = 62,["71"] = 63,["73"] = 61,["74"] = 67,["75"] = 68,["76"] = 67,["77"] = 71,["78"] = 72,["79"] = 74,["80"] = 76,["81"] = 77,["83"] = 79,["85"] = 80,["86"] = 80,["87"] = 81,["88"] = 82,["89"] = 83,["90"] = 84,["91"] = 85,["92"] = 85,["93"] = 86,["94"] = 86,["95"] = 86,["96"] = 86,["97"] = 86,["98"] = 86,["99"] = 86,["100"] = 86,["101"] = 87,["102"] = 88,["103"] = 88,["104"] = 88,["105"] = 86,["106"] = 85,["107"] = 90,["108"] = 90,["109"] = 90,["110"] = 90,["111"] = 90,["112"] = 90,["113"] = 90,["114"] = 90,["115"] = 91,["116"] = 92,["117"] = 90,["118"] = 85,["119"] = 94,["120"] = 94,["121"] = 94,["122"] = 94,["123"] = 94,["124"] = 94,["125"] = 94,["126"] = 94,["127"] = 95,["128"] = 97,["129"] = 97,["130"] = 97,["131"] = 97,["132"] = 97,["133"] = 99,["134"] = 99,["135"] = 99,["136"] = 99,["137"] = 99,["138"] = 94,["139"] = 85,["140"] = 105,["141"] = 105,["142"] = 105,["143"] = 105,["144"] = 105,["145"] = 105,["146"] = 105,["147"] = 105,["148"] = 106,["149"] = 106,["150"] = 106,["151"] = 105,["152"] = 85,["153"] = 85,["154"] = 80,["158"] = 71});
local ____exports = {}
local ____gui = require("gui")
local Button = ____gui.Button
local ____levels = require("levels")
local Levels = ____levels.Levels
local ____playing = require("playing")
local Playing = ____playing.Playing
local ____wrappeddrawable = require("wrappeddrawable")
local WrappedDrawable = ____wrappeddrawable.WrappedDrawable
local ____levelbuilder = require("levelbuilder")
local LevelBuilder = ____levelbuilder.LevelBuilder
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
function LevelPicker.prototype.enter(self)
    self:createButtons()
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
                    ),
                    __TS__New(
                        Button,
                        1200,
                        y,
                        200,
                        height,
                        "Edit",
                        function()
                            Application.pushState(
                                __TS__New(LevelBuilder, level)
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
