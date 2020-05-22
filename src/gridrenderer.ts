import { Camera } from "./camera";

export class GridRenderer {
    private length: number;
    private camera: Camera;

    constructor(length: number, camera: Camera) {
        this.length = length;
        this.camera = camera;
    }

    draw() {
        const [tx, ty] = this.camera.getTranslation();
        const [windowWidth, windowHeight] = love.graphics.getDimensions();

        const lastX = tx + windowWidth;
        const firstX = (math.floor(tx / this.length) + 1) * this.length;
        let currentX = firstX;
        while (currentX <= lastX) {
            love.graphics.line(currentX, ty, currentX, ty + windowHeight)
            currentX += this.length;
        }

        const lastY = ty + windowHeight;
        const firstY = (math.floor(ty / this.length) + 1) * this.length;
        let currentY = firstY;
        while (currentY <= lastY) {
            love.graphics.line(tx, currentY, tx + windowWidth, currentY);
            currentY += this.length;
        }
    }
}