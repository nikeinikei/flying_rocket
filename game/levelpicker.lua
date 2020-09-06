--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 8,["16"] = 8,["17"] = 10,["18"] = 10,["19"] = 11,["20"] = 11,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 25,["26"] = 13,["27"] = 27,["28"] = 28,["29"] = 29,["30"] = 29,["31"] = 29,["32"] = 29,["33"] = 30,["34"] = 31,["35"] = 32,["36"] = 33,["37"] = 33,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 34,["45"] = 33,["46"] = 33,["47"] = 36,["48"] = 36,["49"] = 36,["50"] = 36,["51"] = 36,["52"] = 36,["53"] = 36,["54"] = 36,["55"] = 37,["56"] = 37,["57"] = 37,["58"] = 37,["59"] = 37,["60"] = 36,["61"] = 36,["62"] = 39,["64"] = 42,["65"] = 43,["66"] = 45,["67"] = 47,["68"] = 47,["69"] = 47,["70"] = 47,["71"] = 47,["72"] = 47,["73"] = 47,["74"] = 47,["75"] = 48,["76"] = 47,["77"] = 47,["78"] = 50,["79"] = 50,["80"] = 50,["81"] = 50,["82"] = 50,["83"] = 50,["84"] = 50,["85"] = 50,["86"] = 51,["87"] = 50,["88"] = 50,["90"] = 25,["91"] = 56,["92"] = 57,["93"] = 56,["94"] = 60,["95"] = 61,["96"] = 60,["97"] = 64,["98"] = 65,["99"] = 66,["101"] = 68,["103"] = 64,["104"] = 72,["105"] = 73,["106"] = 72,["107"] = 82,["108"] = 83,["109"] = 83,["110"] = 83,["111"] = 84,["113"] = 82,["114"] = 88,["115"] = 89,["116"] = 89,["117"] = 89,["118"] = 90,["120"] = 88,["121"] = 94,["122"] = 95,["123"] = 95,["124"] = 95,["125"] = 96,["127"] = 98,["128"] = 99,["130"] = 94,["131"] = 103,["132"] = 104,["133"] = 104,["134"] = 104,["135"] = 105,["137"] = 107,["138"] = 108,["139"] = 109,["141"] = 111,["143"] = 114,["144"] = 115,["146"] = 117,["149"] = 120,["150"] = 121,["152"] = 103,["153"] = 125,["154"] = 126,["155"] = 126,["156"] = 126,["157"] = 127,["159"] = 125,["160"] = 131,["161"] = 132,["162"] = 133,["164"] = 131,["165"] = 137,["166"] = 13,["167"] = 139,["168"] = 140,["169"] = 137,["170"] = 143,["171"] = 144,["172"] = 146,["173"] = 148,["174"] = 149,["176"] = 151,["177"] = 152,["178"] = 153,["180"] = 154,["181"] = 154,["182"] = 155,["183"] = 156,["184"] = 157,["185"] = 158,["188"] = 161,["189"] = 162,["190"] = 163,["191"] = 164,["192"] = 165,["193"] = 165,["194"] = 166,["195"] = 166,["196"] = 166,["197"] = 166,["198"] = 166,["199"] = 166,["200"] = 166,["201"] = 166,["202"] = 167,["203"] = 168,["204"] = 168,["205"] = 168,["206"] = 169,["207"] = 170,["208"] = 170,["209"] = 170,["211"] = 172,["212"] = 172,["213"] = 172,["215"] = 166,["216"] = 165,["217"] = 175,["218"] = 175,["219"] = 175,["220"] = 175,["221"] = 175,["222"] = 175,["223"] = 175,["224"] = 175,["225"] = 176,["226"] = 177,["227"] = 175,["228"] = 165,["229"] = 179,["230"] = 179,["231"] = 179,["232"] = 179,["233"] = 179,["234"] = 179,["235"] = 179,["236"] = 179,["237"] = 180,["238"] = 182,["239"] = 183,["240"] = 183,["241"] = 187,["242"] = 183,["243"] = 191,["244"] = 191,["245"] = 191,["246"] = 191,["247"] = 191,["248"] = 179,["249"] = 165,["250"] = 193,["251"] = 193,["252"] = 193,["253"] = 193,["254"] = 193,["255"] = 193,["256"] = 193,["257"] = 193,["258"] = 194,["259"] = 194,["260"] = 194,["261"] = 193,["262"] = 165,["263"] = 165,["264"] = 154,["267"] = 198,["268"] = 199,["270"] = 201,["272"] = 143,["273"] = 14});
local ____exports = {}
local ____levels = require("fs.levels")
local Levels = ____levels.Levels
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local ____gui = require("gui")
local Button = ____gui.Button
local ____recordingsession = require("recordingsession")
local RecordingSession = ____recordingsession.RecordingSession
local ____leveleditor = require("leveleditor")
local LevelEditor = ____leveleditor.LevelEditor
local ____playing = require("playing")
local Playing = ____playing.Playing
local ____wrappeddrawable = require("wrappeddrawable")
local WrappedDrawable = ____wrappeddrawable.WrappedDrawable
local ____aiplayingsession = require("aiplayingsession")
local AIPlayingSession = ____aiplayingsession.AIPlayingSession
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
                                    __TS__New(RecordingSession, level)
                                )
                            elseif love.keyboard.isDown("lalt") then
                                Application.pushState(
                                    __TS__New(AIPlayingSession, level)
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
