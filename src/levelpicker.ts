import { KeyConstant } from "love.keyboard";

import { Button } from "./gui";
import { Playing } from "./playing";
import { WrappedDrawable } from "./wrappeddrawable";
import { Levels } from "./levels";

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
        return [this.levelsNotAvailableTextWrapped];
    }

    textinput(text: string) {
        for (const button of this.buttons) {
            button.textinput(text);
        }
    }

    mousepressed(x: number, y: number, mouseButton: number, istouch: boolean, presses: number) {
        for (const button of this.buttons) {
            button.mousepressed(x, y, mouseButton, istouch, presses);
        }
    }

    keypressed(key: KeyConstant, code: number, isrepeat: boolean) {
        for (const button of this.buttons) {
            button.keypressed(key, code, isrepeat);
        }
        if (key == "escape") {
            Application.popState();
        }
    }

    update(dt: number) {
        for (const button of this.buttons) {
            button.update(dt);
        }
    }

    draw() {
        for (const button of this.buttons) {
            button.draw();
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
                const level = levels[i];
                const y = 50 + i * 100;
                const height = 70;
                this.buttons.push(
                    new Button(50, y, 400, height, levels[i].name, () => {
                        Application.popState();
                        Application.pushState(new Playing(level));
                    }),
                    new Button(500, y, 150, height, "Delete", () => {
                        Levels.removeLevel(i);
                        this.createButtons();
                    })
                );
            }
        }
    }
}
