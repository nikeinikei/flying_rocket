--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 6,["10"] = 6,["11"] = 9,["12"] = 9,["13"] = 9,["15"] = 14,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 18,["20"] = 20,["21"] = 21,["22"] = 23,["23"] = 24,["24"] = 26,["25"] = 28,["27"] = 29,["28"] = 29,["30"] = 30,["31"] = 30,["32"] = 31,["33"] = 32,["34"] = 34,["35"] = 36,["36"] = 37,["37"] = 38,["38"] = 38,["39"] = 38,["40"] = 38,["41"] = 38,["42"] = 38,["43"] = 38,["44"] = 38,["45"] = 39,["46"] = 40,["47"] = 41,["48"] = 41,["49"] = 41,["51"] = 43,["53"] = 38,["54"] = 38,["55"] = 46,["56"] = 47,["58"] = 50,["59"] = 52,["60"] = 30,["63"] = 29,["66"] = 13,["67"] = 57,["68"] = 58,["69"] = 57,["70"] = 61,["71"] = 62,["72"] = 61,["73"] = 65,["74"] = 66,["75"] = 65,["76"] = 69,["77"] = 70,["78"] = 71,["80"] = 69,["81"] = 75,["82"] = 76,["83"] = 77,["84"] = 78,["86"] = 84,["88"] = 75});
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
