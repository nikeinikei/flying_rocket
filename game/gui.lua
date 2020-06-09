--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 5,["8"] = 9,["9"] = 11,["10"] = 11,["11"] = 22,["12"] = 23,["13"] = 24,["14"] = 25,["15"] = 26,["16"] = 27,["17"] = 28,["18"] = 29,["19"] = 30,["20"] = 22,["21"] = 33,["22"] = 33,["23"] = 35,["24"] = 35,["25"] = 37,["26"] = 37,["27"] = 39,["28"] = 40,["29"] = 41,["30"] = 42,["32"] = 44,["34"] = 39,["35"] = 48,["36"] = 48,["37"] = 12,["38"] = 51,["39"] = 51,["40"] = 51,["41"] = 51,["42"] = 60,["43"] = 51,["44"] = 62,["45"] = 63,["46"] = 64,["47"] = 65,["48"] = 66,["49"] = 67,["50"] = 68,["51"] = 69,["52"] = 60,["53"] = 72,["54"] = 51,["55"] = 74,["56"] = 75,["58"] = 72,["59"] = 79,["60"] = 80,["61"] = 81,["63"] = 81,["64"] = 81,["65"] = 81,["67"] = 83,["68"] = 84,["70"] = 84,["71"] = 84,["72"] = 84,["74"] = 86,["76"] = 86,["77"] = 86,["78"] = 86,["81"] = 89,["82"] = 90,["83"] = 91,["84"] = 51,["85"] = 79,["86"] = 96,["87"] = 96,["88"] = 96,["89"] = 96,["90"] = 111,["91"] = 96,["92"] = 120,["93"] = 121,["94"] = 123,["95"] = 124,["96"] = 125,["97"] = 130,["98"] = 131,["99"] = 139,["100"] = 140,["101"] = 110,["102"] = 143,["103"] = 144,["104"] = 145,["105"] = 143,["106"] = 148,["107"] = 96,["108"] = 150,["109"] = 151,["110"] = 153,["111"] = 154,["112"] = 155,["113"] = 156,["116"] = 159,["117"] = 160,["119"] = 148,["120"] = 164,["121"] = 96,["122"] = 166,["123"] = 167,["124"] = 168,["125"] = 164,["126"] = 171,["127"] = 172,["128"] = 173,["129"] = 174,["130"] = 175,["131"] = 176,["132"] = 96,["133"] = 171,["134"] = 97,["135"] = 98,["136"] = 99,["137"] = 181,["138"] = 181,["139"] = 181,["140"] = 181,["141"] = 186,["142"] = 181,["143"] = 188,["144"] = 189,["145"] = 190,["146"] = 186,["147"] = 193,["148"] = 194,["149"] = 195,["151"] = 193,["152"] = 199,["153"] = 200,["154"] = 201,["156"] = 201,["157"] = 201,["158"] = 201,["160"] = 203,["162"] = 203,["163"] = 203,["164"] = 203,["166"] = 205,["167"] = 181,["168"] = 199,["169"] = 209,["170"] = 210,["171"] = 209});
local ____exports = {}
local ____Color4 = require("Color4")
local Color = ____Color4.Color
local utf8 = require("utf8")
local WeakCollectionConstructor = require("weakcollection")
local Element = __TS__Class()
Element.name = "Element"
function Element.prototype.____constructor(self, x, y, w, h)
    Element.elements:add(self)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.hovered = false
    self.focused = false
    self.disabled = false
end
function Element.prototype.textinput(self, _text)
end
function Element.prototype.mousepressed(self, x, y, button, _istouch, _presses)
end
function Element.prototype.keypressed(self, _key, _code, _isrepeat)
end
function Element.prototype.update(self, _dt)
    local x, y = love.mouse.getPosition()
    if (((self.x <= x) and (x <= (self.x + self.w))) and (self.y <= y)) and (y <= (self.y + self.h)) then
        self.hovered = true
    else
        self.hovered = false
    end
end
function Element.prototype.draw(self)
end
Element.elements = WeakCollectionConstructor()
____exports.Button = __TS__Class()
local Button = ____exports.Button
Button.name = "Button"
__TS__ClassExtends(Button, Element)
function Button.prototype.____constructor(self, x, y, w, h, text, callback)
    Element.prototype.____constructor(self, x, y, w, h)
    local font = love.graphics.newFont(h / 1.5)
    self.text = love.graphics.newText(font, text)
    self.textX = x + ((w - self.text:getWidth()) / 2)
    self.textY = y + ((h - self.text:getHeight()) / 2)
    self.baseColor = __TS__New(Color, 1, 0, 1, 1)
    self.hoveredColor = __TS__New(Color, 0.933, 0.51, 0.933, 1)
    self.disabledColor = __TS__New(Color, 0.4, 0.4, 0.4, 1)
    self.callback = callback
