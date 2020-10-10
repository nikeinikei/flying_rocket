import { KeyConstant } from "love.keyboard";

import { AIPlayingSession } from "./ai/aiplayingsession";
import { Levels } from "./fs/levels";
import { GameState } from "./gamestate";
import { Button } from "./gui";
import { Level, copyLevel } from "./level";
import { LevelEditor } from "./leveleditor";
import { Playing } from "./playing";
import { RecordingSession } from "./ai/recordingsession";
import { Serializable, Serialized } from "./types/Serializable";
import { WrappedDrawable } from "./wrappeddrawable";

export class LevelPicker extends GameState implements Serializable {
    private static pageButtonCount = 6;

    private importButton: Button;
    private openSaveDirectoryButton: Button;
    private pageIndex: number;
    private buttons: Button[][] | undefined;
    private levelsNotAvailableTextWrapped: WrappedDrawable;
    private aiDescriptiveTextWrapped: WrappedDrawable;

    private forwardButton: Button;
    private backwardButton: Button;
    private editedLevelIndex: number | undefined = undefined;

    constructor(pageIndex?: number) {
        super();
        this.pageIndex = pageIndex ?? 0;
        this.buttons = [];
        let levelsNotAvailableText = love.graphics.newText(love.graphics.newFont(50), "no levels available");
        this.levelsNotAvailableTextWrapped = new WrappedDrawable(levelsNotAvailableText);
        this.levelsNotAvailableTextWrapped.x = 20;
        this.levelsNotAvailableTextWrapped.y = 150;
        this.importButton = new Button(50, 20, 400, 70, "Import Level", () => {
            love.window.showMessageBox("Import level", "to import a level just drop it into this window!", "info");
        });
        this.openSaveDirectoryButton = new Button(500, 20, 400, 70, "Open save folder", () => {
            love.system.openURL("file://" + love.filesystem.getSaveDirectory());
        });
        this.createButtons();

        {
            const height = 30;
            const width = 70;

            const y = love.graphics.getHeight() - height - 20;

            this.backwardButton = new Button(20, y, width, height, "<-", () => {
                this.pageIndex--;
            });
            this.forwardButton = new Button(love.graphics.getWidth() - width - 20, y, width, height, "->", () => {
                this.pageIndex++;
            });
        }

        const aiDescriptiveText = love.graphics.newText(love.graphics.newFont(10), "lshift to start a recording session, lalt to let the ai play");
        this.aiDescriptiveTextWrapped = new WrappedDrawable(aiDescriptiveText);
        this.aiDescriptiveTextWrapped.x = love.graphics.getWidth() - 5 - aiDescriptiveText.getWidth();
        this.aiDescriptiveTextWrapped.y = love.graphics.getHeight() - 5 - aiDescriptiveText.getHeight();
    }

    getName() {
        return "LevelPicker";
    }

    serialize(): Serialized {
        return { name: "LevelPicker", page: this.pageIndex };
    }

    private currentButtons(): Button[] {
        if (this.buttons == undefined) {
            return [];
        } else {
            return this.buttons[this.pageIndex];
        }
    }

    getObjects() {
        return [
            this.levelsNotAvailableTextWrapped,
            this.importButton,
            this.backwardButton,
            this.forwardButton,
            this.openSaveDirectoryButton,
            this.aiDescriptiveTextWrapped
        ];
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

    onActive(data?: any) {
        super.onActive(data);
        if (this.editedLevelIndex && data) {
            const levels: Level[] = Levels.getLevels();
            const editedLevel: Level = data;
            levels[this.editedLevelIndex] = editedLevel;
            this.editedLevelIndex = undefined;
        }
        Levels.save();
        this.createButtons();
    }

    private createButtons() {
        this.buttons = undefined;

        const levels = Levels.getLevels();

        if (levels.length == 0) {
            this.levelsNotAvailableTextWrapped.show = true;
        } else {
            const buttons = [];
            this.levelsNotAvailableTextWrapped.show = false;
            let page: Button[] = [];
            for (let i = 0; i < levels.length; i++) {
                if (i % LevelPicker.pageButtonCount == 0) {
                    if (page.length > 0) {
                        buttons.push(page);
                        page = [];
                    }
                }
                const index = i;
                const level = levels[i];
                const j = i % LevelPicker.pageButtonCount;
                const y = 120 + j * 100;
                const height = 70;
                page.push(
                    new Button(50, y, 400, height, levels[i].name, () => {
                        if (love.keyboard.isDown("lctrl")) {
                            Application.pushState(new RecordingSession(level));
                        } else if (love.keyboard.isDown("lalt")) {
                            Application.pushState(new AIPlayingSession(level));
                        } else {
                            Application.pushState(new Playing(level));
                        }
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
                            love.filesystem.getIdentity() +
                            "/" +
                            fileName;

                        love.window.showMessageBox("Export successful", "successfully exported to " + fullPath, "info");
                    }),
                    new Button(1200, y, 200, height, "Edit", () => {
                        const copy = copyLevel(level);
                        this.editedLevelIndex = index;
                        Application.pushState(new LevelEditor(copy));
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
