export class ScaledScreenshotter {
    private mainCanvas: Canvas;
    private scaledCanvas: Canvas;
    private drawFunction: (this:void) => void;
    private sx: number;
    private sy: number;

    constructor(width: number, height: number, drawFunction: (this:void) => void) {
        this.mainCanvas = love.graphics.newCanvas();
        this.scaledCanvas = love.graphics.newCanvas(width, height);
        this.drawFunction = drawFunction;

        this.sx = width / love.graphics.getWidth();
        this.sy = height / love.graphics.getHeight();
    }

    captureScreenshot() {
        this.mainCanvas.renderTo(() => {
            love.graphics.clear();
            love.graphics.setBlendMode("alpha");

            this.drawFunction();
        });

        this.scaledCanvas.renderTo(() => {
            love.graphics.clear();
            love.graphics.setBlendMode("alpha", "premultiplied");
            love.graphics.setColor(1, 1, 1, 1);

            love.graphics.draw(this.mainCanvas, 0, 0, 0, this.sx, this.sy);
        });

        love.graphics.setBlendMode("alpha");

        return this.scaledCanvas.newImageData();
    }
}
