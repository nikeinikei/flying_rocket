import { KeyConstant } from "love.keyboard";
import { updateSmoothValue } from "./util/smoothvalue";

interface CameraControlKeycodes {
    up: KeyConstant;
    right: KeyConstant;
    down: KeyConstant;
    left: KeyConstant;
}

export class LevelEditorCamera {
    private static minimumScaleFactor = 0.1;
    private static maximumScaleFactor = 1.5;

    /**
     * translation in x direction
     */
    protected tx: number;

    /**
     * translation in y direction
     */
    protected ty: number;

    private targetScaleFactor: number;

    private scaleFactor: number;

    protected cameraSpeed: Vector;

    protected cameraControlKeycodes: CameraControlKeycodes;

    constructor() {
        this.tx = 0;
        this.ty = 0;
        this.scaleFactor = 1;
        this.targetScaleFactor = 1;
        this.cameraSpeed = {
            x: 600,
            y: 600,
        };
        this.cameraControlKeycodes = {
            up: "down",
            right: "right",
            down: "up",
            left: "left",
        };
    }

    scale(factor: number) {
        this.targetScaleFactor += factor;
        this.targetScaleFactor = math.max(math.min(this.targetScaleFactor, LevelEditorCamera.maximumScaleFactor), LevelEditorCamera.minimumScaleFactor);
    }

    /** @tupleReturn */
    getViewport(): [number, number, number, number] {
        return [-love.graphics.getWidth() / (2 * this.scaleFactor) - this.tx, -love.graphics.getHeight() / (2 * this.scaleFactor) - this.ty, love.graphics.getWidth() / this.scaleFactor, love.graphics.getHeight() / this.scaleFactor];
    }

    update(dt: number) {
        this.scaleFactor = updateSmoothValue(this.scaleFactor, this.targetScaleFactor, 10, dt);

        const grabbed = love.mouse.isGrabbed();
        const [mouseX, mouseY] = love.mouse.getPosition();

        let dx = this.cameraSpeed.x * dt;
        let dy = this.cameraSpeed.y * dt;
        let x = 0;
        let y = 0;
        if (love.keyboard.isDown(this.cameraControlKeycodes.up) || grabbed && mouseY >= love.graphics.getHeight() - 1 ) {
            y = 1;
        }
        if (love.keyboard.isDown(this.cameraControlKeycodes.down) || grabbed && mouseY == 0) {
            y -= 1;
        }
        if (love.keyboard.isDown(this.cameraControlKeycodes.right) || grabbed && mouseX >= love.graphics.getWidth() - 1) {
            x = 1;
        }
        if (love.keyboard.isDown(this.cameraControlKeycodes.left) || grabbed && mouseX == 0) {
            x -= 1;
        }

        this.tx -= x * dx / this.scaleFactor;
        this.ty -= y * dy / this.scaleFactor;
    }
    
    apply() {
        love.graphics.translate(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2);
        love.graphics.scale(this.scaleFactor, this.scaleFactor);
        love.graphics.translate(this.tx, this.ty);
    }
}
