import { KeyConstant } from "love.keyboard";

import { CampaignLevels } from "./campaignLevels";
import { Button } from "./gui";
import { Level } from "./level";
import { Playing } from "./playing";
import { Serializable, Serialized } from "./types/Serializable";
import { GameState } from "./gamestate";

export class CampaignLevelPicker extends GameState implements Serializable {
    private buttons: Button[];
    private campaignLevels: Table<string, Level>;

    constructor() {
        super();
        this.campaignLevels = CampaignLevels.getLevels();
        this.buttons = [];
        this.buttons = [];
        const rows = 4;
        const cols = 4;

        const startX = 100;
        const startY = 100;

        const width = 100;
        const height = 100;

        const padding = 200;

        let count = 1;
        for (let i = 0; i < rows; i++) {
            for (let j = 0; j < cols; j++) {
                let x = startX + padding * j;
                let y = startY + padding * i;

                const currentCount = count;

                const countAsString = tostring(currentCount);
                let level = this.campaignLevels.get(countAsString);
                const button = new Button(x, y, width, height, tostring(count), () => {
                    const level = this.campaignLevels.get(countAsString);
                    if (level) {
                        Application.pushState(new Playing(level));
                    } else {
                        error("this shouldn't happen");
                    }
                });
                if (!level) {
                    button.disabled = true;
                }

                this.buttons.push(button);

                count++;
            }
        }
    }

    getName() {
        return "CampaignLevelPicker";
    }

    serialize(): Serialized {
        return { name: "CampaignLevelPicker" };
    }

    getObjects() {
        return this.buttons;
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            Application.popState();
        }
    }

    filedropped(file: File) {
        const number = CampaignLevels.importLevelFromFile(file);
        if (!number) {
            love.window.showMessageBox(
                "Error while importing",
                "something went wrong while importing this campaign level",
                "error"
            );
        } else {
            this.buttons[number - 1].disabled = false;
        }
    }
}
