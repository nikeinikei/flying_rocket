import { KeyConstant } from "love.keyboard";
import { setFullscreen } from "love.window";

import { Color } from "./Color4";

const utf8: any = require("utf8");

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

    textinput(_text: string) {}

    mousepressed(_x: number, _y: number, _button: number, _istouch: boolean, _presses: number) {}

    keypressed(_key: KeyConstant, _code: number, _isrepeat: boolean) {}

    update(_dt: number) {
        let [x, y] = love.mouse.getPosition();
        if (this.x <= x && x <= this.x + this.w && this.y <= y && y <= this.y + this.h) {
            this.hovered = true;
        } else {
            this.hovered = false;
        }
    }

    draw() {}
}

export class Button extends Element {
    private text: Text;
    private textX: number;
    private textY: number;
    public baseColor: Color;
    public hoveredColor: Color;
    public callback: ((this: void) => void) | null;

    constructor(x: number, y: number, w: number, h: number, text: string, callback: ((this: void) => void) | null) {
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
    private static promptPaddingPercentage = 0.05;
    private static promptHeightPercentage = 0.3;
    private static inputHeightPadding = 0.1;

    private promptText: Text;
    private promptTextPosition: { x: number; y: number };

    private inputText: Text;
    private inputTextPosition: { x: number; y: number };

    private inputTextScrape: string;
    private callback: (this: void, text: string) => void;

    constructor(
        x: number,
        y: number,
        w: number,
        h: number,
        prompt: string,
        callback: (this: void, text: string) => void
    ) {
        super(x, y, w, h);

        let fontSize = TextInput.promptHeightPercentage * h;
        let font = love.graphics.newFont(fontSize);

        this.promptText = love.graphics.newText(font, prompt) as Text;
        let promptTextWidth = this.promptText.getWidth();
        this.promptTextPosition = {
            x: x + (w - promptTextWidth) / 2,
            y: y + (TextInput.promptPaddingPercentage * h),
        };

        this.inputText = love.graphics.newText(font, "") as Text;
        this.inputTextPosition = {
            x: x + w / 2,
            y:
                y +
                (TextInput.promptPaddingPercentage + TextInput.promptHeightPercentage + TextInput.inputHeightPadding) *
                    h,
        };

        this.inputTextScrape = "";
        this.callback = callback;
    }

    private recalculatePosition() {
        let width = this.inputText.getWidth();
        this.inputTextPosition.x = this.x + (this.w - width) / 2;
    }

    keypressed(key: KeyConstant, _code: number, _isrepeat: boolean) {
        if (key == "backspace") {
            let offset: number | null = utf8.offset(this.inputTextScrape, -1);

            if (offset) {
                this.inputTextScrape = string.sub(this.inputTextScrape, 1, offset);
                this.inputText.set(this.inputTextScrape);
                this.recalculatePosition();
            }
        }
        if (key == "return") {
            this.callback(this.inputTextScrape);
        }
    }

    textinput(text: string) {
        this.inputTextScrape = this.inputTextScrape + text;
        this.inputText.set(this.inputTextScrape);
        this.recalculatePosition();
    }

    draw() {
        love.graphics.setColor(160 / 255, 32 / 255, 240 / 255, 1);
        love.graphics.rectangle("fill", this.x, this.y, this.w, this.h);
        love.graphics.setColor(1, 1, 1, 1);
        love.graphics.draw(this.promptText, this.promptTextPosition.x, this.promptTextPosition.y);
        love.graphics.draw(this.inputText, this.inputTextPosition.x, this.inputTextPosition.y);
    }
}
