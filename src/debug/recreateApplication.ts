import { Serialized } from "./../types/Serializable";
import { CampaignLevelPicker } from "../campaignLevelPicker";
import { json } from "../json";
import { newLevel } from "../level";
import { LevelEditor } from "../leveleditor";
import { LevelPicker } from "../levelpicker";
import { Levels } from "../levels";
import { GameModeChooserGameState, Menu, PreLevelEditorGameState } from "../menu";
import { Playing } from "../playing";
import { Settings } from "../settings";

function assertNever(o: never) {
    throw new Error("this shouldn't occur");
}

export namespace RecreateApplication {
    function createStateFromSerialized(serialized: Serialized): any {
        switch (serialized.name) {
            case "Menu":
                return new Menu();
            case "LevelPicker":
                return new LevelPicker(serialized.page);
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
            case "CampaignLevelPicker":
                return new CampaignLevelPicker();
            case "PreLevelEditorGameState":
                return new PreLevelEditorGameState(serialized.levelName, serialized.isCampaignLevel);
            case "LevelEditor":
                const levelName = serialized.levelName;
                print("levelName", levelName);
                return new LevelEditor(newLevel(levelName));
        }

        assertNever(serialized);
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
