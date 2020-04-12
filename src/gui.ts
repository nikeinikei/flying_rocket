import { KeyConstant } from "love.keyboard";
import { Color } from "./Color4";

class Element {
    public x: number;
    public y: number;
    public w: number;
    public h: number;
    public hovered: boolean;

    constructor(x: number, y: number, w: number, h: number) {
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.hovered = false;
    }

    mousepressed(_x: number, _y: number, _button: number, _istouch: boolean, _presses: number) {
    }

    keypressed(_key: KeyConstant, _code: number, _isrepeat: boolean) {
    }

    update(_dt: number) {
        let [x, y] = love.mouse.getPosition();
        if (this.x <= x && x <= this.x + this.w && this.y <= y && y <= this.y + this.h) {
            this.hovered = true;
        } else {
            this.hovered = false;
        }
    }

    draw() {
    }
}

export class Button extends Element {
    private text: Text;
    private textX: number;
    private textY: number;
    public baseColor: Color;
    public hoveredColor: Color;
    public callback: ((this:void) => void) | null;

    constructor(x: number, y: number, w: number, h: number, text: string, callback: ((this:void) => void) | null) {
        super(x, y, w, h);
        let font = love.graphics.newFont(h / 1.5);
        this.text = love.graphics.newText(font, text) as Text;
        this.textX = x + (w - this.text.getWidth()) / 2;
        this.textY = y + (h - this.text.getHeight()) / 2;
        this.baseColor = new Color(1, 0, 1, 1);
        this.hoveredColor = new Color(0.933, 0.51, 0.933, 1);
        this.callback = callback;
    }

    mousepressed(_x: number, _y: number, _button: number, _istouch: boolean, _presses: number) {
        if (this.hovered && this.callback) {
            this.callback();
        }
    }

    draw() {
        if (this.hovered) {
            love.graphics.setColor(this.baseColor.unpacked());
        } else {
            love.graphics.setColor(this.hoveredColor.unpacked());
        }
        love.graphics.rectangle("fill", this.x, this.y, this.w, this.h);
        love.graphics.setColor(1, 1, 1, 1);
        love.graphics.draw(this.text, this.textX, this.textY);
    }
}

export class TextInput extends Element {
    constructor(x: number, y: number, w: number, h: number) {
        super(x, y, w, h);
    }
}