export namespace ImageUtils {
    export function scaleImageToDimensions(image: Image, desiredWidth: number, desiredHeight: number): Image {
        const canvas = love.graphics.newCanvas(desiredWidth, desiredHeight);
        const [imageWidth, imageHeight] = image.getDimensions();
        const [sx, sy] = [desiredWidth / imageWidth, desiredHeight / imageHeight];
        canvas.renderTo(() => {
            love.graphics.draw(image, 0, 0, 0, sx, sy);
        });
        return love.graphics.newImage(canvas.newImageData());
    }
}
