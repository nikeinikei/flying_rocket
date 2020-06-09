--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 9,["16"] = 9,["17"] = 9,["19"] = 22,["20"] = 23,["21"] = 24,["22"] = 24,["23"] = 24,["24"] = 24,["25"] = 25,["26"] = 26,["27"] = 27,["28"] = 28,["29"] = 28,["30"] = 28,["31"] = 28,["32"] = 28,["33"] = 28,["34"] = 28,["35"] = 28,["36"] = 29,["37"] = 28,["38"] = 28,["39"] = 31,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 31,["45"] = 31,["46"] = 31,["47"] = 32,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 32,["52"] = 31,["53"] = 31,["54"] = 34,["56"] = 37,["57"] = 38,["58"] = 40,["59"] = 42,["60"] = 42,["61"] = 42,["62"] = 42,["63"] = 42,["64"] = 42,["65"] = 42,["66"] = 42,["67"] = 43,["68"] = 42,["69"] = 42,["70"] = 45,["71"] = 45,["72"] = 45,["73"] = 45,["74"] = 45,["75"] = 45,["76"] = 45,["77"] = 45,["78"] = 46,["79"] = 45,["80"] = 45,["82"] = 21,["83"] = 51,["84"] = 52,["85"] = 53,["87"] = 55,["89"] = 51,["90"] = 59,["91"] = 60,["92"] = 59,["93"] = 69,["94"] = 70,["95"] = 70,["96"] = 70,["97"] = 71,["99"] = 69,["100"] = 75,["101"] = 76,["102"] = 76,["103"] = 76,["104"] = 77,["106"] = 75,["107"] = 81,["108"] = 82,["109"] = 82,["110"] = 82,["111"] = 83,["113"] = 85,["114"] = 86,["116"] = 81,["117"] = 90,["118"] = 91,["119"] = 91,["120"] = 91,["121"] = 92,["123"] = 94,["124"] = 95,["125"] = 96,["127"] = 98,["129"] = 101,["130"] = 102,["132"] = 104,["135"] = 107,["136"] = 108,["138"] = 90,["139"] = 112,["140"] = 113,["141"] = 113,["142"] = 113,["143"] = 114,["145"] = 112,["146"] = 118,["147"] = 119,["148"] = 120,["150"] = 118,["151"] = 124,["152"] = 125,["153"] = 124,["154"] = 128,["155"] = 129,["156"] = 131,["157"] = 133,["158"] = 134,["160"] = 136,["161"] = 137,["162"] = 138,["164"] = 139,["165"] = 139,["166"] = 140,["167"] = 141,["168"] = 142,["169"] = 143,["172"] = 146,["173"] = 147,["174"] = 148,["175"] = 149,["176"] = 150,["177"] = 150,["178"] = 151,["179"] = 151,["180"] = 151,["181"] = 151,["182"] = 151,["183"] = 151,["184"] = 151,["185"] = 151,["186"] = 152,["187"] = 153,["188"] = 153,["189"] = 153,["190"] = 151,["191"] = 150,["192"] = 155,["193"] = 155,["194"] = 155,["195"] = 155,["196"] = 155,["197"] = 155,["198"] = 155,["199"] = 155,["200"] = 156,["201"] = 157,["202"] = 155,["203"] = 150,["204"] = 159,["205"] = 159,["206"] = 159,["207"] = 159,["208"] = 159,["209"] = 159,["210"] = 159,["211"] = 159,["212"] = 160,["213"] = 162,["214"] = 163,["215"] = 163,["216"] = 167,["217"] = 163,["218"] = 171,["219"] = 171,["220"] = 171,["221"] = 171,["222"] = 171,["223"] = 159,["224"] = 150,["225"] = 173,["226"] = 173,["227"] = 173,["228"] = 173,["229"] = 173,["230"] = 173,["231"] = 173,["232"] = 173,["233"] = 174,["234"] = 175,["235"] = 175,["236"] = 175,["237"] = 175,["238"] = 176,["239"] = 175,["240"] = 174,["241"] = 174,["242"] = 173,["243"] = 150,["244"] = 150,["245"] = 139,["248"] = 182,["249"] = 183,["251"] = 185,["253"] = 128,["254"] = 10});
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
