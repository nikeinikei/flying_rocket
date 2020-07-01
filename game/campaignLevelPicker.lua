--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["10"] = 6,["11"] = 8,["12"] = 8,["13"] = 8,["15"] = 13,["16"] = 14,["17"] = 15,["18"] = 16,["19"] = 17,["20"] = 19,["21"] = 20,["22"] = 22,["23"] = 23,["24"] = 25,["25"] = 27,["27"] = 28,["28"] = 28,["30"] = 29,["31"] = 29,["32"] = 30,["33"] = 31,["34"] = 33,["35"] = 35,["36"] = 36,["37"] = 37,["38"] = 37,["39"] = 37,["40"] = 37,["41"] = 37,["42"] = 37,["43"] = 37,["44"] = 37,["45"] = 38,["46"] = 39,["47"] = 40,["48"] = 40,["49"] = 40,["51"] = 42,["53"] = 37,["54"] = 37,["55"] = 45,["56"] = 46,["58"] = 49,["59"] = 51,["60"] = 29,["63"] = 28,["66"] = 12,["67"] = 56,["68"] = 57,["69"] = 56,["70"] = 60,["71"] = 61,["72"] = 62,["74"] = 60,["75"] = 66,["76"] = 67,["77"] = 68,["78"] = 69,["80"] = 75,["82"] = 66});
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
