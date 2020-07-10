import { KeyConstant } from "love.keyboard";

import { Playing } from "./playing";
import { GameState } from "./gamestate";

export class Paused extends GameState {
    private playing: Playing;
    private onUnpaused: (this: void) => void;

    constructor(playing: Playing, onUnpaused: (this: void) => void) {
        super();
        this.playing = playing;
        this.onUnpaused = onUnpaused;
    }

    getName() {
        return "Paused";
    }

    private resume() {
        Application.popState();
        this.onUnpaused();
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            this.resume();
        }
    }

    draw() {
        love.graphics.setColor(1, 1, 1, 1);
        this.playing.draw();
        const grey = 0.8;
        love.graphics.setColor(grey, grey, grey, grey);
        love.graphics.origin();
        love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight());
    }
}
