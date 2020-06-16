import { Menu } from "./menu";
import { Settings } from "./settings";

require("globals");
require("customerrorhandler");

function parseArgs(args: string[]) {
    for (const arg of args) {
        if (arg == "--dev") {
            Settings.setDevelopment(true);
        }
    }
}

love.load = args => {
    parseArgs(args);

    Application.pushState(new Menu());
};
