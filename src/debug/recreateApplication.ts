import { Serialized } from "./../types/Serializable";
import { Menu, GameModeChooserGameState } from "../menu";
import { LevelPicker } from "../levelpicker";
import { Playing } from "../playing";
import { Levels } from "../levels";
import { Settings } from "../settings";
import { json } from "../json";

export namespace RecreateApplication {
    function createStateFromSerialized(serialized: Serialized): any {
        switch (serialized.name) {
            case "Menu":
                return new Menu();
            case "LevelPicker":
                return new LevelPicker();
            case "Playing":
                const levels = Levels.getLevels();
                for (const level of levels) {
                    if (level.name == serialized.level) {
                        return new Playing(level);
                    }
                }
                return null;
            case "GameModeChooserGameState":
                return new GameModeChooserGameState();
        }

        return null;
    }

    export function attempt(): any[] | null {
        const restartFilePath = Settings.getRestartFilePath();

        const [file] = io.open(restartFilePath, "r");
        if (!file) {
            return null;
        }

        const [contents] = file.read("*a");
        file.close();
        os.remove(restartFilePath);
        if (contents) {
            const serializeds = json.decode(contents) as Serialized[];
            const states: any[] = [];
            for (let i = serializeds.length - 1; i >= 0; i--) {
                const serialized = serializeds[i]
                const deserialized = createStateFromSerialized(serialized);
                if (deserialized == null) {
                    return null;
                } else {
                    states.push(deserialized);
                }
            }
            return states;
        }

        return null;
    }
}