import { Button } from "./gui";
import { KeyConstant } from "love.keyboard";

export class CampaignLevelPicker {
    private buttons: Button[];

    constructor() {
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

                this.buttons.push(
                    new Button(x, y, width, height, tostring(count), () => {
                        love.window.showMessageBox("Not Implemented yet", "The campaign doesn't have levels yet", "error");
                    })
                );

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
