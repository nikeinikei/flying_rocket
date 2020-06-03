import { KeyConstant } from "love.keyboard";

import { CampaignLevels } from "./campaignLevels";
import { Button } from "./gui";
import { Level } from "./levelbuilder";
import { Playing } from "./playing";

export class CampaignLevelPicker {
    private buttons: Button[];
    private campaignLevels: Table<string, Level>;

    constructor() {
        this.campaignLevels = CampaignLevels.getLevels();

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

                let level = this.campaignLevels.get(tostring(currentCount));
                const button = new Button(x, y, width, height, tostring(count), () => {
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

    getObjects() {
        return this.buttons;
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            Application.popState();
        }
    }
}
