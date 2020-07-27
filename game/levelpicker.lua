--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 9,["16"] = 9,["17"] = 11,["18"] = 11,["19"] = 11,["20"] = 11,["21"] = 23,["22"] = 11,["23"] = 25,["24"] = 26,["25"] = 27,["26"] = 28,["27"] = 28,["28"] = 28,["29"] = 28,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 32,["34"] = 32,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 32,["39"] = 32,["40"] = 32,["41"] = 33,["42"] = 32,["43"] = 32,["44"] = 35,["45"] = 35,["46"] = 35,["47"] = 35,["48"] = 35,["49"] = 35,["50"] = 35,["51"] = 35,["52"] = 36,["53"] = 36,["54"] = 36,["55"] = 36,["56"] = 36,["57"] = 35,["58"] = 35,["59"] = 38,["61"] = 41,["62"] = 42,["63"] = 44,["64"] = 46,["65"] = 46,["66"] = 46,["67"] = 46,["68"] = 46,["69"] = 46,["70"] = 46,["71"] = 46,["72"] = 47,["73"] = 46,["74"] = 46,["75"] = 49,["76"] = 49,["77"] = 49,["78"] = 49,["79"] = 49,["80"] = 49,["81"] = 49,["82"] = 49,["83"] = 50,["84"] = 49,["85"] = 49,["87"] = 23,["88"] = 55,["89"] = 56,["90"] = 55,["91"] = 59,["92"] = 60,["93"] = 59,["94"] = 63,["95"] = 64,["96"] = 65,["98"] = 67,["100"] = 63,["101"] = 71,["102"] = 72,["103"] = 71,["104"] = 81,["105"] = 82,["106"] = 82,["107"] = 82,["108"] = 83,["110"] = 81,["111"] = 87,["112"] = 88,["113"] = 88,["114"] = 88,["115"] = 89,["117"] = 87,["118"] = 93,["119"] = 94,["120"] = 94,["121"] = 94,["122"] = 95,["124"] = 97,["125"] = 98,["127"] = 93,["128"] = 102,["129"] = 103,["130"] = 103,["131"] = 103,["132"] = 104,["134"] = 106,["135"] = 107,["136"] = 108,["138"] = 110,["140"] = 113,["141"] = 114,["143"] = 116,["146"] = 119,["147"] = 120,["149"] = 102,["150"] = 124,["151"] = 125,["152"] = 125,["153"] = 125,["154"] = 126,["156"] = 124,["157"] = 130,["158"] = 131,["159"] = 132,["161"] = 130,["162"] = 136,["163"] = 11,["164"] = 138,["165"] = 139,["166"] = 136,["167"] = 142,["168"] = 143,["169"] = 145,["170"] = 147,["171"] = 148,["173"] = 150,["174"] = 151,["175"] = 152,["177"] = 153,["178"] = 153,["179"] = 154,["180"] = 155,["181"] = 156,["182"] = 157,["185"] = 160,["186"] = 161,["187"] = 162,["188"] = 163,["189"] = 164,["190"] = 164,["191"] = 165,["192"] = 165,["193"] = 165,["194"] = 165,["195"] = 165,["196"] = 165,["197"] = 165,["198"] = 165,["199"] = 166,["200"] = 166,["201"] = 166,["202"] = 165,["203"] = 164,["204"] = 168,["205"] = 168,["206"] = 168,["207"] = 168,["208"] = 168,["209"] = 168,["210"] = 168,["211"] = 168,["212"] = 169,["213"] = 170,["214"] = 168,["215"] = 164,["216"] = 172,["217"] = 172,["218"] = 172,["219"] = 172,["220"] = 172,["221"] = 172,["222"] = 172,["223"] = 172,["224"] = 173,["225"] = 175,["226"] = 176,["227"] = 176,["228"] = 180,["229"] = 176,["230"] = 184,["231"] = 184,["232"] = 184,["233"] = 184,["234"] = 184,["235"] = 172,["236"] = 164,["237"] = 186,["238"] = 186,["239"] = 186,["240"] = 186,["241"] = 186,["242"] = 186,["243"] = 186,["244"] = 186,["245"] = 187,["246"] = 187,["247"] = 187,["248"] = 186,["249"] = 164,["250"] = 164,["251"] = 153,["254"] = 191,["255"] = 192,["257"] = 194,["259"] = 142,["260"] = 12});
local ____exports = {}
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local ____gui = require("gui")
local Button = ____gui.Button
local ____leveleditor = require("leveleditor")
local LevelEditor = ____leveleditor.LevelEditor
local ____levels = require("fs.levels")
local Levels = ____levels.Levels
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
