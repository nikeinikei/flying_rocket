--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 8,["16"] = 8,["17"] = 9,["18"] = 9,["19"] = 10,["20"] = 10,["21"] = 12,["22"] = 12,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 28,["28"] = 14,["29"] = 26,["30"] = 30,["31"] = 31,["32"] = 32,["33"] = 32,["34"] = 32,["35"] = 32,["36"] = 33,["37"] = 34,["38"] = 35,["39"] = 36,["40"] = 36,["41"] = 36,["42"] = 36,["43"] = 36,["44"] = 36,["45"] = 36,["46"] = 36,["47"] = 37,["48"] = 36,["49"] = 36,["50"] = 39,["51"] = 39,["52"] = 39,["53"] = 39,["54"] = 39,["55"] = 39,["56"] = 39,["57"] = 39,["58"] = 40,["59"] = 40,["60"] = 40,["61"] = 40,["62"] = 40,["63"] = 39,["64"] = 39,["65"] = 42,["67"] = 45,["68"] = 46,["69"] = 48,["70"] = 50,["71"] = 50,["72"] = 50,["73"] = 50,["74"] = 50,["75"] = 50,["76"] = 50,["77"] = 50,["78"] = 51,["79"] = 50,["80"] = 50,["81"] = 53,["82"] = 53,["83"] = 53,["84"] = 53,["85"] = 53,["86"] = 53,["87"] = 53,["88"] = 53,["89"] = 54,["90"] = 53,["91"] = 53,["93"] = 58,["94"] = 58,["95"] = 58,["96"] = 58,["97"] = 59,["98"] = 60,["99"] = 61,["100"] = 28,["101"] = 64,["102"] = 65,["103"] = 64,["104"] = 68,["105"] = 69,["106"] = 68,["107"] = 72,["108"] = 73,["109"] = 74,["111"] = 76,["113"] = 72,["114"] = 80,["115"] = 81,["116"] = 80,["117"] = 91,["118"] = 92,["119"] = 92,["120"] = 92,["121"] = 93,["123"] = 91,["124"] = 97,["125"] = 98,["126"] = 98,["127"] = 98,["128"] = 99,["130"] = 97,["131"] = 103,["132"] = 104,["133"] = 104,["134"] = 104,["135"] = 105,["137"] = 107,["138"] = 108,["140"] = 103,["141"] = 112,["142"] = 113,["143"] = 113,["144"] = 113,["145"] = 114,["147"] = 116,["148"] = 117,["149"] = 118,["151"] = 120,["153"] = 123,["154"] = 124,["156"] = 126,["159"] = 129,["160"] = 130,["162"] = 112,["163"] = 134,["164"] = 135,["165"] = 135,["166"] = 135,["167"] = 136,["169"] = 134,["170"] = 140,["171"] = 141,["172"] = 142,["174"] = 140,["175"] = 146,["176"] = 14,["177"] = 148,["178"] = 149,["179"] = 150,["180"] = 151,["181"] = 152,["183"] = 154,["184"] = 155,["185"] = 146,["186"] = 158,["187"] = 159,["188"] = 161,["189"] = 163,["190"] = 164,["192"] = 166,["193"] = 167,["194"] = 168,["196"] = 169,["197"] = 169,["198"] = 170,["199"] = 171,["200"] = 172,["201"] = 173,["204"] = 176,["205"] = 177,["206"] = 178,["207"] = 179,["208"] = 180,["209"] = 181,["210"] = 181,["211"] = 182,["212"] = 182,["213"] = 182,["214"] = 182,["215"] = 182,["216"] = 182,["217"] = 182,["218"] = 182,["219"] = 183,["220"] = 184,["221"] = 184,["222"] = 184,["223"] = 185,["224"] = 186,["225"] = 186,["226"] = 186,["228"] = 188,["229"] = 188,["230"] = 188,["232"] = 182,["233"] = 181,["234"] = 191,["235"] = 191,["236"] = 191,["237"] = 191,["238"] = 191,["239"] = 191,["240"] = 191,["241"] = 191,["242"] = 192,["243"] = 193,["244"] = 191,["245"] = 181,["246"] = 195,["247"] = 195,["248"] = 195,["249"] = 195,["250"] = 195,["251"] = 195,["252"] = 195,["253"] = 195,["254"] = 196,["255"] = 198,["256"] = 199,["257"] = 199,["258"] = 203,["259"] = 199,["260"] = 207,["261"] = 207,["262"] = 207,["263"] = 207,["264"] = 207,["265"] = 195,["266"] = 181,["267"] = 209,["268"] = 209,["269"] = 209,["270"] = 209,["271"] = 209,["272"] = 209,["273"] = 209,["274"] = 209,["275"] = 210,["276"] = 211,["277"] = 212,["278"] = 212,["279"] = 212,["280"] = 209,["281"] = 181,["282"] = 181,["283"] = 169,["286"] = 216,["287"] = 217,["289"] = 219,["291"] = 158,["292"] = 15});
local ____exports = {}
local ____aiplayingsession = require("ai.aiplayingsession")
local AIPlayingSession = ____aiplayingsession.AIPlayingSession
local ____levels = require("fs.levels")
local Levels = ____levels.Levels
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
local ____gui = require("gui")
local Button = ____gui.Button
local ____level = require("level")
local copyLevel = ____level.copyLevel
local ____leveleditor = require("leveleditor")
local LevelEditor = ____leveleditor.LevelEditor
local ____playing = require("playing")
local Playing = ____playing.Playing
local ____recordingsession = require("ai.recordingsession")
local RecordingSession = ____recordingsession.RecordingSession
local ____wrappeddrawable = require("wrappeddrawable")
local WrappedDrawable = ____wrappeddrawable.WrappedDrawable
____exports.LevelPicker = __TS__Class()
local LevelPicker = ____exports.LevelPicker
LevelPicker.name = "LevelPicker"
__TS__ClassExtends(LevelPicker, GameState)
function LevelPicker.prototype.____constructor(self, pageIndex)
    GameState.prototype.____constructor(self)
    self.editedLevelIndex = nil
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
    local aiDescriptiveText = love.graphics.newText(
        love.graphics.newFont(10),
        "lshift to start a recording session, lalt to let the ai play"
    )
    self.aiDescriptiveTextWrapped = __TS__New(WrappedDrawable, aiDescriptiveText)
    self.aiDescriptiveTextWrapped.x = (love.graphics.getWidth() - 5) - aiDescriptiveText:getWidth()
    self.aiDescriptiveTextWrapped.y = (love.graphics.getHeight() - 5) - aiDescriptiveText:getHeight()
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
    return {self.levelsNotAvailableTextWrapped, self.importButton, self.backwardButton, self.forwardButton, self.openSaveDirectoryButton, self.aiDescriptiveTextWrapped}
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
function LevelPicker.prototype.onActive(self, data)
    GameState.prototype.onActive(self, data)
    if self.editedLevelIndex and data then
        local levels = Levels.getLevels()
        local editedLevel = data
        levels[self.editedLevelIndex + 1] = editedLevel
        self.editedLevelIndex = nil
    end
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
                local index = i
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
                            local copy = copyLevel(level)
                            self.editedLevelIndex = index
                            Application.pushState(
                                __TS__New(LevelEditor, copy)
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
