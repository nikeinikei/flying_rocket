import { KeyConstant } from "love.keyboard";

export class Lost {
    private text: Text;
    private textPosition: Position;

    constructor() {
        this.text = love.graphics.newText(love.graphics.newFont(40), "You lost");
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
