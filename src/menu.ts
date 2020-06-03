import { KeyConstant } from "love.keyboard";

import { CampaignLevelPicker } from "./campaignLevelPicker";
import { Button, TextInput, Toggle } from "./gui";
import { LevelBuilder } from "./levelbuilder";
import { LevelPicker } from "./levelpicker";
import { Levels } from "./levels";
import { Settings } from "./settings";

class PreLevelBuilderGameState {
    private textInput: TextInput;
    private toggle: Toggle | null;

    constructor() {
        const textInputWidth = 1200;
        const textInputHeight = 600;
        const x = love.graphics.getWidth() / 2 - textInputWidth / 2;
        const y = love.graphics.getHeight() / 2 - textInputHeight / 2;

        this.textInput = new TextInput(x, y, textInputWidth, textInputHeight, "level name", name => {
            if (name.length === 0) {
                love.window.showMessageBox("Invalid Level Name", "empty string is not allowed.", "error");
            } else {
                if (Levels.nameUsed(name)) {
                    love.window.showMessageBox("Invalid Level Name", "level name already in use", "error");
                } else {
                    Application.popState();
                    if (this.toggle && this.toggle.isOn()) {
                        const index = tonumber(name);
                        if (!index) {
                            love.window.showMessageBox(
                                "Invalid level name",
                                "when creating a campaign level the name must be the index of the campaign",
                                "error"
                            );
                        } else {
                            Application.pushState(
                                new LevelBuilder(name, {
                                    index,
                                })
                            );
                        }
                    } else {
                        Application.pushState(new LevelBuilder(name));
                    }
                }
            }
        });

        if (Settings.isDevelopment()) {
            this.toggle = new Toggle(10, 10, 40, 40);
        } else {
            this.toggle = null;
        }
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
    }
}

class GameModeChooserGameState {
    private campaignButton: Button;
    private customGameButton: Button;

    constructor() {
        this.campaignButton = new Button(50, 50, 400, 100, "Campaign", () => {
            Application.pushState(new CampaignLevelPicker());
        });
        this.customGameButton = new Button(50, 200, 400, 100, "Custom", () => {
            Application.pushState(new LevelPicker());
        });
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
        name: "LevelBuilder",
        callback: () => {
            Application.pushState(new PreLevelBuilderGameState());
        },
    },
    {
        name: "Options",
        callback: () => {
            love.window.showMessageBox("Not implemented", "Options are currently not available");
        },
    },
    {
        name: "Exit",
        callback: love.event.quit,
    },
];

export class Menu {
    private buttons: Button[];

    constructor() {
        this.buttons = [];

        const buttonHeight = 70;
        const buttonWidth = 400;

        const startY = 150;
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

    getObjects() {
        return this.buttons;
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            love.event.quit(0);
        }
    }
}
