import { json } from "../json";
import { Replay } from "../playing";

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

    export function addReplay(replay: Replay, name: string) {
        const serializedReplay: SerializedReplay = {...replay, name };
        replays.push(serializedReplay);
        save();
    }
}
