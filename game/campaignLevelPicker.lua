--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["10"] = 6,["11"] = 8,["12"] = 8,["13"] = 10,["14"] = 10,["15"] = 10,["16"] = 10,["18"] = 10,["19"] = 16,["20"] = 17,["21"] = 18,["22"] = 19,["23"] = 20,["24"] = 22,["25"] = 23,["26"] = 25,["27"] = 26,["28"] = 28,["29"] = 30,["31"] = 31,["32"] = 31,["34"] = 32,["35"] = 32,["36"] = 33,["37"] = 34,["38"] = 36,["39"] = 38,["40"] = 39,["41"] = 40,["42"] = 40,["43"] = 40,["44"] = 40,["45"] = 40,["46"] = 40,["47"] = 40,["48"] = 40,["49"] = 41,["50"] = 42,["51"] = 43,["52"] = 43,["53"] = 43,["55"] = 45,["57"] = 40,["58"] = 40,["59"] = 48,["60"] = 49,["62"] = 52,["63"] = 54,["64"] = 32,["67"] = 31,["70"] = 14,["71"] = 59,["72"] = 60,["73"] = 59,["74"] = 63,["75"] = 64,["76"] = 63,["77"] = 67,["78"] = 68,["79"] = 67,["80"] = 71,["81"] = 72,["82"] = 73,["84"] = 71,["85"] = 77,["86"] = 78,["87"] = 79,["88"] = 80,["90"] = 86,["92"] = 77});
local ____exports = {}
local ____campaignLevels = require("campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
local ____gui = require("gui")
local Button = ____gui.Button
local ____playing = require("playing")
local Playing = ____playing.Playing
local ____gamestate = require("gamestate")
local GameState = ____gamestate.GameState
____exports.CampaignLevelPicker = __TS__Class()
local CampaignLevelPicker = ____exports.CampaignLevelPicker
CampaignLevelPicker.name = "CampaignLevelPicker"
__TS__ClassExtends(CampaignLevelPicker, GameState)
function CampaignLevelPicker.prototype.____constructor(self)
    GameState.prototype.____constructor(self)
    self.campaignLevels = CampaignLevels.getLevels()
    self.buttons = {}
    self.buttons = {}
    local rows = 4
    local cols = 4
    local startX = 100
    local startY = 100
    local width = 100
    local height = 100
    local padding = 200
    local count = 1
    do
        local i = 0
        while i < rows do
            do
                local j = 0
                while j < cols do
                    local x = startX + (padding * j)
                    local y = startY + (padding * i)
                    local currentCount = count
                    local countAsString = tostring(currentCount)
                    local level = self.campaignLevels[countAsString]
                    local button = __TS__New(
                        Button,
                        x,
                        y,
                        width,
                        height,
                        tostring(count),
                        function()
                            local level = self.campaignLevels[countAsString]
                            if level then
                                Application.pushState(
                                    __TS__New(Playing, level)
                                )
                            else
                                error("this shouldn't happen")
                            end
                        end
                    )
                    if not level then
                        button.disabled = true
                    end
                    __TS__ArrayPush(self.buttons, button)
                    count = count + 1
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
end
function CampaignLevelPicker.prototype.getName(self)
    return "CampaignLevelPicker"
end
function CampaignLevelPicker.prototype.serialize(self)
    return {name = "CampaignLevelPicker"}
end
function CampaignLevelPicker.prototype.getObjects(self)
    return self.buttons
end
function CampaignLevelPicker.prototype.keypressed(self, key)
    if key == "escape" then
        Application.popState()
    end
end
function CampaignLevelPicker.prototype.filedropped(self, file)
    local number = CampaignLevels.importLevelFromFile(file)
    if not number then
        love.window.showMessageBox("Error while importing", "something went wrong while importing this campaign level", "error")
    else
        self.buttons[number].disabled = false
    end
end
return ____exports
