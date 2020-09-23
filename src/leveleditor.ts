import { KeyConstant } from "love.keyboard";

import { GameState } from "./gamestate";
import { GridRenderer } from "./gridrenderer";
import { Button } from "./gui";
import { Level } from "./level";
import { LevelEditorCamera } from "./leveleditorcamera";
import { Stars } from "./stars";
import { Serializable, Serialized } from "./types/Serializable";

export interface CampaignLevelInfo {
    index: number;
}

enum TerrainType {
    Terrain,
    GroundTerrain
}

enum Mode {
    TerrainBuilding,
    GroundTerrainBuilding,
    RocketStartingLocation,
    RocketLandingLocation,
    AddRefuelStation,
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
        name: "Add Refuel Station",
        mode: Mode.AddRefuelStation,
    },
    {
        name: "Add Terrain",
        mode: Mode.TerrainBuilding,
    },
    {
        name: "Ground Terrain",
        mode: Mode.GroundTerrainBuilding
    }
];

const rocketLocationWidth = 200;
const rocketLocationHeight = 20;

const refuelStationWidth = 200;
const refuelStationHeight = 20;

export class LevelEditor extends GameState implements Serializable {
    private level: Level;
    private buttons: Button[];
    private mode: Mode;
    private newMode: boolean;
    private camera: LevelEditorCamera;
    private gridRenderer: GridRenderer;
    private terrainType: TerrainType | null = null;
    private currentTerrain: number[] | null = null;
    private currentRefuelStation: Rectangle | undefined = undefined;
    private stars: Stars;
    private success = false;

