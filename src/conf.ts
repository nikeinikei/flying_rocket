/**
 * workaround for https://github.com/love2d/love/issues/1590
 */
require("love.font");

const loveWindow: typeof import("love.window") = require("love.window");

const display = 1;
const [desktopWidth, desktopHeight] = loveWindow.getDesktopDimensions(display);

const availableDimensions = [
    {
        w: 1920,
        h: 1080,
    },
    {
        w: 1600,
        h: 900,
    },
    {
        w: 1360,
        h: 768,
    },
    {
        w: 1280,
        h: 720,
    },
    {
        w: 800,
        h: 600,
    },
];

let windowWidth = 0,
    windowHeight = 0;
for (const availableDimension of availableDimensions) {
    if (availableDimension.w < desktopWidth && availableDimension.h < desktopHeight) {
        windowWidth = availableDimension.w;
        windowHeight = availableDimension.h;
        break;
    }
}

if (windowWidth == 0 && windowHeight == 0) {
    error("your monitor is too small");
}

love.conf = t => {
    t.version = "11.3";
    t.identity = "flying_rocket";

    t.window.width = windowWidth;
    t.window.height = windowHeight;
    t.window.msaa = 8;
    t.window.display = display;
    t.window.resizable = false;
};