end
function Button.prototype.mousepressed(self, x, y, button, istouch, presses)
    Element.prototype.mousepressed(self, x, y, button, istouch, presses)
    if ((not self.disabled) and self.hovered) and self.callback then
        self.callback()
    end
end
function Button.prototype.draw(self)
    if self.disabled then
        love.graphics.setColor(
            {
                self.disabledColor:unpacked()
            }
        )
    else
        if self.hovered then
            love.graphics.setColor(
                {
                    self.baseColor:unpacked()
                }
            )
        else
            love.graphics.setColor(
                {
                    self.hoveredColor:unpacked()
                }
            )
        end
    end
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.text, self.textX, self.textY)
    Element.prototype.draw(self)
end
____exports.TextInput = __TS__Class()
local TextInput = ____exports.TextInput
TextInput.name = "TextInput"
__TS__ClassExtends(TextInput, Element)
function TextInput.prototype.____constructor(self, x, y, w, h, prompt, callback)
    Element.prototype.____constructor(self, x, y, w, h)
    local fontSize = ____exports.TextInput.promptHeightPercentage * h
    local font = love.graphics.newFont(fontSize)
    self.promptText = love.graphics.newText(font, prompt)
    local promptTextWidth = self.promptText:getWidth()
    self.promptTextPosition = {x = x + ((w - promptTextWidth) / 2), y = y + (____exports.TextInput.promptPaddingPercentage * h)}
    self.inputText = love.graphics.newText(font, "")
    self.inputTextPosition = {x = x + (w / 2), y = y + (((____exports.TextInput.promptPaddingPercentage + ____exports.TextInput.promptHeightPercentage) + ____exports.TextInput.inputHeightPadding) * h)}
    self.inputTextScrape = ""
    self.callback = callback
end
function TextInput.prototype.recalculatePosition(self)
    local width = self.inputText:getWidth()
    self.inputTextPosition.x = self.x + ((self.w - width) / 2)
end
function TextInput.prototype.keypressed(self, key, code, isrepeat)
    Element.prototype.keypressed(self, key, code, isrepeat)
    if key == "backspace" then
        local offset = utf8.offset(self.inputTextScrape, -1)
        if offset then
            self.inputTextScrape = string.sub(self.inputTextScrape, 1, offset - 1)
            self.inputText:set(self.inputTextScrape)
            self:recalculatePosition()
        end
    end
    if key == "return" then
        self.callback(self.inputTextScrape)
    end
end
function TextInput.prototype.textinput(self, text)
    Element.prototype.textinput(self, text)
    self.inputTextScrape = tostring(self.inputTextScrape) .. tostring(text)
    self.inputText:set(self.inputTextScrape)
    self:recalculatePosition()
end
function TextInput.prototype.draw(self)
    love.graphics.setColor(160 / 255, 32 / 255, 240 / 255, 1)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(self.promptText, self.promptTextPosition.x, self.promptTextPosition.y)
    love.graphics.draw(self.inputText, self.inputTextPosition.x, self.inputTextPosition.y)
    Element.prototype.draw(self)
end
TextInput.promptPaddingPercentage = 0.05
TextInput.promptHeightPercentage = 0.3
TextInput.inputHeightPadding = 0.1
____exports.Toggle = __TS__Class()
local Toggle = ____exports.Toggle
Toggle.name = "Toggle"
__TS__ClassExtends(Toggle, Element)
function Toggle.prototype.____constructor(self, x, y, w, h)
    Element.prototype.____constructor(self, x, y, w, h)
    self.on = false
    self.toggleOffColor = __TS__New(Color, 1, 0, 0, 1)
    self.toggleOnColor = __TS__New(Color, 0, 1, 0, 1)
end
function Toggle.prototype.mousepressed(self, x, y, button, istouch, presses)
    if self.hovered then
        self.on = self.on == false
    end
end
function Toggle.prototype.draw(self)
    if self.on then
        love.graphics.setColor(
            {
                self.toggleOnColor:unpacked()
            }
        )
    else
        love.graphics.setColor(
            {
                self.toggleOffColor:unpacked()
            }
        )
    end
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
    Element.prototype.draw(self)
end
function Toggle.prototype.isOn(self)
    return self.on
end
return ____exports
