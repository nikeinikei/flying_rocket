--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 5,["8"] = 9,["9"] = 9,["10"] = 18,["11"] = 19,["12"] = 20,["13"] = 21,["14"] = 22,["15"] = 23,["16"] = 24,["17"] = 25,["18"] = 18,["19"] = 28,["20"] = 28,["21"] = 30,["22"] = 30,["23"] = 32,["24"] = 32,["25"] = 34,["26"] = 35,["27"] = 36,["28"] = 37,["30"] = 39,["32"] = 34,["33"] = 43,["34"] = 43,["35"] = 46,["36"] = 46,["37"] = 46,["38"] = 46,["39"] = 55,["40"] = 46,["41"] = 57,["42"] = 58,["43"] = 59,["44"] = 60,["45"] = 61,["46"] = 62,["47"] = 63,["48"] = 64,["49"] = 55,["50"] = 67,["51"] = 46,["52"] = 69,["53"] = 70,["55"] = 67,["56"] = 74,["57"] = 75,["58"] = 76,["60"] = 76,["61"] = 76,["62"] = 76,["64"] = 78,["65"] = 79,["67"] = 79,["68"] = 79,["69"] = 79,["71"] = 81,["73"] = 81,["74"] = 81,["75"] = 81,["78"] = 84,["79"] = 85,["80"] = 86,["81"] = 87,["82"] = 88,["83"] = 46,["84"] = 74,["85"] = 93,["86"] = 93,["87"] = 93,["88"] = 93,["89"] = 106,["90"] = 93,["91"] = 109,["92"] = 110,["93"] = 112,["94"] = 113,["95"] = 114,["96"] = 119,["97"] = 120,["98"] = 128,["99"] = 106,["100"] = 131,["101"] = 132,["102"] = 131,["103"] = 135,["104"] = 136,["105"] = 137,["106"] = 138,["107"] = 135,["108"] = 141,["109"] = 142,["110"] = 143,["111"] = 141,["112"] = 146,["113"] = 93,["114"] = 148,["115"] = 149,["116"] = 151,["117"] = 152,["118"] = 153,["119"] = 154,["122"] = 146,["123"] = 159,["124"] = 93,["125"] = 161,["126"] = 162,["127"] = 163,["128"] = 159,["129"] = 166,["130"] = 167,["131"] = 168,["132"] = 169,["133"] = 170,["134"] = 171,["135"] = 93,["136"] = 166,["137"] = 94,["138"] = 95,["139"] = 96,["140"] = 176,["141"] = 176,["142"] = 176,["143"] = 176,["144"] = 181,["145"] = 176,["146"] = 183,["147"] = 184,["148"] = 185,["149"] = 181,["150"] = 188,["151"] = 189,["152"] = 190,["154"] = 188,["155"] = 194,["156"] = 195,["157"] = 196,["159"] = 196,["160"] = 196,["161"] = 196,["163"] = 198,["165"] = 198,["166"] = 198,["167"] = 198,["169"] = 200,["170"] = 176,["171"] = 194,["172"] = 204,["173"] = 205,["174"] = 204});
local ____exports = {}
local ____Color4 = require("Color4")
local Color = ____Color4.Color
local utf8 = require("utf8")
local Element = __TS__Class()
Element.name = "Element"
function Element.prototype.____constructor(self, x, y, w, h)
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
    self.textX = self.x + ((self.w - self.text:getWidth()) / 2)
    self.textY = self.y + ((self.h - self.text:getHeight()) / 2)
    love.graphics.draw(self.text, self.textX, self.textY)
    Element.prototype.draw(self)
end
____exports.TextInput = __TS__Class()
local TextInput = ____exports.TextInput
TextInput.name = "TextInput"
__TS__ClassExtends(TextInput, Element)
function TextInput.prototype.____constructor(self, x, y, w, h, prompt)
    Element.prototype.____constructor(self, x, y, w, h)
    local fontSize = ____exports.TextInput.promptHeightPercentage * h
    local font = love.graphics.newFont(fontSize)
    self.promptText = love.graphics.newText(font, prompt)
    local promptTextWidth = self.promptText:getWidth()
    self.promptTextPosition = {x = x + ((w - promptTextWidth) / 2), y = y + (____exports.TextInput.promptPaddingPercentage * h)}
    self.inputText = love.graphics.newText(font, "")
    self.inputTextPosition = {x = x + (w / 2), y = y + (((____exports.TextInput.promptPaddingPercentage + ____exports.TextInput.promptHeightPercentage) + ____exports.TextInput.inputHeightPadding) * h)}
    self.inputTextScrape = ""
end
function TextInput.prototype.getText(self)
    return self.inputTextScrape
end
function TextInput.prototype.setText(self, text)
    self.inputTextScrape = text
    self.inputText:set(self.inputTextScrape)
    self:recalculatePosition()
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
