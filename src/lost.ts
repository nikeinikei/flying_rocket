import { KeyConstant } from "love.keyboard";
import { GameState } from "./gamestate";

export class Lost extends GameState {
    private text: Text;
    private textPosition: Vector;

    constructor() {
        super();
        this.text = love.graphics.newText(love.graphics.newFont(40), "You lost");
        this.textPosition = {
            x: (love.graphics.getWidth() - this.text.getWidth()) / 2,
            y: (love.graphics.getHeight() - this.text.getHeight()) / 2,
        };
    }

    getName() {
        return "Lost";
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
