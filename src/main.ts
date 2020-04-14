declare module Application {
    function pushState(this: void, state: any): void;
    function popState(this: void): void;
}

require("globals");

let Menu = require("menu");

love.load = () => {
    Application.pushState(Menu());
};
