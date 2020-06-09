import { KeyConstant } from "love.keyboard";

import { GridRenderer } from "./gridrenderer";
import { Button } from "./gui";
import { LevelBuilderCamera } from "./levelbuildercamera";

export interface Level {
    dataVersion: string;
    name: string;
    terrainPoints: number[][];
    rocketStartingLocation: Rectangle | undefined;
    rocketLandingLocation: Rectangle | undefined;
}

export interface CampaignLevelInfo {
    index: number;
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
        name: "Add Terrain",
        mode: Mode.TerrainBuilding,
    },
];

const rocketLocationWidth = 200;
const rocketLocationHeight = 20;

export class LevelEditor implements GameState {
    private level: Level;
    private buttons: Button[];
    private mode: Mode;
    private newMode: boolean;
    private camera: LevelBuilderCamera;
    private gridRenderer: GridRenderer;
    private currentTerrain: number[] | null = null;
    private callback: (this: void, level: Level | undefined) => void;

    constructor(level: Level, callback: (this: void, level: Level | undefined) => void) {
        this.callback = callback;
        this.level = level;
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
                    this.setNewMode(scheme.mode);
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
                    this.setNewMode(Mode.Inspection);

                    Application.popState();
                    this.callback(this.level);
                }
            };
            this.buttons.push(new Button(x, y, w, h, text, callback));
        }
        this.camera = new LevelBuilderCamera();
        this.gridRenderer = new GridRenderer(250, this.camera);
    }

    private setNewMode(newMode: Mode) {
        if (this.mode != newMode) {
            if (this.mode == Mode.TerrainBuilding) {
                this.postTerrainBuilding();
            }

            this.mode = newMode;
            this.newMode = true;

            if (this.mode == Mode.TerrainBuilding) {
                this.currentTerrain = [];
            }
        }
    }

    getObjects() {
        return [this.camera];
    }

    update(dt: number) {
        for (const button of this.buttons) {
            button.update(dt);
        }
    }

    private postTerrainBuilding() {
        if (this.currentTerrain) {
            if (this.currentTerrain.length >= 4) {
                this.level.terrainPoints.push(this.currentTerrain);
            }
        }
        this.currentTerrain = null;
    }

    mousepressed(mouseX: number, mouseY: number, button: number, istouch: boolean, presses: number) {
        for (const b of this.buttons) {
            b.mousepressed(mouseX, mouseY, button, istouch, presses);
        }
        const [worldX, worldY] = this.camera.convertScreencoordinatesToWorldCoordinates(mouseX, mouseY);
        if (this.newMode == false) {
            switch (this.mode) {
                case Mode.TerrainBuilding:
                    if (button == 1) {
                        if (!this.currentTerrain) {
                            error("this shouldn't happen");
                        } else {
                            this.currentTerrain.push(worldX, worldY);
                        }
                    }
                    break;
                case Mode.RocketStartingLocation:
                    if (button == 1) {
                        if (this.level.rocketStartingLocation) {
                            this.level.rocketStartingLocation.x = worldX;
                            this.level.rocketStartingLocation.y = worldY;
                        } else {
                            this.level.rocketStartingLocation = {
                                x: worldX,
                                y: worldY,
                                w: rocketLocationWidth,
                                h: rocketLocationHeight,
                            };
                        }
                        this.mode = Mode.Inspection;
                    }
                    break;
                case Mode.RocketLandingLocation:
                    if (button == 1) {
                        if (this.level.rocketLandingLocation) {
                            this.level.rocketLandingLocation.x = worldX;
                            this.level.rocketLandingLocation.y = worldY;
                        } else {
                            this.level.rocketLandingLocation = {
                                x: worldX,
                                y: worldY,
                                w: rocketLocationWidth,
                                h: rocketLocationHeight,
                            };
                        }
                        this.mode = Mode.Inspection;
                    }
                    break;
            }
        }
        this.newMode = false;
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            if (this.mode == Mode.Inspection) {
                this.callback(undefined);
                Application.popState();
            } else {
                this.setNewMode(Mode.Inspection);
            }
        }
    }

    draw() {
        this.camera.apply();
        this.gridRenderer.draw();

        const [worldX, worldY] = this.camera.convertScreencoordinatesToWorldCoordinates(...love.mouse.getPosition());

        love.graphics.setColor(1, 0, 0, 1);
        love.graphics.setLineWidth(5);
        if (this.currentTerrain) {
            if (this.currentTerrain.length >= 2) {
                this.currentTerrain.push(worldX, worldY);

                love.graphics.line(this.currentTerrain as any);

                this.currentTerrain.pop();
                this.currentTerrain.pop();
            }
        }
        for (let i = 0; i < this.level.terrainPoints.length; i++) {
            love.graphics.line(this.level.terrainPoints[i] as any);
        }

        love.graphics.setColor(1, 1, 1, 1);
        let rect = this.level.rocketStartingLocation;
        if (this.mode == Mode.RocketStartingLocation) {
            love.graphics.rectangle("fill", worldX, worldY, rocketLocationWidth, rocketLocationHeight);
        } else {
            if (rect) {
                love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h);
            }
        }

        rect = this.level.rocketLandingLocation;
        if (this.mode == Mode.RocketLandingLocation) {
            love.graphics.rectangle("fill", worldX, worldY, rocketLocationWidth, rocketLocationHeight);
        } else {
            if (rect) {
                love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h);
            }
        }

        love.graphics.origin();
        for (const button of this.buttons) {
            button.draw();
        }
    }
}
