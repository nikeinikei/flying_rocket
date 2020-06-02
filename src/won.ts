import { KeyConstant } from "love.keyboard";

export interface GameEndMetrics {
    timeTaken: number;
}

export class Won {
    private text: Text;
    private textPosition: Vector;
    private timeTakenText: Text;
    private timeTakenTextPosition: Vector;
    private metrics: GameEndMetrics;

    constructor(metrics: GameEndMetrics) {
        this.text = love.graphics.newText(love.graphics.newFont(40), "Congratulations, you won!");
        this.textPosition = {
            x: (love.graphics.getWidth() - this.text.getWidth()) / 2,
            y: (love.graphics.getHeight() - this.text.getHeight()) / 2,
        };
        this.metrics = metrics;
        this.timeTakenText = love.graphics.newText(love.graphics.newFont(40), tostring(this.metrics.timeTaken));
        this.timeTakenTextPosition = {
            x: (love.graphics.getWidth() - this.timeTakenText.getWidth()) / 2,
            y: (this.textPosition.y + 40)
        };
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            Application.popState();
        }
    }

    draw() {
        love.graphics.draw(this.text, this.textPosition.x, this.textPosition.y);
        love.graphics.draw(this.timeTakenText, this.timeTakenTextPosition.x, this.timeTakenTextPosition.y);
    }
}
