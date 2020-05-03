import { KeyConstant } from "love.keyboard";

import { Button, TextInput } from "./gui";
import { LevelBuilder } from "./levelbuilder";
const Levels: Levels = require("levels");
const LevelPicker = require("levelpicker");

class PreLevelBuilderGameState {
    private textInput: TextInput;

    constructor() {
        const textInputWidth = 1200;
        const textInputHeight = 600;
        const x = love.graphics.getWidth() / 2 - textInputWidth / 2;
        const y = love.graphics.getHeight() / 2 - textInputHeight / 2;

        this.textInput = new TextInput(
            x, y, 
            textInputWidth, textInputHeight,
            "level name",
            (name) => {
                if (name.length === 0) {   
                    love.window.showMessageBox("Invalid Level Name", "empty string is not allowed.", "error")
                } else {
                    if (Levels.nameUsed(name)) {
                        love.window.showMessageBox("Invalid Level Name", "level name already in use", "error")
                    } else {
                        Application.popState();
                        Application.pushState(new LevelBuilder(name));
                    }
                }
            }
        )
    }

    getObjects() {
        return [this.textInput];
    }
}

const buttonSchemes = [
    {
        name: "Play",
        callback: () => {
            Application.pushState(LevelPicker());
        },
    },
    {
        name: "LevelBuilder",
        callback: () => {
            Application.pushState(new PreLevelBuilderGameState())
        },
    },
    {
        name: "Options",
        callback: () => {
            love.window.showMessageBox("Not implemented", "Options are currently not available")
        },
    },
    {
        name: "Exit",
        callback: love.event.quit
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
            love.event.quit();
        }
    }
}
