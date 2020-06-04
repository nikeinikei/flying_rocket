import { KeyConstant } from "love.keyboard";

import { Button } from "./gui";
import { Levels } from "./levels";
import { Playing } from "./playing";
import { WrappedDrawable } from "./wrappeddrawable";

export class LevelPicker {
    private importButton: Button;
    private buttons: Button[];
    private levelsNotAvailableTextWrapped: WrappedDrawable;

    constructor() {
        this.buttons = [];
        let levelsNotAvailableText = love.graphics.newText(love.graphics.newFont(50), "no levels available");
        this.levelsNotAvailableTextWrapped = new WrappedDrawable(levelsNotAvailableText);
        this.importButton = new Button(50, 20, 400, 70, "Import Level", () => {
            love.window.showMessageBox("Import level", "to import a level just drop it into this window!", "info");
        });
        this.createButtons();
    }

    getObjects() {
        return [this.levelsNotAvailableTextWrapped, this.importButton];
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

    filedropped(file: File) {
        if (Levels.importLevelFromFile(file)) {
            this.createButtons();
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
                const y = 120 + i * 100;
                const height = 70;
                const index = i;
                this.buttons.push(
                    new Button(50, y, 400, height, levels[i].name, () => {
                        Application.popState();
                        Application.pushState(new Playing(level));
                    }),
                    new Button(500, y, 150, height, "Delete", () => {
                        Levels.removeLevel(level);
                        this.createButtons();
                    }),
                    new Button(700, y, 400, height, "Export", () => {
                        const fileName = Levels.exportLevel(level);
                        love.window.showMessageBox("Export successful", "successfully exported with file name " + fileName, "info");
                    })
                );
            }
        }
    }
}
