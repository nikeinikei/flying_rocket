import { fixData } from "./datafixer";
import { json } from "./json";
import { Level } from "./leveleditor";
import { Settings } from "./settings";

interface Lfs {
    /** @returnTuple */
    attributes(this: void, path: string): [any, string | undefined];
    currentdir(this: void): string;
    /** @returnTuple */
    chdir(this: void, path: string): [boolean, undefined | string];
}

const fileName = "campaignLevels.json";
let levels: Table<string, Level> = new Table();

function init() {
    if (love.filesystem.getInfo("res/" + fileName)) {
        const [contents, _size] = love.filesystem.read("res/" + fileName);
        if (contents) {
            levels = json.decode(contents);
        } else {
            error("this shouldn't happen");
        }
    } else {
        error("no campaign levels found. Is the game corrupted?");
    }
}

function save() {
    const jsonified = json.encode(levels);

    const lfs: Lfs = require("lfs");

    const writeLevelsToFile = () => {
        const [file] = io.open(fileName, "w");
        if (file) {
            file.write(jsonified);
            file.close();
        } else {
            error("file doesn't exist");
        }
    };

    lfs.chdir("res");

    writeLevelsToFile();

    lfs.chdir("..");

    lfs.chdir("game");
    lfs.chdir("res");

    writeLevelsToFile();

    lfs.chdir("..");
    lfs.chdir("..");
}

export namespace CampaignLevels {
    export function addLevel(level: Level) {
        levels.set(level.name, level);
        save();
    }

    export function getLevels() {
        return levels;
    }

    export function importLevelFromFile(file: File): number | undefined {
        if (!Settings.isDevelopment()) {
            return undefined;
        }

        const [contents, _size] = file.read();
        if (!contents) {
            return undefined;
        }

        const level: Level = json.decode(contents);
        if (!fixData(level)) {
            return undefined;
        }

        const asNumber = tonumber(level.name);
        if (!asNumber) {
            return undefined;
        }

        levels.set(level.name, level);
        save();
        return asNumber;
    }
}

init();
