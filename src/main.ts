require("globals");
require("customerrorhandler");

import { Menu } from "./menu";
import { Settings } from "./settings";
import { CampaignLevels } from "./campaignLevels";

function parseArgs(args: string[]) {
    for (const arg of args) {
        if (arg == "--dev") {
            Settings.setDevelopment(true);
        }
    }
}

love.load = args => {
    parseArgs(args);

    CampaignLevels.init();

    Application.pushState(new Menu());
};
