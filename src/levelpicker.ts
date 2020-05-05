import { Button } from "./gui";
import { LevelModule } from "./types/levels";
import { WrappedDrawable } from "./wrappeddrawable";
import { Level } from "./levelbuilder";
import { KeyConstant } from "love.keyboard";

const Levels: LevelModule = require("levels");
const Playing: (this:void, level: Level) => any = require("playing");

export class LevelPicker {
    private buttons: Button[];
    private levelsNotAvailableTextWrapped: WrappedDrawable;

    constructor() {
        this.buttons = [];
        let levelsNotAvailableText = love.graphics.newText(love.graphics.newFont(50), "no levels available");
        this.levelsNotAvailableTextWrapped = new WrappedDrawable(levelsNotAvailableText);
        this.createButtons();
    }

    getObjects() {
        return [...this.buttons, this.levelsNotAvailableTextWrapped];
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            love.event.quit();
        }
    }

    private createButtons() {
        this.buttons.length = 0;

        const levels = Levels.getLevels();

        if (levels.length == 0) {
            this.levelsNotAvailableTextWrapped.visible = true;
        } else {
            this.levelsNotAvailableTextWrapped.visible = false;
            for (let i = 0; i < levels.length; i++) {
                const y = 50 + i * 50;
                const height = 30;
                this.buttons.push(
                    new Button(50, y, 200, 30, levels[i].name, () => { 
                        Application.popState();
                        Application.pushState(Playing(levels[i]));
                    }),
                    new Button(300, y, 70, height, "Delete", () => { 
                        Levels.removeLevel(i);
                        this.createButtons();
                    })
                );
            }
        }
    }
}
