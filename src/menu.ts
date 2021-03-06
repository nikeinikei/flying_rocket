import { KeyConstant } from "love.keyboard";

import { CampaignLevelPicker } from "./campaignLevelPicker";
import { CampaignLevels } from "./fs/campaignLevels";
import { Levels } from "./fs/levels";
import { GameState } from "./gamestate";
import { Button, TextInput, Toggle } from "./gui";
import { Level, newLevel } from "./level";
import { LevelEditor } from "./leveleditor";
import { LevelPicker } from "./levelpicker";
import { Settings } from "./settings";
import { Serializable, Serialized } from "./types/Serializable";

export class PreLevelEditorGameState extends GameState implements Serializable {
    private textInput: TextInput;
    private toggle: Toggle | null;
    private isCampaignLevel: boolean | null = null;

    constructor(levelName?: string, isCampaignLevel?: boolean | null) {
        super();
        this.isCampaignLevel = isCampaignLevel ?? null;
        const textInputWidth = 1200;
        const textInputHeight = 600;
        const x = love.graphics.getWidth() / 2 - textInputWidth / 2;
        const y = love.graphics.getHeight() / 2 - textInputHeight / 2;

        this.textInput = new TextInput(x, y, textInputWidth, textInputHeight, "level name");
        if (levelName) {
            this.textInput.setText(levelName);
        }

        if (Settings.isDevelopment()) {
            this.toggle = new Toggle(10, 10, 40, 40);
        } else {
            this.toggle = null;
        }
    }

    onActive(data?: any) {
        super.onActive(data);
        if (data) {
            const level = data as Level;
            if (this.isCampaignLevel == true) {
                CampaignLevels.addLevel(level);
            } else if (this.isCampaignLevel == false) {
                Levels.addLevel(level);
            }
        }
        Application.popState();
    }

    getName() {
        return "PreLevelEditorGameState";
    }

    serialize(): Serialized {
        return {
            name: "PreLevelEditorGameState",
            levelName: this.textInput.getText(),
            isCampaignLevel: this.isCampaignLevel,
        };
    }

    getObjects() {
        let objects: unknown[] = [this.textInput];
        if (this.toggle) {
            objects.push(this.toggle);
        }
        return objects;
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            Application.popState();
        }
        if (key == "return") {
            const name = this.textInput.getText();

            if (name.length === 0) {
                love.window.showMessageBox("Invalid Level Name", "empty string is not allowed.", "error");
            } else {
                if (Levels.nameUsed(name)) {
                    love.window.showMessageBox("Invalid Level Name", "level name already in use", "error");
                } else {
                    if (this.toggle && this.toggle.isOn()) {
                        const index = tonumber(name);
                        if (!index) {
                            love.window.showMessageBox(
                                "Invalid level name",
                                "when creating a campaign level the name must be the index of the campaign",
                                "error"
                            );
                        } else {
                            const level = newLevel(name);

                            this.isCampaignLevel = true;
                            Application.pushState(new LevelEditor(level));
                        }
                    } else {
                        const level = newLevel(name);

                        this.isCampaignLevel = false;
                        Application.pushState(new LevelEditor(level));
                    }
                }
            }
        }
    }
}

export class GameModeChooserGameState extends GameState implements Serializable {
    private campaignButton: Button;
    private customGameButton: Button;

    constructor() {
        super();
        this.campaignButton = new Button(50, 50, 400, 100, "Campaign", () => {
            Application.pushState(new CampaignLevelPicker());
        });
        this.customGameButton = new Button(50, 200, 400, 100, "Custom", () => {
            Application.pushState(new LevelPicker());
        });
    }

    getName() {
        return "GameModeChooserGameState";
    }

    serialize(): Serialized {
        return { name: "GameModeChooserGameState" };
    }

    getObjects() {
        return [this.campaignButton, this.customGameButton];
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            Application.popState();
        }
    }
}

const buttonSchemes = [
    {
        name: "Play",
        callback: () => {
            Application.pushState(new GameModeChooserGameState());
        },
    },
    {
        name: "Level Editor",
        callback: () => {
            Application.pushState(new PreLevelEditorGameState());
        },
    },
    {
        name: "Options",
        callback: () => {
            love.window.showMessageBox("Not implemented", "Options are currently not available");
        },
    },
];

if (!Settings.isWeb()) {
    buttonSchemes.push({
        name: "Exit",
        callback: love.event.quit,
    });
}

export class Menu extends GameState implements Serializable {
    private static buttonWidth = 400;
    private static buttonHeight = 70;
    private static buttonStartY = 150;

    private buttons: Button[];

    constructor() {
        super();
        this.buttons = [];

        const buttonHeight = Menu.buttonHeight;
        const buttonWidth = Menu.buttonWidth;

        const startY = Menu.buttonStartY;
        const buttonPadding = (love.graphics.getHeight() * 0.7) / buttonSchemes.length;

        const x = love.graphics.getWidth() / 2 - buttonWidth / 2;
        for (let i = 0; i < buttonSchemes.length; i++) {
            this.buttons.push(
                new Button(
                    x,
                    startY + i * buttonPadding,
                    buttonWidth,
                    buttonHeight,
                    buttonSchemes[i].name,
                    buttonSchemes[i].callback
                )
            );
        }
    }

    private setButtonPositions() {
        const x = love.graphics.getWidth() / 2 - Menu.buttonWidth / 2;
        const buttonPadding = (love.graphics.getHeight() * 0.7) / buttonSchemes.length;

        for (let i = 0; i < this.buttons.length; i++) {
            const button = this.buttons[i];
            button.x = x;
            button.y = Menu.buttonStartY + i * buttonPadding;
        }
    }

    resize(width: number, height: number) {
        this.setButtonPositions();
    }

    getName() {
        return "Menu";
    }

    serialize(): Serialized {
        return { name: "Menu" };
    }

    getObjects() {
        return this.buttons;
    }

    keypressed(key: KeyConstant) {
        if (key == "escape" && !Settings.isWeb()) {
            love.event.quit(0);
        }
    }
}
