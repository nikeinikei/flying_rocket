import { KeyConstant } from "love.keyboard";

import { CampaignLevels } from "./campaignLevels";
import { GridRenderer } from "./gridrenderer";
import { Button } from "./gui";
import { LevelBuilderCamera } from "./levelbuildercamera";
import { Levels } from "./levels";

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

export class LevelBuilder implements GameState {
    private level: Level;
    private buttons: Button[];
    private mode: Mode;
    private newMode: boolean;
    private camera: LevelBuilderCamera;
    private gridRenderer: GridRenderer;
    private campignLevelInfo: CampaignLevelInfo | undefined;

    constructor(nameOrLevel: string | Level, campaignLevelInfo?: CampaignLevelInfo) {
        this.campignLevelInfo = campaignLevelInfo;

        if (type(nameOrLevel) == "string") {
            this.level = {
                dataVersion: "0.0.2",
                name: nameOrLevel as string,
                terrainPoints: [],
                rocketLandingLocation: undefined,
                rocketStartingLocation: undefined,
            };
        } else {
            const level = nameOrLevel as Level;
            this.level = level;
        }
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

                        if (this.mode == Mode.TerrainBuilding) {
                            this.level.terrainPoints.push([]);
                        }
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
                    if (campaignLevelInfo) {
                        CampaignLevels.addLevel(this.level);
                    } else {
                        Levels.addLevel(this.level);
                    }
                    Application.popState();
                }
            };
            this.buttons.push(new Button(x, y, w, h, text, callback));
        }
        this.camera = new LevelBuilderCamera();
        this.gridRenderer = new GridRenderer(250, this.camera);
    }

    getObjects() {
        return [this.camera];
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
        const [worldX, worldY] = this.camera.convertScreencoordinatesToWorldCoordinates(mouseX, mouseY);
        if (this.newMode == false) {
            switch (this.mode) {
                case Mode.TerrainBuilding:
                    if (button == 1) {
                        this.level.terrainPoints[this.level.terrainPoints.length - 1].push(worldX, worldY);
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
            if (this.mode == Mode.TerrainBuilding) {
                this.mode = Mode.Inspection;
            }
        }
    }

    draw() {
        this.camera.apply();
        this.gridRenderer.draw();

        const [worldX, worldY] = this.camera.convertScreencoordinatesToWorldCoordinates(...love.mouse.getPosition());
        for (let i = 0; i < this.level.terrainPoints.length; i++) {
            const points = this.level.terrainPoints[i];
            const isLast = i == this.level.terrainPoints.length - 1;
            if (points.length >= 2) {
                const terrainPreview = this.mode == Mode.TerrainBuilding && isLast;

                if (terrainPreview) {
                    points.push(worldX, worldY);
                }

                love.graphics.setColor(1, 0, 0, 1);
                love.graphics.setLineWidth(5);
                love.graphics.line(points as any);

                if (terrainPreview) {
                    points.pop();
                    points.pop();
                }
            }
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
        if (this.campignLevelInfo) {
            love.graphics.print(
                "campaign level " + tostring(this.campignLevelInfo.index),
                0,
                love.graphics.getHeight() - 15
            );
        }
    }
}
