--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 8,["16"] = 8,["17"] = 10,["18"] = 10,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 24,["24"] = 12,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 29,["29"] = 29,["30"] = 29,["31"] = 29,["32"] = 30,["33"] = 31,["34"] = 32,["35"] = 33,["36"] = 33,["37"] = 33,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 34,["44"] = 33,["45"] = 33,["46"] = 36,["47"] = 36,["48"] = 36,["49"] = 36,["50"] = 36,["51"] = 36,["52"] = 36,["53"] = 36,["54"] = 37,["55"] = 37,["56"] = 37,["57"] = 37,["58"] = 37,["59"] = 36,["60"] = 36,["61"] = 39,["63"] = 42,["64"] = 43,["65"] = 45,["66"] = 47,["67"] = 47,["68"] = 47,["69"] = 47,["70"] = 47,["71"] = 47,["72"] = 47,["73"] = 47,["74"] = 48,["75"] = 47,["76"] = 47,["77"] = 50,["78"] = 50,["79"] = 50,["80"] = 50,["81"] = 50,["82"] = 50,["83"] = 50,["84"] = 50,["85"] = 51,["86"] = 50,["87"] = 50,["89"] = 24,["90"] = 56,["91"] = 57,["92"] = 56,["93"] = 60,["94"] = 61,["95"] = 60,["96"] = 64,["97"] = 65,["98"] = 66,["100"] = 68,["102"] = 64,["103"] = 72,["104"] = 73,["105"] = 72,["106"] = 82,["107"] = 83,["108"] = 83,["109"] = 83,["110"] = 84,["112"] = 82,["113"] = 88,["114"] = 89,["115"] = 89,["116"] = 89,["117"] = 90,["119"] = 88,["120"] = 94,["121"] = 95,["122"] = 95,["123"] = 95,["124"] = 96,["126"] = 98,["127"] = 99,["129"] = 94,["130"] = 103,["131"] = 104,["132"] = 104,["133"] = 104,["134"] = 105,["136"] = 107,["137"] = 108,["138"] = 109,["140"] = 111,["142"] = 114,["143"] = 115,["145"] = 117,["148"] = 120,["149"] = 121,["151"] = 103,["152"] = 125,["153"] = 126,["154"] = 126,["155"] = 126,["156"] = 127,["158"] = 125,["159"] = 131,["160"] = 132,["161"] = 133,["163"] = 131,["164"] = 137,["165"] = 12,["166"] = 139,["167"] = 140,["168"] = 137,["169"] = 143,["170"] = 144,["171"] = 146,["172"] = 148,["173"] = 149,["175"] = 151,["176"] = 152,["177"] = 153,["179"] = 154,["180"] = 154,["181"] = 155,["182"] = 156,["183"] = 157,["184"] = 158,["187"] = 161,["188"] = 162,["189"] = 163,["190"] = 164,["191"] = 165,["192"] = 165,["193"] = 166,["194"] = 166,["195"] = 166,["196"] = 166,["197"] = 166,["198"] = 166,["199"] = 166,["200"] = 166,["201"] = 167,["202"] = 168,["203"] = 168,["204"] = 168,["205"] = 168,["206"] = 168,["207"] = 168,["208"] = 168,["210"] = 170,["211"] = 170,["212"] = 170,["214"] = 166,["215"] = 165,["216"] = 173,["217"] = 173,["218"] = 173,["219"] = 173,["220"] = 173,["221"] = 173,["222"] = 173,["223"] = 173,["224"] = 174,["225"] = 175,["226"] = 173,["227"] = 165,["228"] = 177,["229"] = 177,["230"] = 177,["231"] = 177,["232"] = 177,["233"] = 177,["234"] = 177,["235"] = 177,["236"] = 178,["237"] = 180,["238"] = 181,["239"] = 181,["240"] = 185,["241"] = 181,["242"] = 189,["243"] = 189,["244"] = 189,["245"] = 189,["246"] = 189,["247"] = 177,["248"] = 165,["249"] = 191,["250"] = 191,["251"] = 191,["252"] = 191,["253"] = 191,["254"] = 191,["255"] = 191,["256"] = 191,["257"] = 192,["258"] = 192,["259"] = 192,["260"] = 191,["261"] = 165,["262"] = 165,["263"] = 154,["266"] = 196,["267"] = 197,["269"] = 199,["271"] = 143,["272"] = 13});
local ____exports = {}
local ____levels = require("fs.levels")
local Levels = ____levels.Levels
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local ____gui = require("gui")
local Button = ____gui.Button
local ____learningSessionController = require("learningSessionController")
local LearningSession = ____learningSessionController.LearningSession
local ____leveleditor = require("leveleditor")
local LevelEditor = ____leveleditor.LevelEditor
local ____playing = require("playing")
local Playing = ____playing.Playing
local ____wrappeddrawable = require("wrappeddrawable")
local WrappedDrawable = ____wrappeddrawable.WrappedDrawable
____exports.LevelPicker = __TS__Class()
local LevelPicker = ____exports.LevelPicker
LevelPicker.name = "LevelPicker"
__TS__ClassExtends(LevelPicker, GameState)
function LevelPicker.prototype.____constructor(self, pageIndex)
    GameState.prototype.____constructor(self)
    print("hello from levelpicker")
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
function LevelPicker.prototype.onActive(self)
    GameState.prototype.onActive(self)
    Levels.save()
    self:createButtons()
end
function LevelPicker.prototype.createButtons(self)
    self.buttons = nil
    local levels = Levels.getLevels()
    if #levels == 0 then
        self.levelsNotAvailableTextWrapped.show = true
    else
        local buttons = {}
        self.levelsNotAvailableTextWrapped.show = false
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
                            if love.keyboard.isDown("lctrl") then
                                Application.pushState(
                                    __TS__New(
                                        Playing,
                                        level,
                                        __TS__New(LearningSession)
                                    )
                                )
                            else
                                Application.pushState(
                                    __TS__New(Playing, level)
                                )
                            end
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
                                love.filesystem.getIdentity()
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
                                __TS__New(LevelEditor, level)
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
