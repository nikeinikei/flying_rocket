--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 5,["8"] = 9,["9"] = 9,["10"] = 18,["11"] = 19,["12"] = 20,["13"] = 21,["14"] = 22,["15"] = 23,["16"] = 24,["17"] = 25,["18"] = 26,["19"] = 18,["20"] = 29,["21"] = 29,["22"] = 31,["23"] = 31,["24"] = 33,["25"] = 33,["26"] = 35,["27"] = 36,["28"] = 37,["29"] = 38,["31"] = 40,["33"] = 35,["34"] = 44,["35"] = 44,["36"] = 47,["37"] = 47,["38"] = 47,["39"] = 47,["40"] = 56,["41"] = 47,["42"] = 58,["43"] = 59,["44"] = 60,["45"] = 61,["46"] = 62,["47"] = 63,["48"] = 64,["49"] = 65,["50"] = 56,["51"] = 68,["52"] = 47,["53"] = 70,["54"] = 71,["56"] = 68,["57"] = 75,["58"] = 76,["59"] = 77,["61"] = 77,["62"] = 77,["63"] = 77,["65"] = 79,["66"] = 80,["68"] = 80,["69"] = 80,["70"] = 80,["72"] = 82,["74"] = 82,["75"] = 82,["76"] = 82,["79"] = 85,["80"] = 86,["81"] = 87,["82"] = 47,["83"] = 75,["84"] = 92,["85"] = 92,["86"] = 92,["87"] = 92,["88"] = 107,["89"] = 92,["90"] = 116,["91"] = 117,["92"] = 119,["93"] = 120,["94"] = 121,["95"] = 126,["96"] = 127,["97"] = 135,["98"] = 136,["99"] = 106,["100"] = 139,["101"] = 140,["102"] = 141,["103"] = 139,["104"] = 144,["105"] = 92,["106"] = 146,["107"] = 147,["108"] = 149,["109"] = 150,["110"] = 151,["111"] = 152,["114"] = 155,["115"] = 156,["117"] = 144,["118"] = 160,["119"] = 92,["120"] = 162,["121"] = 163,["122"] = 164,["123"] = 160,["124"] = 167,["125"] = 168,["126"] = 169,["127"] = 170,["128"] = 171,["129"] = 172,["130"] = 92,["131"] = 167,["132"] = 93,["133"] = 94,["134"] = 95,["135"] = 177,["136"] = 177,["137"] = 177,["138"] = 177,["139"] = 182,["140"] = 177,["141"] = 184,["142"] = 185,["143"] = 186,["144"] = 182,["145"] = 189,["146"] = 190,["147"] = 191,["149"] = 189,["150"] = 195,["151"] = 196,["152"] = 197,["154"] = 197,["155"] = 197,["156"] = 197,["158"] = 199,["160"] = 199,["161"] = 199,["162"] = 199,["164"] = 201,["165"] = 177,["166"] = 195,["167"] = 205,["168"] = 206,["169"] = 205});
local ____exports = {}
local ____Color4 = require("Color4")
local Color = ____Color4.Color
local utf8 = require("utf8")
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
