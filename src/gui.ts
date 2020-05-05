import { KeyConstant } from "love.keyboard";

import { Color } from "./Color4";

const utf8: {
    offset(this: void, text: any, offset: any): any;
} = require("utf8");

const WeakCollectionConstructor: (this: void) => WeakCollection = require("weakcollection");

class Element {
    private static elements: WeakCollection = WeakCollectionConstructor();

    public x: number;
    public y: number;
    public w: number;
    public h: number;
    public hovered: boolean;
    public focused: boolean;

    constructor(x: number, y: number, w: number, h: number) {
        Element.elements.add(this);
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.hovered = false;
        this.focused = false;
    }

    textinput(_text: string) {}

    mousepressed(x: number, y: number, button: number, _istouch: boolean, _presses: number) {}

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
        this.text = love.graphics.newText(font, text);
        this.textX = x + (w - this.text.getWidth()) / 2;
        this.textY = y + (h - this.text.getHeight()) / 2;
        this.baseColor = new Color(1, 0, 1, 1);
        this.hoveredColor = new Color(0.933, 0.51, 0.933, 1);
        this.callback = callback;
    }

    mousepressed(x: number, y: number, button: number, istouch: boolean, presses: number) {
        super.mousepressed(x, y, button, istouch, presses);
        if (this.hovered && this.callback) {
            this.callback();
        }
    }

    draw() {
        super.draw();
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

        this.promptText = love.graphics.newText(font, prompt);
        let promptTextWidth = this.promptText.getWidth();
        this.promptTextPosition = {
            x: x + (w - promptTextWidth) / 2,
            y: y + TextInput.promptPaddingPercentage * h,
        };

        this.inputText = love.graphics.newText(font, "");
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

    keypressed(key: KeyConstant, code: number, isrepeat: boolean) {
        super.keypressed(key, code, isrepeat);
        if (key == "backspace") {
            let offset: number | null = utf8.offset(this.inputTextScrape, -1);

            if (offset) {
                this.inputTextScrape = string.sub(this.inputTextScrape, 1, offset - 1);
                this.inputText.set(this.inputTextScrape);
                this.recalculatePosition();
            }
        }
        if (key == "return") {
            this.callback(this.inputTextScrape);
        }
    }

    textinput(text: string) {
        super.textinput(text);
        this.inputTextScrape = this.inputTextScrape + text;
        this.inputText.set(this.inputTextScrape);
        this.recalculatePosition();
    }

    draw() {
        super.draw();
        love.graphics.setColor(160 / 255, 32 / 255, 240 / 255, 1);
        love.graphics.rectangle("fill", this.x, this.y, this.w, this.h);
        love.graphics.setColor(1, 1, 1, 1);
        love.graphics.draw(this.promptText, this.promptTextPosition.x, this.promptTextPosition.y);
        love.graphics.draw(this.inputText, this.inputTextPosition.x, this.inputTextPosition.y);
    }
}
