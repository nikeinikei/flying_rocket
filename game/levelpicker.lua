--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 8,["14"] = 8,["15"] = 9,["16"] = 9,["17"] = 11,["18"] = 11,["19"] = 11,["20"] = 11,["21"] = 23,["22"] = 11,["23"] = 25,["24"] = 26,["25"] = 27,["26"] = 27,["27"] = 27,["28"] = 27,["29"] = 28,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 31,["34"] = 31,["35"] = 31,["36"] = 31,["37"] = 31,["38"] = 31,["39"] = 31,["40"] = 32,["41"] = 31,["42"] = 31,["43"] = 34,["44"] = 34,["45"] = 34,["46"] = 34,["47"] = 34,["48"] = 34,["49"] = 34,["50"] = 34,["51"] = 35,["52"] = 35,["53"] = 35,["54"] = 35,["55"] = 35,["56"] = 34,["57"] = 34,["58"] = 37,["60"] = 40,["61"] = 41,["62"] = 43,["63"] = 45,["64"] = 45,["65"] = 45,["66"] = 45,["67"] = 45,["68"] = 45,["69"] = 45,["70"] = 45,["71"] = 46,["72"] = 45,["73"] = 45,["74"] = 48,["75"] = 48,["76"] = 48,["77"] = 48,["78"] = 48,["79"] = 48,["80"] = 48,["81"] = 48,["82"] = 49,["83"] = 48,["84"] = 48,["86"] = 23,["87"] = 54,["88"] = 55,["89"] = 54,["90"] = 58,["91"] = 59,["92"] = 58,["93"] = 62,["94"] = 63,["95"] = 64,["97"] = 66,["99"] = 62,["100"] = 70,["101"] = 71,["102"] = 70,["103"] = 80,["104"] = 81,["105"] = 81,["106"] = 81,["107"] = 82,["109"] = 80,["110"] = 86,["111"] = 87,["112"] = 87,["113"] = 87,["114"] = 88,["116"] = 86,["117"] = 92,["118"] = 93,["119"] = 93,["120"] = 93,["121"] = 94,["123"] = 96,["124"] = 97,["126"] = 92,["127"] = 101,["128"] = 102,["129"] = 102,["130"] = 102,["131"] = 103,["133"] = 105,["134"] = 106,["135"] = 107,["137"] = 109,["139"] = 112,["140"] = 113,["142"] = 115,["145"] = 118,["146"] = 119,["148"] = 101,["149"] = 123,["150"] = 124,["151"] = 124,["152"] = 124,["153"] = 125,["155"] = 123,["156"] = 129,["157"] = 130,["158"] = 131,["160"] = 129,["161"] = 135,["162"] = 11,["163"] = 137,["164"] = 135,["165"] = 140,["166"] = 141,["167"] = 143,["168"] = 145,["169"] = 146,["171"] = 148,["172"] = 149,["173"] = 150,["175"] = 151,["176"] = 151,["177"] = 152,["178"] = 153,["179"] = 154,["180"] = 155,["183"] = 158,["184"] = 159,["185"] = 160,["186"] = 161,["187"] = 162,["188"] = 162,["189"] = 163,["190"] = 163,["191"] = 163,["192"] = 163,["193"] = 163,["194"] = 163,["195"] = 163,["196"] = 163,["197"] = 164,["198"] = 164,["199"] = 164,["200"] = 163,["201"] = 162,["202"] = 166,["203"] = 166,["204"] = 166,["205"] = 166,["206"] = 166,["207"] = 166,["208"] = 166,["209"] = 166,["210"] = 167,["211"] = 168,["212"] = 166,["213"] = 162,["214"] = 170,["215"] = 170,["216"] = 170,["217"] = 170,["218"] = 170,["219"] = 170,["220"] = 170,["221"] = 170,["222"] = 171,["223"] = 173,["224"] = 174,["225"] = 174,["226"] = 178,["227"] = 174,["228"] = 182,["229"] = 182,["230"] = 182,["231"] = 182,["232"] = 182,["233"] = 170,["234"] = 162,["235"] = 184,["236"] = 184,["237"] = 184,["238"] = 184,["239"] = 184,["240"] = 184,["241"] = 184,["242"] = 184,["243"] = 185,["244"] = 186,["245"] = 186,["246"] = 186,["247"] = 186,["248"] = 187,["249"] = 186,["250"] = 185,["251"] = 185,["252"] = 184,["253"] = 162,["254"] = 162,["255"] = 151,["258"] = 193,["259"] = 194,["261"] = 196,["263"] = 140,["264"] = 12});
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
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
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
