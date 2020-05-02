import { Button } from "./gui";
const Levels: Levels = require("levels");

export interface Level {
    name: string;
    terrainPoints: number[];
    rocketStartingLocation: Rectangle | undefined;
    rocketLandingLocation: Rectangle | undefined;
}

enum Mode {
    TerrainBuilding,
    RocketStartingLocation,
    RocketLandingLocation,
    Inspection,
}

const locationNotSetErrorMessage = `
Rocket starting location or landing location were not set
These are mandatory for the level to be saved.
`;

const buttonSchemes = [
    {
        name: "Inspection",
        mode: Mode.Inspection,
    },
    {
        name: "Starting location",
        mode: Mode.RocketStartingLocation,
    },
    {
        name: "Landing location",
        mode: Mode.RocketLandingLocation,
    },
    {
        name: "Terrain",
        mode: Mode.TerrainBuilding,
    },
];

const rocketLocationWidth = 200;
const rocketLocationHeight = 20;

export class LevelBuilder {
    private level: Level;
    private buttons: Button[];
    private mode: Mode;
    private newMode: boolean;

    constructor(name: string) {
        this.level = {
            name: name,
            terrainPoints: [],
            rocketLandingLocation: undefined,
            rocketStartingLocation: undefined
        };
        this.mode = Mode.Inspection;
        this.newMode = false;
        this.buttons = [];
        {
            const startX = 10;
            const buttonHeight = 30;
            const buttonWidth = 200;
            const buttonPadding = 20;
            const distance = buttonWidth + buttonPadding;
            for (let i = 0; i < buttonSchemes.length; i++) {
                let scheme = buttonSchemes[i];
                let x = startX + i * distance;
                let y = 0;
                let w = buttonWidth;
                let h = buttonHeight;
                let text = scheme.name;
                let callback = () => {
                    if (this.mode != scheme.mode) {
                        this.mode = scheme.mode;
                        this.newMode = true;
                    }
                };
                this.buttons.push(new Button(x, y, w, h, text, callback));
            }
        }
        {
            const w = 150;
            const h = 30;
            const x = love.graphics.getWidth() - w - 20;
            const y = 0;
            const text = "save";
            const callback = () => {
                if (!this.level.rocketLandingLocation || !this.level.rocketStartingLocation) {
                    love.window.showMessageBox("unable to save", locationNotSetErrorMessage, "error");
                } else {
                    Levels.addLevel(this.level);
                    Application.popState();
                }
            };
            this.buttons.push(new Button(x, y, w, h, text, callback));
        }
    }

    update(dt: number) {
        for (const button of this.buttons) {
            button.update(dt);
        }
    }

    mousepressed(mouseX: number, mouseY: number, button: number, istouch: boolean, presses: number) {
        for (const b of this.buttons) {
            b.mousepressed(mouseX, mouseY, button, istouch, presses);
        }
        if (this.newMode == false) {
            switch (this.mode) {
                case Mode.TerrainBuilding:
                    if (button == 1) {
                        this.level.terrainPoints.push(mouseX, mouseY);
                    }
                    break;
                case Mode.RocketStartingLocation:
                    if (button == 1) {
                        if (this.level.rocketStartingLocation) {
                            this.level.rocketStartingLocation.x = mouseX;
                            this.level.rocketStartingLocation.y = mouseY;
                        } else {
                            this.level.rocketStartingLocation = {
                                x: mouseX,
                                y: mouseY,
                                w: rocketLocationWidth,
                                h: rocketLocationHeight
                            }
                        }
                        this.mode = Mode.Inspection;
                    }
                    break;
                case Mode.RocketLandingLocation:
                    if (button == 1) {
                        if (this.level.rocketLandingLocation) {
                            this.level.rocketLandingLocation.x = mouseX;
                            this.level.rocketLandingLocation.y = mouseY;
                        } else {
                            this.level.rocketLandingLocation = {
                                x: mouseX,
                                y: mouseY,
                                w: rocketLocationWidth,
                                h: rocketLocationHeight
                            }
                        }
                        this.mode = Mode.Inspection;
                    }
                    break;
            }
        }
        this.newMode = false;
    }

    draw() {
        const [mouseX, mouseY] = love.mouse.getPosition();
        if (this.level.terrainPoints.length >= 2) {
            if (this.mode == Mode.TerrainBuilding) {
                this.level.terrainPoints.push(mouseX, mouseY);
            }

            love.graphics.line(this.level.terrainPoints as any);

            if (this.mode == Mode.TerrainBuilding) {
                this.level.terrainPoints.pop();
                this.level.terrainPoints.pop();
            }
        }

        let rect = this.level.rocketStartingLocation;
        if (this.mode == Mode.RocketStartingLocation) {
            love.graphics.rectangle("fill", mouseX, mouseY, rocketLocationWidth, rocketLocationHeight);
        } else {
            if (rect) {
                love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h);
            }
        }

        rect = this.level.rocketLandingLocation;
        if (this.mode == Mode.RocketLandingLocation) {
            love.graphics.rectangle("fill", mouseX, mouseY, rocketLocationWidth, rocketLocationHeight);
        } else {
            if (rect) {
                love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h);
            }
        }

        for (const button of this.buttons) {
            button.draw()
        }
    }
}
