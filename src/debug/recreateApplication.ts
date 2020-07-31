import { Serialized } from "./../types/Serializable";
import { CampaignLevelPicker } from "../campaignLevelPicker";
import { Levels } from "../fs/levels";
import { json } from "../json";
import { newLevel } from "../level";
import { LevelEditor } from "../leveleditor";
import { LevelPicker } from "../levelpicker";
import { GameModeChooserGameState, Menu, PreLevelEditorGameState } from "../menu";
import { Playing } from "../playing";
import { Settings } from "../settings";

function assertNever(o: never) {
    throw new Error("this shouldn't occur");
}

export namespace RecreateApplication {
    function createStateFromSerialized(serialized: Serialized): any {
        if (serialized.name == "Menu") {
            return new Menu();
        } else if (serialized.name == "LevelPicker") {
            return new LevelPicker(serialized.page);
        } else if (serialized.name == "Playing") {
            const levels = Levels.getLevels();
            for (const level of levels) {
                if (level.name == serialized.level) {
                    return new Playing(level);
                }
            }
            return null;
        } else if (serialized.name == "GameModeChooserGameState") {
            return new GameModeChooserGameState();
        } else if (serialized.name == "CampaignLevelPicker") {
            return new CampaignLevelPicker();
        } else if (serialized.name == "PreLevelEditorGameState") {
            return new PreLevelEditorGameState(serialized.levelName, serialized.isCampaignLevel);
        } else if (serialized.name == "LevelEditor") {
            return new LevelEditor(newLevel(serialized.levelName));
        } else {
            assertNever(serialized);
        }
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
                const serialized = serializeds[i];
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
