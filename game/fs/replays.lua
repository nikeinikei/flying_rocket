--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 2,["6"] = 2,["7"] = 6,["8"] = 7,["9"] = 9,["10"] = 10,["11"] = 11,["12"] = 12,["14"] = 14,["16"] = 9,["17"] = 18,["18"] = 19,["19"] = 19,["20"] = 19,["21"] = 19,["22"] = 18,["24"] = 22,["26"] = 22,["27"] = 24,["28"] = 23,["29"] = 22,["30"] = 28,["31"] = 29,["32"] = 27});
local ____exports = {}
local ____json = require("json")
local json = ____json.json
local replayFileName = "replays.json"
local replays;
(function()
    local raw = love.filesystem.read(replayFileName)
    if raw then
        replays = json.decode(raw)
    else
        replays = {}
    end
end)()
local function save()
    love.filesystem.write(
        replayFileName,
        json.encode(replays)
    )
end
____exports.Replays = {}
local Replays = ____exports.Replays
do
    function Replays.getReplays()
        return replays
    end
    function Replays.addReplay(replay)
        __TS__ArrayPush(replays, replay)
        save()
    end
end
return ____exports
