require("globals");

let Menu = require("menu");

love.load = () => {
    Application.pushState(Menu());
};
