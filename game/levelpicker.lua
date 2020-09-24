--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 8,["16"] = 8,["17"] = 9,["18"] = 9,["19"] = 10,["20"] = 10,["21"] = 12,["22"] = 12,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 27,["28"] = 14,["29"] = 25,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 31,["34"] = 31,["35"] = 31,["36"] = 32,["37"] = 33,["38"] = 34,["39"] = 35,["40"] = 35,["41"] = 35,["42"] = 35,["43"] = 35,["44"] = 35,["45"] = 35,["46"] = 35,["47"] = 36,["48"] = 35,["49"] = 35,["50"] = 38,["51"] = 38,["52"] = 38,["53"] = 38,["54"] = 38,["55"] = 38,["56"] = 38,["57"] = 38,["58"] = 39,["59"] = 39,["60"] = 39,["61"] = 39,["62"] = 39,["63"] = 38,["64"] = 38,["65"] = 41,["67"] = 44,["68"] = 45,["69"] = 47,["70"] = 49,["71"] = 49,["72"] = 49,["73"] = 49,["74"] = 49,["75"] = 49,["76"] = 49,["77"] = 49,["78"] = 50,["79"] = 49,["80"] = 49,["81"] = 52,["82"] = 52,["83"] = 52,["84"] = 52,["85"] = 52,["86"] = 52,["87"] = 52,["88"] = 52,["89"] = 53,["90"] = 52,["91"] = 52,["93"] = 27,["94"] = 58,["95"] = 59,["96"] = 58,["97"] = 62,["98"] = 63,["99"] = 62,["100"] = 66,["101"] = 67,["102"] = 68,["104"] = 70,["106"] = 66,["107"] = 74,["108"] = 75,["109"] = 74,["110"] = 84,["111"] = 85,["112"] = 85,["113"] = 85,["114"] = 86,["116"] = 84,["117"] = 90,["118"] = 91,["119"] = 91,["120"] = 91,["121"] = 92,["123"] = 90,["124"] = 96,["125"] = 97,["126"] = 97,["127"] = 97,["128"] = 98,["130"] = 100,["131"] = 101,["133"] = 96,["134"] = 105,["135"] = 106,["136"] = 106,["137"] = 106,["138"] = 107,["140"] = 109,["141"] = 110,["142"] = 111,["144"] = 113,["146"] = 116,["147"] = 117,["149"] = 119,["152"] = 122,["153"] = 123,["155"] = 105,["156"] = 127,["157"] = 128,["158"] = 128,["159"] = 128,["160"] = 129,["162"] = 127,["163"] = 133,["164"] = 134,["165"] = 135,["167"] = 133,["168"] = 139,["169"] = 14,["170"] = 141,["171"] = 142,["172"] = 143,["173"] = 144,["174"] = 145,["176"] = 147,["177"] = 148,["178"] = 139,["179"] = 151,["180"] = 152,["181"] = 154,["182"] = 156,["183"] = 157,["185"] = 159,["186"] = 160,["187"] = 161,["189"] = 162,["190"] = 162,["191"] = 163,["192"] = 164,["193"] = 165,["194"] = 166,["197"] = 169,["198"] = 170,["199"] = 171,["200"] = 172,["201"] = 173,["202"] = 174,["203"] = 174,["204"] = 175,["205"] = 175,["206"] = 175,["207"] = 175,["208"] = 175,["209"] = 175,["210"] = 175,["211"] = 175,["212"] = 176,["213"] = 177,["214"] = 177,["215"] = 177,["216"] = 178,["217"] = 179,["218"] = 179,["219"] = 179,["221"] = 181,["222"] = 181,["223"] = 181,["225"] = 175,["226"] = 174,["227"] = 184,["228"] = 184,["229"] = 184,["230"] = 184,["231"] = 184,["232"] = 184,["233"] = 184,["234"] = 184,["235"] = 185,["236"] = 186,["237"] = 184,["238"] = 174,["239"] = 188,["240"] = 188,["241"] = 188,["242"] = 188,["243"] = 188,["244"] = 188,["245"] = 188,["246"] = 188,["247"] = 189,["248"] = 191,["249"] = 192,["250"] = 192,["251"] = 196,["252"] = 192,["253"] = 200,["254"] = 200,["255"] = 200,["256"] = 200,["257"] = 200,["258"] = 188,["259"] = 174,["260"] = 202,["261"] = 202,["262"] = 202,["263"] = 202,["264"] = 202,["265"] = 202,["266"] = 202,["267"] = 202,["268"] = 203,["269"] = 204,["270"] = 205,["271"] = 205,["272"] = 205,["273"] = 202,["274"] = 174,["275"] = 174,["276"] = 162,["279"] = 209,["280"] = 210,["282"] = 212,["284"] = 151,["285"] = 15});
local ____exports = {}
local ____aiplayingsession = require("aiplayingsession")
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
local ____recordingsession = require("recordingsession")
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
