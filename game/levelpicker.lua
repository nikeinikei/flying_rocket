--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 8,["16"] = 8,["17"] = 8,["19"] = 20,["20"] = 21,["21"] = 22,["22"] = 22,["23"] = 22,["24"] = 22,["25"] = 23,["26"] = 24,["27"] = 25,["28"] = 26,["29"] = 26,["30"] = 26,["31"] = 26,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 26,["36"] = 27,["37"] = 26,["38"] = 26,["39"] = 29,["41"] = 32,["42"] = 33,["43"] = 35,["44"] = 37,["45"] = 37,["46"] = 37,["47"] = 37,["48"] = 37,["49"] = 37,["50"] = 37,["51"] = 37,["52"] = 37,["53"] = 37,["54"] = 37,["55"] = 38,["56"] = 38,["57"] = 38,["58"] = 38,["59"] = 38,["60"] = 38,["61"] = 38,["62"] = 38,["63"] = 38,["64"] = 38,["65"] = 38,["67"] = 19,["68"] = 42,["69"] = 43,["70"] = 44,["72"] = 46,["74"] = 42,["75"] = 50,["76"] = 51,["77"] = 50,["78"] = 54,["79"] = 55,["80"] = 55,["81"] = 55,["82"] = 56,["84"] = 54,["85"] = 60,["86"] = 61,["87"] = 61,["88"] = 61,["89"] = 62,["91"] = 60,["92"] = 66,["93"] = 67,["94"] = 67,["95"] = 67,["96"] = 68,["98"] = 70,["99"] = 71,["101"] = 66,["102"] = 75,["103"] = 76,["104"] = 76,["105"] = 76,["106"] = 77,["108"] = 79,["109"] = 80,["110"] = 81,["112"] = 83,["114"] = 86,["115"] = 87,["117"] = 89,["120"] = 92,["121"] = 93,["123"] = 75,["124"] = 97,["125"] = 98,["126"] = 98,["127"] = 98,["128"] = 99,["130"] = 97,["131"] = 103,["132"] = 104,["133"] = 105,["135"] = 103,["136"] = 109,["137"] = 110,["138"] = 109,["139"] = 113,["140"] = 114,["141"] = 116,["142"] = 118,["143"] = 119,["145"] = 121,["146"] = 122,["147"] = 123,["149"] = 124,["150"] = 124,["151"] = 125,["152"] = 126,["153"] = 127,["154"] = 128,["157"] = 131,["158"] = 132,["159"] = 133,["160"] = 134,["161"] = 135,["162"] = 135,["163"] = 136,["164"] = 136,["165"] = 136,["166"] = 136,["167"] = 136,["168"] = 136,["169"] = 136,["170"] = 136,["171"] = 137,["172"] = 138,["173"] = 138,["174"] = 138,["175"] = 136,["176"] = 135,["177"] = 140,["178"] = 140,["179"] = 140,["180"] = 140,["181"] = 140,["182"] = 140,["183"] = 140,["184"] = 140,["185"] = 141,["186"] = 142,["187"] = 140,["188"] = 135,["189"] = 144,["190"] = 144,["191"] = 144,["192"] = 144,["193"] = 144,["194"] = 144,["195"] = 144,["196"] = 144,["197"] = 145,["198"] = 147,["199"] = 148,["200"] = 148,["201"] = 152,["202"] = 148,["203"] = 156,["204"] = 156,["205"] = 156,["206"] = 156,["207"] = 156,["208"] = 144,["209"] = 135,["210"] = 158,["211"] = 158,["212"] = 158,["213"] = 158,["214"] = 158,["215"] = 158,["216"] = 158,["217"] = 158,["218"] = 159,["219"] = 160,["220"] = 160,["221"] = 160,["222"] = 160,["223"] = 161,["224"] = 160,["225"] = 159,["226"] = 159,["227"] = 158,["228"] = 135,["229"] = 135,["230"] = 124,["233"] = 167,["234"] = 168,["236"] = 170,["238"] = 113,["239"] = 9});
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
    self.pageIndex = 0
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
function LevelPicker.prototype.currentButtons(self)
    if self.buttons == nil then
        return {}
    else
        return self.buttons[self.pageIndex + 1]
    end
end
function LevelPicker.prototype.getObjects(self)
    return {self.levelsNotAvailableTextWrapped, self.importButton, self.backwardButton, self.forwardButton}
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
        if #page > 0 then
            __TS__ArrayPush(buttons, page)
        end
        self.buttons = buttons
    end
end
LevelPicker.pageButtonCount = 6
return ____exports
