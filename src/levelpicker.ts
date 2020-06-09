import { Button } from "./gui";
import { LevelEditor } from "./leveleditor";
import { Levels } from "./levels";
import { Playing } from "./playing";
import { WrappedDrawable } from "./wrappeddrawable";
import { KeyConstant } from "love.keyboard";

export class LevelPicker {
    private static pageButtonCount = 6; 

    private importButton: Button;
    private pageIndex: number;
    private buttons: Button[][] | undefined;
    private levelsNotAvailableTextWrapped: WrappedDrawable;

    private forwardButton: Button;
    private backwardButton: Button;

    constructor() {
        this.pageIndex = 0;
        this.buttons = [];
        let levelsNotAvailableText = love.graphics.newText(love.graphics.newFont(50), "no levels available");
        this.levelsNotAvailableTextWrapped = new WrappedDrawable(levelsNotAvailableText);
        this.levelsNotAvailableTextWrapped.x = 20;
        this.levelsNotAvailableTextWrapped.y = 150;
        this.importButton = new Button(50, 20, 400, 70, "Import Level", () => {
            love.window.showMessageBox("Import level", "to import a level just drop it into this window!", "info");
        });
        this.createButtons();

        {
            const height = 30;
            const width = 70;

            const y = love.graphics.getHeight() - height - 20

            this.backwardButton = new Button(20, y, width, height, "<-", () => { this.pageIndex--; });
            this.forwardButton = new Button(love.graphics.getWidth() - width - 20, y, width, height, "->", () => { this.pageIndex++ });
        }
    }

    private currentButtons(): Button[] {
        if (this.buttons == undefined) {
            return [];
        } else {
            return this.buttons[this.pageIndex];
        }
    }

    getObjects() {
        return [this.levelsNotAvailableTextWrapped, this.importButton, this.backwardButton, this.forwardButton];
    }

    textinput(text: string) {
        for (const button of this.currentButtons()) {
            button.textinput(text);
        }
    }

    mousepressed(x: number, y: number, mouseButton: number, istouch: boolean, presses: number) {
        for (const button of this.currentButtons()) {
            button.mousepressed(x, y, mouseButton, istouch, presses);
        }
    }

    keypressed(key: KeyConstant, code: number, isrepeat: boolean) {
        for (const button of this.currentButtons()) {
            button.keypressed(key, code, isrepeat);
        }
        if (key == "escape") {
            Application.popState();
        }
    }

    update(dt: number) {
        for (const button of this.currentButtons()) {
            button.update(dt);
        }
        if (this.buttons) {
            if (this.pageIndex == 0) {
                this.backwardButton.disabled = true;
            } else {
                this.backwardButton.disabled = false;
            }

            if (this.pageIndex == this.buttons.length - 1) {
                this.forwardButton.disabled = true;
            } else {
                this.forwardButton.disabled = false;
            }
        } else {
            this.backwardButton.disabled = true;
            this.forwardButton.disabled = true;
        }
    }

    draw() {
        for (const button of this.currentButtons()) {
            button.draw();
        }
    }

    filedropped(file: File) {
        if (Levels.importLevelFromFile(file)) {
            this.createButtons();
        }
    }

    enter() {
        this.createButtons();
    }

    private createButtons() {
        this.buttons = undefined;

        const levels = Levels.getLevels();

        if (levels.length == 0) {
            this.levelsNotAvailableTextWrapped.visible = true;
        } else {
            const buttons = [];
            this.levelsNotAvailableTextWrapped.visible = false;
            let page: Button[] = [];
            for (let i = 0; i < levels.length; i++) {
                if (i % LevelPicker.pageButtonCount == 0) {
                    if (page.length > 0 ) {
                        buttons.push(page);
                        page = [];
                    }
                }
                const level = levels[i];
                const j = i % LevelPicker.pageButtonCount;
                const y = 120 + j * 100;
                const height = 70;
                page.push(
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

                        const fullPath =
                            love.filesystem.getAppdataDirectory() +
                            "/" +
                            "LOVE" +
                            "/" +
                            (love.filesystem.getIdentity as any)() +
                            "/" +
                            fileName;

                        love.window.showMessageBox("Export successful", "successfully exported to " + fullPath, "info");
                    }),
                    new Button(1200, y, 200, height, "Edit", () => {
                        Application.pushState(
                            new LevelEditor(level, _ => {
                                Levels.save();
                            })
                        );
                    })
                );
            }
            if (page.length > 0) {
                buttons.push(page);
            }
            this.buttons = buttons;
        }
    }
}
