require("globals");
require("customerrorhandler");

import { CampaignLevels } from "./campaignLevels";
import { Menu } from "./menu";
import { Settings } from "./settings";
import { RecreateApplication } from "./debug/recreateApplication";

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
