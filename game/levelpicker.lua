--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 10,["16"] = 10,["17"] = 10,["18"] = 22,["19"] = 23,["20"] = 24,["21"] = 25,["22"] = 25,["23"] = 25,["24"] = 25,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 29,["29"] = 29,["30"] = 29,["31"] = 29,["32"] = 29,["33"] = 29,["34"] = 29,["35"] = 29,["36"] = 30,["37"] = 29,["38"] = 29,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 32,["46"] = 32,["47"] = 33,["48"] = 33,["49"] = 33,["50"] = 33,["51"] = 33,["52"] = 32,["53"] = 32,["54"] = 35,["56"] = 38,["57"] = 39,["58"] = 41,["59"] = 43,["60"] = 43,["61"] = 43,["62"] = 43,["63"] = 43,["64"] = 43,["65"] = 43,["66"] = 43,["67"] = 44,["68"] = 43,["69"] = 43,["70"] = 46,["71"] = 46,["72"] = 46,["73"] = 46,["74"] = 46,["75"] = 46,["76"] = 46,["77"] = 46,["78"] = 47,["79"] = 46,["80"] = 46,["82"] = 22,["83"] = 51,["84"] = 52,["85"] = 51,["86"] = 55,["87"] = 56,["88"] = 57,["90"] = 59,["92"] = 55,["93"] = 63,["94"] = 64,["95"] = 63,["96"] = 73,["97"] = 74,["98"] = 74,["99"] = 74,["100"] = 75,["102"] = 73,["103"] = 79,["104"] = 80,["105"] = 80,["106"] = 80,["107"] = 81,["109"] = 79,["110"] = 85,["111"] = 86,["112"] = 86,["113"] = 86,["114"] = 87,["116"] = 89,["117"] = 90,["119"] = 85,["120"] = 94,["121"] = 95,["122"] = 95,["123"] = 95,["124"] = 96,["126"] = 98,["127"] = 99,["128"] = 100,["130"] = 102,["132"] = 105,["133"] = 106,["135"] = 108,["138"] = 111,["139"] = 112,["141"] = 94,["142"] = 116,["143"] = 117,["144"] = 117,["145"] = 117,["146"] = 118,["148"] = 116,["149"] = 122,["150"] = 123,["151"] = 124,["153"] = 122,["154"] = 128,["155"] = 129,["156"] = 128,["157"] = 132,["158"] = 133,["159"] = 135,["160"] = 137,["161"] = 138,["163"] = 140,["164"] = 141,["165"] = 142,["167"] = 143,["168"] = 143,["169"] = 144,["170"] = 145,["171"] = 146,["172"] = 147,["175"] = 150,["176"] = 151,["177"] = 152,["178"] = 153,["179"] = 154,["180"] = 154,["181"] = 155,["182"] = 155,["183"] = 155,["184"] = 155,["185"] = 155,["186"] = 155,["187"] = 155,["188"] = 155,["189"] = 156,["190"] = 156,["191"] = 156,["192"] = 155,["193"] = 154,["194"] = 158,["195"] = 158,["196"] = 158,["197"] = 158,["198"] = 158,["199"] = 158,["200"] = 158,["201"] = 158,["202"] = 159,["203"] = 160,["204"] = 158,["205"] = 154,["206"] = 162,["207"] = 162,["208"] = 162,["209"] = 162,["210"] = 162,["211"] = 162,["212"] = 162,["213"] = 162,["214"] = 163,["215"] = 165,["216"] = 166,["217"] = 166,["218"] = 170,["219"] = 166,["220"] = 174,["221"] = 174,["222"] = 174,["223"] = 174,["224"] = 174,["225"] = 162,["226"] = 154,["227"] = 176,["228"] = 176,["229"] = 176,["230"] = 176,["231"] = 176,["232"] = 176,["233"] = 176,["234"] = 176,["235"] = 177,["236"] = 178,["237"] = 178,["238"] = 178,["239"] = 178,["240"] = 179,["241"] = 178,["242"] = 177,["243"] = 177,["244"] = 176,["245"] = 154,["246"] = 154,["247"] = 143,["250"] = 185,["251"] = 186,["253"] = 188,["255"] = 132,["256"] = 11});
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
