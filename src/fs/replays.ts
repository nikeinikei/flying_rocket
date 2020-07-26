import { Replay } from "../playing";
import { json } from "../json";

export type SerializedReplay = Replay & { name: string };

const replayFileName = "replays.json";
let replays: SerializedReplay[];

(function init() {
    const [raw] = love.filesystem.read(replayFileName);
    if (raw) {
        replays = json.decode(raw);
    } else {
        replays = [];
    }
})();

function save() {
    love.filesystem.write(replayFileName, json.encode(replays));
}

export module Replays {
    export function getReplays() {
        return replays;
    }

    export function addReplay(replay: SerializedReplay) {
        replays.push(replay);
        save();
    }
}
