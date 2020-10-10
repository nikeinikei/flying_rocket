require("love.font");
require("love.window");

love.conf = t => {
    t.identity = "flying_rocket";

    const desiredWidth = 1400;
    const desiredHeight = 800;
    const [windowWidth, windowHeight] = love.window.getDesktopDimensions(1);
    if (desiredWidth >= windowWidth || desiredHeight >= windowHeight) {
        t.window.width = 800;
        t.window.height = 600;
    } else {
        t.window.width = desiredWidth;
        t.window.height = desiredHeight;
    }

    t.window.minwidth = 800;
    t.window.minheight = 600;
    t.window.msaa = 4;
    t.window.resizable = true;
};
