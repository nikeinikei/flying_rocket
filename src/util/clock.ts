import { setFullscreen } from "love.window";

export class Clock {
    private startTime: number;
    private pauseTime: number | null;

    constructor() {
        this.startTime = love.timer.getTime();
        this.pauseTime = null;
    }

    pause() {
        this.pauseTime = love.timer.getTime();
    }

    getElapsed() {
        if (this.pauseTime) {
            return this.pauseTime - this.startTime;
        } else {
            return love.timer.getTime() - this.startTime;
        }
    }

    resume() {
        let elapsed = this.getElapsed();
        this.startTime = love.timer.getTime() - elapsed;
        this.pauseTime = null;
    }

    restart() {
        const elapsed = this.getElapsed();
        this.startTime = love.timer.getTime();
        return elapsed;
    }
}
