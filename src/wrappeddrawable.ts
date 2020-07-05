import { Color } from "./Color4";

export class WrappedDrawable {
    public x: number | undefined;
    public y: number | undefined;
    public r: number | undefined;
    public sx: number | undefined;
    public sy: number | undefined;
    public ox: number | undefined;
    public oy: number | undefined;
    public kx: number | undefined;
    public ky: number | undefined;
    public color: Color | undefined;
    public visible: boolean;

    private drawable: Drawable;

    constructor(drawable: Drawable) {
        this.drawable = drawable;
        this.visible = true;
    }

    draw() {
        if (this.visible) {
            if (this.color) {
                love.graphics.setColor(this.color.unpacked());
            } else {
                love.graphics.setColor(1, 1, 1, 1);
            }
            love.graphics.draw(
                this.drawable,
                this.x,
                this.y,
                this.r,
                this.sx,
                this.sy,
                this.ox,
                this.oy,
                this.kx,
                this.ky
            );
        }
    }
}
