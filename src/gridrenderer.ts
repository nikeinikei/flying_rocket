import { Camera } from "./camera";

const highlightedLineWidth = 5;
const normalLineWidth = 1;

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
            const useThickerLine = currentX == 0;
            if (useThickerLine) {
                love.graphics.setLineWidth(highlightedLineWidth);
            } else {
                love.graphics.setLineWidth(normalLineWidth);
            }

            love.graphics.line(currentX, ty, currentX, ty + windowHeight)
            currentX += this.length;
        }

        const diff = windowHeight % this.length;
        const highestY = ty + windowHeight;
        const offset = (highestY - diff) % this.length;
        const firstY = offset == 0 ? highestY : highestY - offset;
        const lastY = ty;
        let currentY = firstY;
        while (currentY >= lastY) {
            const useThickerLine = currentY == windowHeight;
            if (useThickerLine) {
                love.graphics.setLineWidth(highlightedLineWidth);
            } else {
                love.graphics.setLineWidth(normalLineWidth);
            }

            love.graphics.line(tx, currentY, tx + windowWidth, currentY);
            currentY -= this.length;
        }
    }
}