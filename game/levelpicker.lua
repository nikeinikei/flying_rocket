--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 10,["16"] = 10,["17"] = 10,["18"] = 22,["19"] = 23,["20"] = 24,["21"] = 25,["22"] = 25,["23"] = 25,["24"] = 25,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 29,["29"] = 29,["30"] = 29,["31"] = 29,["32"] = 29,["33"] = 29,["34"] = 29,["35"] = 29,["36"] = 30,["37"] = 29,["38"] = 29,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 32,["46"] = 32,["47"] = 33,["48"] = 33,["49"] = 33,["50"] = 33,["51"] = 33,["52"] = 32,["53"] = 32,["54"] = 35,["56"] = 38,["57"] = 39,["58"] = 41,["59"] = 43,["60"] = 43,["61"] = 43,["62"] = 43,["63"] = 43,["64"] = 43,["65"] = 43,["66"] = 43,["67"] = 44,["68"] = 43,["69"] = 43,["70"] = 46,["71"] = 46,["72"] = 46,["73"] = 46,["74"] = 46,["75"] = 46,["76"] = 46,["77"] = 46,["78"] = 47,["79"] = 46,["80"] = 46,["82"] = 22,["83"] = 52,["84"] = 53,["85"] = 52,["86"] = 56,["87"] = 57,["88"] = 56,["89"] = 60,["90"] = 61,["91"] = 62,["93"] = 64,["95"] = 60,["96"] = 68,["97"] = 69,["98"] = 68,["99"] = 78,["100"] = 79,["101"] = 79,["102"] = 79,["103"] = 80,["105"] = 78,["106"] = 84,["107"] = 85,["108"] = 85,["109"] = 85,["110"] = 86,["112"] = 84,["113"] = 90,["114"] = 91,["115"] = 91,["116"] = 91,["117"] = 92,["119"] = 94,["120"] = 95,["122"] = 90,["123"] = 99,["124"] = 100,["125"] = 100,["126"] = 100,["127"] = 101,["129"] = 103,["130"] = 104,["131"] = 105,["133"] = 107,["135"] = 110,["136"] = 111,["138"] = 113,["141"] = 116,["142"] = 117,["144"] = 99,["145"] = 121,["146"] = 122,["147"] = 122,["148"] = 122,["149"] = 123,["151"] = 121,["152"] = 127,["153"] = 128,["154"] = 129,["156"] = 127,["157"] = 133,["158"] = 134,["159"] = 133,["160"] = 137,["161"] = 138,["162"] = 140,["163"] = 142,["164"] = 143,["166"] = 145,["167"] = 146,["168"] = 147,["170"] = 148,["171"] = 148,["172"] = 149,["173"] = 150,["174"] = 151,["175"] = 152,["178"] = 155,["179"] = 156,["180"] = 157,["181"] = 158,["182"] = 159,["183"] = 159,["184"] = 160,["185"] = 160,["186"] = 160,["187"] = 160,["188"] = 160,["189"] = 160,["190"] = 160,["191"] = 160,["192"] = 161,["193"] = 161,["194"] = 161,["195"] = 160,["196"] = 159,["197"] = 163,["198"] = 163,["199"] = 163,["200"] = 163,["201"] = 163,["202"] = 163,["203"] = 163,["204"] = 163,["205"] = 164,["206"] = 165,["207"] = 163,["208"] = 159,["209"] = 167,["210"] = 167,["211"] = 167,["212"] = 167,["213"] = 167,["214"] = 167,["215"] = 167,["216"] = 167,["217"] = 168,["218"] = 170,["219"] = 171,["220"] = 171,["221"] = 175,["222"] = 171,["223"] = 179,["224"] = 179,["225"] = 179,["226"] = 179,["227"] = 179,["228"] = 167,["229"] = 159,["230"] = 181,["231"] = 181,["232"] = 181,["233"] = 181,["234"] = 181,["235"] = 181,["236"] = 181,["237"] = 181,["238"] = 182,["239"] = 183,["240"] = 183,["241"] = 183,["242"] = 183,["243"] = 184,["244"] = 183,["245"] = 182,["246"] = 182,["247"] = 181,["248"] = 159,["249"] = 159,["250"] = 148,["253"] = 190,["254"] = 191,["256"] = 193,["258"] = 137,["259"] = 11});
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
function LevelPicker.prototype.____constructor(self, pageIndex)
    self.pageIndex = pageIndex or 0
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
    self.openSaveDirectoryButton = __TS__New(
        Button,
        500,
        20,
        400,
        70,
        "Open save folder",
        function()
            love.system.openURL(
                "file://" .. tostring(
                    love.filesystem.getSaveDirectory()
                )
            )
        end
    )
    self:createButtons()
    do
        local height = 30
        local width = 70
        local y = (love.graphics.getHeight() - height) - 20
        self.backwardButton = __TS__New(
            Button,
            20,
            y,
            width,
            height,
            "<-",
            function()
                self.pageIndex = self.pageIndex - 1
            end
        )
        self.forwardButton = __TS__New(
            Button,
            (love.graphics.getWidth() - width) - 20,
            y,
            width,
            height,
            "->",
            function()
                self.pageIndex = self.pageIndex + 1
            end
        )
    end
