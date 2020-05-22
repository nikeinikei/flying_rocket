import { KeyConstant } from "love.keyboard";

interface CameraControlKeycodes {
    up: KeyConstant;
    right: KeyConstant;
    down: KeyConstant;
    left: KeyConstant;
}

export class Camera {
    /**
     * translation in x direction
     */
    protected tx: number;

    /**
     * translation in y direction
     */
    protected ty: number;

    protected cameraSpeed: Vector;

    protected cameraControlKeycodes: CameraControlKeycodes;

    constructor() {
        this.tx = 0;
        this.ty = 0;
        this.cameraSpeed = {
            x: 300,
            y: 300,
        };
        this.cameraControlKeycodes = {
            up: "down",
            right: "right",
            down: "up",
            left: "left",
        };
    }

    /** @tupleReturn */
    getTranslation(): [number, number] {
        return [-this.tx, -this.ty];
    }

    update(dt: number) {
        let dx = this.cameraSpeed.x * dt;
        let dy = this.cameraSpeed.y * dt;
        let x = 0;
        let y = 0;
        if (love.keyboard.isDown(this.cameraControlKeycodes.up)) {
            y = 1;
        }
        if (love.keyboard.isDown(this.cameraControlKeycodes.down)) {
            y -= 1;
        }
        if (love.keyboard.isDown(this.cameraControlKeycodes.right)) {
            x = 1;
        }
        if (love.keyboard.isDown(this.cameraControlKeycodes.left)) {
            x -= 1;
        }

        this.tx -= x * dx;
        this.ty -= y * dy;
    }

    apply() {
        love.graphics.translate(this.tx, this.ty);
    }

    /** @tupleReturn */
    convertScreencoordinatesToWorldCoordinates(x: number, y: number): [number, number] {
        return [x - this.tx, y - this.ty];
    }
}
