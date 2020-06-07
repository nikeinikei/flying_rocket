--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 9,["16"] = 9,["17"] = 9,["19"] = 15,["20"] = 16,["21"] = 16,["22"] = 16,["23"] = 16,["24"] = 17,["25"] = 18,["26"] = 19,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 20,["31"] = 20,["32"] = 20,["33"] = 20,["34"] = 20,["35"] = 21,["36"] = 20,["37"] = 20,["38"] = 23,["39"] = 14,["40"] = 26,["41"] = 27,["42"] = 26,["43"] = 30,["44"] = 31,["45"] = 32,["47"] = 30,["48"] = 36,["49"] = 37,["50"] = 38,["52"] = 36,["53"] = 42,["54"] = 43,["55"] = 44,["57"] = 46,["58"] = 47,["60"] = 42,["61"] = 51,["62"] = 52,["63"] = 53,["65"] = 51,["66"] = 57,["67"] = 58,["68"] = 59,["70"] = 57,["71"] = 63,["72"] = 64,["73"] = 65,["75"] = 63,["76"] = 69,["77"] = 70,["78"] = 69,["79"] = 73,["80"] = 74,["81"] = 76,["82"] = 78,["83"] = 79,["85"] = 81,["87"] = 82,["88"] = 82,["89"] = 83,["90"] = 84,["91"] = 85,["92"] = 86,["93"] = 87,["94"] = 87,["95"] = 88,["96"] = 88,["97"] = 88,["98"] = 88,["99"] = 88,["100"] = 88,["101"] = 88,["102"] = 88,["103"] = 89,["104"] = 90,["105"] = 90,["106"] = 90,["107"] = 88,["108"] = 87,["109"] = 92,["110"] = 92,["111"] = 92,["112"] = 92,["113"] = 92,["114"] = 92,["115"] = 92,["116"] = 92,["117"] = 93,["118"] = 94,["119"] = 92,["120"] = 87,["121"] = 96,["122"] = 96,["123"] = 96,["124"] = 96,["125"] = 96,["126"] = 96,["127"] = 96,["128"] = 96,["129"] = 97,["130"] = 99,["131"] = 100,["132"] = 100,["133"] = 104,["134"] = 100,["135"] = 108,["136"] = 108,["137"] = 108,["138"] = 108,["139"] = 108,["140"] = 96,["141"] = 87,["142"] = 110,["143"] = 110,["144"] = 110,["145"] = 110,["146"] = 110,["147"] = 110,["148"] = 110,["149"] = 110,["150"] = 111,["151"] = 111,["152"] = 111,["153"] = 111,["154"] = 111,["155"] = 112,["156"] = 111,["157"] = 111,["158"] = 111,["159"] = 110,["160"] = 87,["161"] = 87,["162"] = 82,["166"] = 73});
local ____exports = {}
local ____gui = require("gui")
local Button = ____gui.Button
local ____leveleditor = require("leveleditor")
local LevelEditor = ____leveleditor.LevelEditor
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
    self.levelsNotAvailableTextWrapped.x = 20
    self.levelsNotAvailableTextWrapped.y = 150
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
                                __TS__New(
                                    LevelEditor,
                                    level,
                                    function(_)
                                        Levels.save()
                                    end
                                )
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
