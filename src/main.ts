import { Menu } from "./menu";

require("globals");

love.load = () => {
    Application.pushState(new Menu());
};
