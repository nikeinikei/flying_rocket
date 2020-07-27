require("globals");
require("customerrorhandler");

import { CampaignLevels } from "./fs/campaignLevels";
import { RecreateApplication } from "./debug/recreateApplication";
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

    const states = RecreateApplication.attempt();
    if (states) {
        for (const state of states) {
            Application.pushState(state);
        }
    } else {
        Application.pushState(new Menu());
    }
};