    constructor(level: Level) {
        super();
        this.level = level;
        this.mode = Mode.Inspection;
        this.newMode = false;
        this.buttons = [];
        {
            const startX = 10;
            const buttonHeight = 30;
            const buttonWidth = 190;
            const buttonPadding = 10;
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

                    this.success = true;
                    Application.popState();
                }
            };
            this.buttons.push(new Button(x, y, w, h, text, callback));
        }
        this.camera = new LevelEditorCamera();
        this.gridRenderer = new GridRenderer(250, this.camera);
        this.stars = new Stars();
    }

    serialize(): Serialized {
        return { name: "LevelEditor", levelName: this.level.name };
    }

    getName() {
        return "LevelEditor";
    }

    private setNewMode(newMode: Mode) {
        love.mouse.setGrabbed(newMode != Mode.Inspection);
        if (this.mode != newMode) {
            if (this.mode == Mode.TerrainBuilding || this.mode == Mode.GroundTerrainBuilding) {
                this.postTerrainBuilding();
            }
            if (this.mode == Mode.AddRefuelStation) {
                this.currentRefuelStation = undefined;
            }

            this.mode = newMode;
            this.newMode = true;

            if (this.mode == Mode.TerrainBuilding) {
                this.currentTerrain = [];
                this.terrainType = TerrainType.Terrain;
            }
            if (this.mode == Mode.GroundTerrainBuilding) {
                this.currentTerrain = [];
                this.terrainType = TerrainType.GroundTerrain;
            }
            if (this.mode == Mode.AddRefuelStation) {
                this.currentRefuelStation = {
                    x: 0,
                    y: 0,
                    w: refuelStationWidth,
                    h: refuelStationHeight,
                };
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
            if (this.terrainType == null) {
                error("this shouldn't happen");
            }

            if (this.currentTerrain.length >= 4) {
                if (this.terrainType == TerrainType.Terrain) {
                    this.level.terrainPoints.push(this.currentTerrain);
                } else {
                    // TODO color is hardcoded
                    this.level.groundTerrain.push({
                        color: {
                            r: 0.9059,
                            g: 0.4902,
                            b: 0.0667
                        },
                        points: this.currentTerrain
                    });
                }
            }
        }
        this.currentTerrain = null;
        this.terrainType = null;
    }

    mousepressed(mouseX: number, mouseY: number, button: number, istouch: boolean, presses: number) {
        for (const b of this.buttons) {
            b.mousepressed(mouseX, mouseY, button, istouch, presses);
        }
        love.graphics.push();
        love.graphics.origin();
        this.camera.apply();
        const [worldX, worldY] = love.graphics.inverseTransformPoint(mouseX, mouseY);
        love.graphics.pop();
        if (this.newMode == false) {
            if (this.mode == Mode.TerrainBuilding || this.mode == Mode.GroundTerrainBuilding) {
                if (button == 1) {
                    if (!this.currentTerrain) {
                        error("this shouldn't happen");
                    } else {
                        this.currentTerrain.push(worldX, worldY);
                    }
                }
            } else if (this.mode == Mode.RocketStartingLocation) {
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
                    this.setNewMode(Mode.Inspection);
                }
            } else if (this.mode == Mode.AddRefuelStation) {
                if (button == 1) {
                    if (this.currentRefuelStation) {
                        this.currentRefuelStation.x = worldX;
                        this.currentRefuelStation.y = worldY;
                        this.level.refuelStations.push(this.currentRefuelStation);
                        this.currentRefuelStation = undefined;
                        this.setNewMode(Mode.Inspection);
                    } else {
                        assert(this.currentRefuelStation, "this.mode != Mode.AddRefuelStation");
                    }
                }
            } else if (this.mode == Mode.RocketLandingLocation) {
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
                    this.setNewMode(Mode.Inspection);
                }
            }
        }
        this.newMode = false;
    }

    leave() {
        if (this.success) {
            return this.level;
        } else {
            return null;
        }
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            if (this.mode == Mode.Inspection) {
                Application.popState();
            } else {
                this.setNewMode(Mode.Inspection);
            }
        }
    }

    private drawStartingLocation(x: number, y: number, w: number, h: number) {
        love.graphics.setColor(0, 1, 0, 1);
        love.graphics.rectangle("fill", x, y, w, h);
    }

    private drawLandingLocation(x: number, y: number, w: number, h: number) {
        love.graphics.setColor(0, 0, 1, 1);
        love.graphics.rectangle("fill", x, y, w, h);
    }

    private drawRefuelStation(x: number, y: number, w: number, h: number) {
        love.graphics.setColor(0.7, 0.7, 0.7, 1);
        love.graphics.rectangle("fill", x, y, w, h);
    }

    wheelmoved(_x: number, y: number) {
        this.camera.scale(y * 0.05);
    }

    draw() {
        this.camera.apply();
        this.stars.setViewport(...this.camera.getViewport());
        this.stars.draw();
        this.gridRenderer.draw();

        const [worldX, worldY] = love.graphics.inverseTransformPoint(...love.mouse.getPosition());

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
        for (const groundTerrain of this.level.groundTerrain) {
            love.graphics.setColor(groundTerrain.color.r, groundTerrain.color.g, groundTerrain.color.b);
            love.graphics.polygon("fill", groundTerrain.points);
        }

        love.graphics.setColor(1, 1, 1, 1);
        let rect = this.level.rocketStartingLocation;
        if (this.mode == Mode.RocketStartingLocation) {
            this.drawStartingLocation(worldX, worldY, rocketLocationWidth, rocketLocationHeight);
        } else {
            if (rect) {
                this.drawStartingLocation(rect.x, rect.y, rect.w, rect.h);
            }
        }

        rect = this.level.rocketLandingLocation;
        if (this.mode == Mode.RocketLandingLocation) {
            this.drawLandingLocation(worldX, worldY, rocketLocationWidth, rocketLocationHeight);
        } else {
            if (rect) {
                this.drawLandingLocation(rect.x, rect.y, rect.w, rect.h);
            }
        }

        rect = this.currentRefuelStation;
        if (rect) {
            this.drawRefuelStation(worldX, worldY, rect.w, rect.h);
        }
        for (const refuelStation of this.level.refuelStations) {
            this.drawRefuelStation(refuelStation.x, refuelStation.y, refuelStation.w, refuelStation.h);
        }

        love.graphics.setColor(1, 1, 1, 1);
        love.graphics.origin();
        for (const button of this.buttons) {
            button.draw();
        }
    }
}
