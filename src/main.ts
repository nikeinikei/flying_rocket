require("globals");
require("customerrorhandler");

import { CampaignLevels } from "./campaignLevels";
import { Menu } from "./menu";
import { Settings } from "./settings";

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
