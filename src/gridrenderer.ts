import { Color } from "./Color4";
import { LevelEditorCamera } from "./leveleditorcamera";

const highlightedLineWidth = 7;
const normalLineWidth = 2.5;
const highlightedColor = new Color(0, 0, 1);
const normalColor = new Color(1, 1, 1);

export class GridRenderer {
    private length: number;
    private camera: LevelEditorCamera;

    constructor(length: number, camera: LevelEditorCamera) {
        this.length = length;
        this.camera = camera;
    }

    draw() {
        const [tx, ty, viewportWidth, viewportHeight] = this.camera.getViewport();

        const lastX = tx + viewportWidth;
        const firstX = math.floor(tx / this.length) * this.length;
        let currentX = firstX;
        while (currentX <= lastX) {
            const useThickerLine = currentX == 0;
            if (useThickerLine) {
                love.graphics.setColor(highlightedColor.unpacked());
                love.graphics.setLineWidth(highlightedLineWidth);
            } else {
                love.graphics.setColor(normalColor.unpacked());
                love.graphics.setLineWidth(normalLineWidth);
            }

            love.graphics.line(currentX, ty, currentX, ty + viewportHeight);
            currentX += this.length;
        }

        const lastY = ty + viewportHeight;
        const firstY = math.floor(ty / this.length) * this.length;
        let currentY = firstY;
        while (currentY <= lastY) {
            const useThickerLine = currentY == 0;
            if (useThickerLine) {
                love.graphics.setColor(highlightedColor.unpacked());
                love.graphics.setLineWidth(highlightedLineWidth);
            } else {
                love.graphics.setColor(normalColor.unpacked());
                love.graphics.setLineWidth(normalLineWidth);
            }

            love.graphics.line(tx, currentY, tx + viewportWidth, currentY);
            currentY += this.length;
        }
    }
}
