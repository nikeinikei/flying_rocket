import { KeyConstant } from "love.keyboard";

export class Won {
    private text: Text;
    private textPosition: Vector;

    constructor() {
        this.text = love.graphics.newText(love.graphics.newFont(40), "Congratulations, you won!");
        this.textPosition = {
            x: (love.graphics.getWidth() - this.text.getWidth()) / 2,
            y: (love.graphics.getHeight() - this.text.getHeight()) / 2,
        };
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            Application.popState();
        }
    }

    draw() {
        love.graphics.draw(this.text, this.textPosition.x, this.textPosition.y);
    }
}
