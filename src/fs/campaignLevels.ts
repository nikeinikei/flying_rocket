import { DataFixer } from "../datafixer";
import { json } from "../json";
import { Level } from "../level";
import { Settings } from "../settings";

const fileName = "campaignLevels.json";
let levels: Table<string, Level> = new Table();

let isInit = false;

function assertInit() {
    if (!isInit) {
        error(
            "campaign levels are not initialized, CampaignLevels.init() has to be called in love.load before pushing the first state"
        );
    }
}

function internal_init() {
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

    let changed = false;
    for (const [k, v] of pairs(levels)) {
        const res = DataFixer.fixData(v);
        if (res != undefined) {
            changed = true;
        }
        if (res == false) {
            error("campaign levels are corrupt, please message the developer.");
        }
    }

    if (changed) {
        save();
    }
}

function save() {
    const jsonified = json.encode(levels);

    const writeLevelsToFile = (path: string) => {
        const [file] = io.open(path, "w");
        if (file) {
            file.write(jsonified);
        } else {
            error("file doesn't exist");
        }
        file.close();
    };

    writeLevelsToFile("res/" + fileName);
    writeLevelsToFile("game/res/" + fileName);
}

export namespace CampaignLevels {
    export function init() {
        internal_init();
        isInit = true;
    }

    export function addLevel(level: Level) {
        assertInit();

        levels.set(level.name, level);
        save();
    }

    export function getLevels() {
        assertInit();
        return levels;
    }

    export function importLevelFromFile(file: File): number | undefined {
        assertInit();
        if (!Settings.isDevelopment()) {
            return undefined;
        }

        const [contents, _size] = file.read();
        if (!contents) {
            return undefined;
        }

        const level: Level = json.decode(contents);
        if (!DataFixer.fixData(level)) {
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