end
function LevelPicker.prototype.getName(self)
    return "LevelPicker"
end
function LevelPicker.prototype.serialize(self)
    return {name = "LevelPicker", page = self.pageIndex}
end
function LevelPicker.prototype.currentButtons(self)
    if self.buttons == nil then
        return {}
    else
        return self.buttons[self.pageIndex + 1]
    end
end
function LevelPicker.prototype.getObjects(self)
    return {self.levelsNotAvailableTextWrapped, self.importButton, self.backwardButton, self.forwardButton, self.openSaveDirectoryButton}
end
function LevelPicker.prototype.textinput(self, text)
    for ____, button in ipairs(
        self:currentButtons()
    ) do
        button:textinput(text)
    end
end
function LevelPicker.prototype.mousepressed(self, x, y, mouseButton, istouch, presses)
    for ____, button in ipairs(
        self:currentButtons()
    ) do
        button:mousepressed(x, y, mouseButton, istouch, presses)
    end
end
function LevelPicker.prototype.keypressed(self, key, code, isrepeat)
    for ____, button in ipairs(
        self:currentButtons()
    ) do
        button:keypressed(key, code, isrepeat)
    end
    if key == "escape" then
        Application.popState()
    end
end
function LevelPicker.prototype.update(self, dt)
    for ____, button in ipairs(
        self:currentButtons()
    ) do
        button:update(dt)
    end
    if self.buttons then
        if self.pageIndex == 0 then
            self.backwardButton.disabled = true
        else
            self.backwardButton.disabled = false
        end
        if self.pageIndex == (#self.buttons - 1) then
            self.forwardButton.disabled = true
        else
            self.forwardButton.disabled = false
        end
    else
        self.backwardButton.disabled = true
        self.forwardButton.disabled = true
    end
end
function LevelPicker.prototype.draw(self)
    for ____, button in ipairs(
        self:currentButtons()
    ) do
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
    self.buttons = nil
    local levels = Levels.getLevels()
    if #levels == 0 then
        self.levelsNotAvailableTextWrapped.visible = true
    else
        local buttons = {}
        self.levelsNotAvailableTextWrapped.visible = false
        local page = {}
        do
            local i = 0
            while i < #levels do
                if (i % ____exports.LevelPicker.pageButtonCount) == 0 then
                    if #page > 0 then
                        __TS__ArrayPush(buttons, page)
                        page = {}
                    end
                end
                local level = levels[i + 1]
                local j = i % ____exports.LevelPicker.pageButtonCount
                local y = 120 + (j * 100)
                local height = 70
                __TS__ArrayPush(
                    page,
                    __TS__New(
                        Button,
                        50,
                        y,
                        400,
                        height,
                        levels[i + 1].name,
                        function()
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
        if #page > 0 then
            __TS__ArrayPush(buttons, page)
        end
        self.buttons = buttons
    end
end
LevelPicker.pageButtonCount = 6
return ____exports
