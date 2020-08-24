--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 8,["16"] = 8,["17"] = 10,["18"] = 10,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 24,["24"] = 12,["25"] = 26,["26"] = 27,["27"] = 28,["28"] = 28,["29"] = 28,["30"] = 28,["31"] = 29,["32"] = 30,["33"] = 31,["34"] = 32,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 32,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 33,["43"] = 32,["44"] = 32,["45"] = 35,["46"] = 35,["47"] = 35,["48"] = 35,["49"] = 35,["50"] = 35,["51"] = 35,["52"] = 35,["53"] = 36,["54"] = 36,["55"] = 36,["56"] = 36,["57"] = 36,["58"] = 35,["59"] = 35,["60"] = 38,["62"] = 41,["63"] = 42,["64"] = 44,["65"] = 46,["66"] = 46,["67"] = 46,["68"] = 46,["69"] = 46,["70"] = 46,["71"] = 46,["72"] = 46,["73"] = 47,["74"] = 46,["75"] = 46,["76"] = 49,["77"] = 49,["78"] = 49,["79"] = 49,["80"] = 49,["81"] = 49,["82"] = 49,["83"] = 49,["84"] = 50,["85"] = 49,["86"] = 49,["88"] = 24,["89"] = 55,["90"] = 56,["91"] = 55,["92"] = 59,["93"] = 60,["94"] = 59,["95"] = 63,["96"] = 64,["97"] = 65,["99"] = 67,["101"] = 63,["102"] = 71,["103"] = 72,["104"] = 71,["105"] = 81,["106"] = 82,["107"] = 82,["108"] = 82,["109"] = 83,["111"] = 81,["112"] = 87,["113"] = 88,["114"] = 88,["115"] = 88,["116"] = 89,["118"] = 87,["119"] = 93,["120"] = 94,["121"] = 94,["122"] = 94,["123"] = 95,["125"] = 97,["126"] = 98,["128"] = 93,["129"] = 102,["130"] = 103,["131"] = 103,["132"] = 103,["133"] = 104,["135"] = 106,["136"] = 107,["137"] = 108,["139"] = 110,["141"] = 113,["142"] = 114,["144"] = 116,["147"] = 119,["148"] = 120,["150"] = 102,["151"] = 124,["152"] = 125,["153"] = 125,["154"] = 125,["155"] = 126,["157"] = 124,["158"] = 130,["159"] = 131,["160"] = 132,["162"] = 130,["163"] = 136,["164"] = 12,["165"] = 138,["166"] = 139,["167"] = 136,["168"] = 142,["169"] = 143,["170"] = 145,["171"] = 147,["172"] = 148,["174"] = 150,["175"] = 151,["176"] = 152,["178"] = 153,["179"] = 153,["180"] = 154,["181"] = 155,["182"] = 156,["183"] = 157,["186"] = 160,["187"] = 161,["188"] = 162,["189"] = 163,["190"] = 164,["191"] = 164,["192"] = 165,["193"] = 165,["194"] = 165,["195"] = 165,["196"] = 165,["197"] = 165,["198"] = 165,["199"] = 165,["200"] = 166,["201"] = 167,["202"] = 167,["203"] = 167,["204"] = 167,["205"] = 167,["206"] = 167,["207"] = 167,["209"] = 169,["210"] = 169,["211"] = 169,["213"] = 165,["214"] = 164,["215"] = 172,["216"] = 172,["217"] = 172,["218"] = 172,["219"] = 172,["220"] = 172,["221"] = 172,["222"] = 172,["223"] = 173,["224"] = 174,["225"] = 172,["226"] = 164,["227"] = 176,["228"] = 176,["229"] = 176,["230"] = 176,["231"] = 176,["232"] = 176,["233"] = 176,["234"] = 176,["235"] = 177,["236"] = 179,["237"] = 180,["238"] = 180,["239"] = 184,["240"] = 180,["241"] = 188,["242"] = 188,["243"] = 188,["244"] = 188,["245"] = 188,["246"] = 176,["247"] = 164,["248"] = 190,["249"] = 190,["250"] = 190,["251"] = 190,["252"] = 190,["253"] = 190,["254"] = 190,["255"] = 190,["256"] = 191,["257"] = 191,["258"] = 191,["259"] = 190,["260"] = 164,["261"] = 164,["262"] = 153,["265"] = 195,["266"] = 196,["268"] = 198,["270"] = 142,["271"] = 13});
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
