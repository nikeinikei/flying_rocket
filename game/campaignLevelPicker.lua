--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["10"] = 6,["11"] = 8,["12"] = 8,["13"] = 8,["15"] = 13,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 19,["20"] = 20,["21"] = 22,["22"] = 23,["23"] = 25,["24"] = 27,["26"] = 28,["27"] = 28,["29"] = 29,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 33,["34"] = 35,["35"] = 36,["36"] = 36,["37"] = 36,["38"] = 36,["39"] = 36,["40"] = 36,["41"] = 36,["42"] = 36,["43"] = 37,["44"] = 38,["45"] = 38,["46"] = 38,["48"] = 40,["50"] = 36,["51"] = 36,["52"] = 43,["53"] = 44,["55"] = 47,["56"] = 49,["57"] = 29,["60"] = 28,["63"] = 12,["64"] = 54,["65"] = 55,["66"] = 54,["67"] = 58,["68"] = 59,["69"] = 60,["71"] = 58});
local ____exports = {}
local ____campaignLevels = require("campaignLevels")
local CampaignLevels = ____campaignLevels.CampaignLevels
local ____gui = require("gui")
local Button = ____gui.Button
local ____playing = require("playing")
local Playing = ____playing.Playing
____exports.CampaignLevelPicker = __TS__Class()
local CampaignLevelPicker = ____exports.CampaignLevelPicker
CampaignLevelPicker.name = "CampaignLevelPicker"
function CampaignLevelPicker.prototype.____constructor(self)
    self.campaignLevels = CampaignLevels.getLevels()
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
                    local level = self.campaignLevels[tostring(currentCount)]
                    local button = __TS__New(
                        Button,
                        x,
                        y,
                        width,
                        height,
                        tostring(count),
                        function()
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
function CampaignLevelPicker.prototype.getObjects(self)
    return self.buttons
end
function CampaignLevelPicker.prototype.keypressed(self, key)
    if key == "escape" then
        Application.popState()
    end
end
return ____exports
