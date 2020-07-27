import { DataFixer } from "../datafixer";
import { json } from "../json";
import { Level } from "../level";

const fileName = "levels.json";
let levels: Level[];

function init() {
    if (love.filesystem.getInfo(fileName)) {
        const [contents, _size] = love.filesystem.read(fileName);
        if (contents) {
            levels = json.decode(contents);
            levels = levels.filter(level => {
                const res = DataFixer.fixData(level);
                return res == undefined || res == true;
            });
        } else {
            levels = [];
        }
    } else {
        levels = [];
    }
}

export namespace Levels {
    export function save() {
        love.filesystem.write(fileName, json.encode(levels));
    }

    export function addLevel(level: Level) {
        levels.push(level);
        save();
    }

    export function removeLevel(level: Level) {
        levels = levels.filter(l => l != level);
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

    export function exportLevel(level: Level): string {
        const jsonified = json.encode(level);
        const levelName = level.name;

        let fileName = levelName + ".json";
        let counter = 1;
        while (love.filesystem.getInfo(fileName)) {
            fileName = levelName + "(" + counter + ").json";

            counter++;
        }

        love.filesystem.write(fileName, jsonified);
        return fileName;
    }

    export function importLevelFromFile(file: File): boolean {
        const [contents, _size] = file.read();
        if (!contents) {
            return false;
        }

        const level = json.decode(contents);
        if (!DataFixer.fixData(level)) {
            return false;
        }

        table.insert(levels, level);

        return true;
    }
}

init();
Levels.save();
