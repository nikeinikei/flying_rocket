import { Level } from "./levelbuilder";
import { fixData } from "./datafixer";

interface RxiJsonLibrary {
    decode(this:void, input: string): any;
    encode(this:void, obj: any): string;
}

const json: RxiJsonLibrary = require("libs.json");

const fileName = "levels.json";
let levels: Level[];

function init() {
    if (love.filesystem.getInfo(fileName)) {
        const [contents, size] = love.filesystem.read(fileName);
        if (contents) {
            levels = json.decode(contents);
            levels = levels.filter((level) => fixData(level));
        } else {
            levels = [];
        }
    } else {
        levels = [];
    }
}

function save() {
    love.filesystem.write(fileName, json.encode(levels) as any);
}

init();
save();

export namespace Levels {
    export function addLevel(level: Level) {
        levels.push(level);
        save();
    }

    export function removeLevel(index: number) {
        table.remove(levels, index);
        save();
    }

    export function nameUsed(name: string): boolean {
        for (const level of levels) {
            if (level.name == name) {
                return true;
            }
        }
        return false;
    }

    export function getLevels(): Level[] {
        return levels;
    }
}