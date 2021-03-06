import { Rocket } from "./rocket";

export class PlayingCamera {
    private rocket: Rocket;

    private tx: number;
    private ty: number;

    constructor(rocket: Rocket) {
        this.rocket = rocket;

        this.tx = 0;
        this.ty = 0;
    }

    /** @tupleReturn */
    public getTranslation(): [number, number] {
        return [this.tx, this.ty];
    }

    /** @tupleReturn */
    public getViewport(): [number, number, number, number] {
        return [this.tx, this.ty, love.graphics.getWidth(), love.graphics.getHeight()];
    }

    update(dt: number) {
        let [rocketX, rocketY] = this.rocket.getPosition();
        let [windowWidth, windowHeight] = love.graphics.getDimensions();

        this.tx = rocketX - windowWidth / 2;
        this.ty = rocketY - windowHeight / 2;
    }

    apply() {
        love.graphics.translate(-this.tx, -this.ty);
    }
}
