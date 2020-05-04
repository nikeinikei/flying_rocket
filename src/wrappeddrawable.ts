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
    public visible: boolean;

    private drawable: Drawable;

    constructor(drawable: Drawable) {
        this.drawable = drawable;
        this.visible = true;
    }

    draw() {
        if (this.visible) {
            love.graphics.draw(this.drawable, this.x, this.y, this.r, this.sx, this.sy, this.ox, this.oy, this.kx, this.ky);
        }
    }
}