import { KeyConstant } from "love.keyboard";
import { World } from "love.physics";

import { Controls } from "./controls";
import { Replays } from "./fs/replays";
import { GameState } from "./gamestate";
import { Button, TextInput } from "./gui";
import { Level } from "./level";
import { Lost } from "./lost";
import { Paused } from "./paused";
import { PlayingCamera } from "./playingCamera";
import { Rocket } from "./rocket";
import { Settings } from "./settings";
import { Stars } from "./stars";
import { Terrain } from "./terrain";
import { Serializable, Serialized } from "./types/Serializable";
import { Clock } from "./util/clock";
import { GameEndMetrics, Won } from "./won";
import { WrappedDrawable } from "./wrappeddrawable";

const borderUserData = "border";
const rocketStartingLocationUserData = "rocketStartingLocationUserData";
const rocketLandingLocationUserdata = "rocketLandingLocationUserdata";
const refuelStationUserData = "refuelStationUserData";

const physicsTicks = 60;
const timePerTick = 1 / physicsTicks;

interface Frame {
    rocket: {
        x: number;
        y: number;
        tilt: number;
        thrust: number;
        pedal: number;
    };
}

export interface Replay {
    frame: Frame[];
    level: Level;
}

class SaveReplayGameState extends GameState {
    private replay: Replay;

    private yesButton: Button;
    private noButton: Button;
    private replayNameTextInput: TextInput;
    private wantReplayText: WrappedDrawable;

    constructor(replay: Replay) {
        super();
        this.replay = replay;

        const text = love.graphics.newText(love.graphics.newFont(40), "Save Replay?");
        const width = text.getWidth();
        this.wantReplayText = new WrappedDrawable(text);
        this.wantReplayText.x = (love.graphics.getWidth() - width) / 2;
        this.wantReplayText.y = 300;

        const buttonWidth = 130;
        const buttonHeight = 70;
        const y = 450;

        this.replayNameTextInput = new TextInput(200, 200, 600, 200, "Replay Name");

        this.yesButton = new Button(400, y, buttonWidth, buttonHeight, "Yes", () => {
            const name = this.replayNameTextInput.getText();
            if (name.length == 0) {
                love.window.showMessageBox("no name provided", "A name is needed to save a replay", "warning");
            } else {
                Replays.addReplay(this.replay, name);

                Application.popState();
            }
        });
        this.noButton = new Button(600, y, buttonWidth, buttonHeight, "No", () => {
            Application.popState();
        });
    }

    getObjects(): unknown[] {
        return [this.wantReplayText, this.replayNameTextInput, this.yesButton, this.noButton];
    }

    getName(): string {
        return "SaveReplayGameState";
    }
}

export enum GameEndReason {
    Won,
    Lost,
    Quit
}

/**
 * AbstractPlaying is a class that contains all the logic and physics for the game
 * but doesn't implement any of the game inputs
 */
export class AbstractPlaying extends GameState implements Serializable {
    private static countDownTime = 3;

    private level: Level;
    private world: World;
    private clock: Clock;
    private rocket: Rocket;
    private terrain: Terrain;
    private rocketStartingLocationObject: PhysicsObject<PolygonShape>;
    private rocketLandingLocationObject: PhysicsObject<PolygonShape>;
    private refuelStations: PhysicsObject<PolygonShape>[];
    private camera: PlayingCamera;
    private stars: Stars;
    private refueling: boolean = false;
    private elapsed: number;
    private frames: Frame[];
    private resetNextFrame: boolean = false;
    private countdownTime: number | undefined;

    constructor(level: Level) {
        super();
        this.level = level;
        this.world = love.physics.newWorld(0, 100);
        this.world.setCallbacks((a, b, c) => this.beginContact(a, b, c));

        let rocketStartingLocation = level.rocketStartingLocation as Rectangle;
        let rocketLandingLocation = level.rocketLandingLocation as Rectangle;

        let rocketX = rocketStartingLocation.x + rocketStartingLocation.w / 2;
        let rocketY = rocketStartingLocation.y - Rocket.height / 2;

        this.rocket = new Rocket(this.world, rocketX, rocketY);

        this.rocketStartingLocationObject = this.newStaticRectangle(
            this.world,
            rocketStartingLocation.x + rocketStartingLocation.w / 2,
            rocketStartingLocation.y + rocketStartingLocation.h / 2,
            rocketStartingLocation.w,
            rocketStartingLocation.h
        );
        this.rocketStartingLocationObject.fixture.setUserData(rocketStartingLocationUserData);

        this.rocketLandingLocationObject = this.newStaticRectangle(
            this.world,
            rocketLandingLocation.x + rocketLandingLocation.w / 2,
            rocketLandingLocation.y + rocketLandingLocation.h / 2,
            rocketLandingLocation.w,
            rocketLandingLocation.h
        );
        this.rocketLandingLocationObject.fixture.setUserData(rocketLandingLocationUserdata);

        this.refuelStations = [];
        for (const station of this.level.refuelStations) {
            const stationObject = this.newStaticRectangle(
                this.world,
                station.x + station.w / 2,
                station.y + station.h / 2,
                station.w,
                station.h
            );
            stationObject.fixture.setUserData(refuelStationUserData);

            this.refuelStations.push(stationObject);
        }

        this.elapsed = 0;

        this.terrain = new Terrain(this.world, level.terrainPoints);
        this.camera = new PlayingCamera(this.rocket);
        this.stars = new Stars();

        this.frames = [];

        this.recordReplayFrame();

        this.countdownTime = AbstractPlaying.countDownTime;

        this.clock = new Clock();
    }

    protected reset() {
        this.resetNextFrame = true;
    }

    protected setPedal(pedal: number) {
        this.rocket.setPedal(pedal);
    }

    protected setRotation(rotation: number) {
        this.rocket.setRotation(rotation);
    }

    protected getPedal()  {
        return this.rocket.getPedal();
    }

    protected getRotation() {
        return this.rocket.getRotation();
    }

    getName() {
        return "Playing";
    }

    serialize(): Serialized {
        return { name: "Playing", level: this.level.name };
    }

    private pause() {
        const onUnpaused = () => {
            this.clock.resume();
        };
        Application.pushState(new Paused(this, onUnpaused));
        this.clock.pause();
    }

    private newStaticRectangle(world: World, x: number, y: number, w: number, h: number): PhysicsObject<PolygonShape> {
        let body = love.physics.newBody(world, x, y, "static");
        let shape = love.physics.newRectangleShape(w, h);
        let fixture = love.physics.newFixture(body, shape);

        return {
            body,
            shape,
            fixture,
        };
    }

    private isSafeLanding(rocket: Rocket): boolean {
        if (math.abs(rocket.getTilt()) >= math.pi / 16) {
            return false;
        }

        let body = rocket.getBody();
        let [dx, dy] = body.getLinearVelocity();
        if (math.abs(dx) >= 20 || math.abs(dy) >= 40) {
            return false;
        }

        return true;
    }

    /** @tupleReturn */
    private matchFixtures(
        fixtureA: Fixture,
        fixtureB: Fixture,
        userDataA: unknown,
        userDataB: unknown
    ): [Fixture, Fixture] | [null, null] {
        let a = fixtureA.getUserData();
        let b = fixtureB.getUserData();
        if (a == userDataA && b == userDataB) {
            return [fixtureA, fixtureB];
        }
        if (a == userDataB && b == userDataA) {
            return [fixtureB, fixtureA];
        }
        return [null, null];
    }

    private beginContact(a: Fixture, b: Fixture, contact: Contact) {
        let rocket, border, terrain, rocketStartingLocation, rocketLandingLocation, refuelStation;
        [rocket, border] = this.matchFixtures(a, b, Rocket.userData, borderUserData);
        if (rocket) {
            this.lose();
        }

        [rocket, terrain] = this.matchFixtures(a, b, Rocket.userData, Terrain.userData);
        if (rocket) {
            this.lose();
        }
        [rocket, rocketStartingLocation] = this.matchFixtures(a, b, Rocket.userData, rocketStartingLocationUserData);
        if (rocket) {
            if (!this.isSafeLanding(this.rocket)) {
                this.lose();
            }
        }

        [rocket, rocketLandingLocation] = this.matchFixtures(a, b, Rocket.userData, rocketLandingLocationUserdata);
        if (rocket) {
            if (this.isSafeLanding(this.rocket)) {
                this.win();
            } else {
                this.lose();
            }
        }

        [rocket, refuelStation] = this.matchFixtures(a, b, Rocket.userData, refuelStationUserData);
        if (rocket) {
            if (!this.isSafeLanding(this.rocket)) {
                this.lose();
            }
        }
    }

    private constructReplay(): Replay {
        return {
            frame: this.frames,
            level: this.level,
        };
    }

    protected endGame(_gameEndReason: GameEndReason, ...nextStates: GameState[]) {
        Application.popState();
        for (const nextState of nextStates) {
            Application.pushState(nextState);
        }
    }

    protected win() {
        const metrics: GameEndMetrics = {
            timeTaken: this.clock.getElapsed(),
        };
        this.endGame(
            GameEndReason.Won,
            new Won(metrics), 
            new SaveReplayGameState(this.constructReplay()));
    }

    protected lose() {
        this.endGame(
            GameEndReason.Lost,
            new Lost(),
            new SaveReplayGameState(this.constructReplay()));
    }

    private notMoving(dx: number, dy: number): boolean {
        const EPSILON = 0.0001;
        return Math.abs(dx) < EPSILON && Math.abs(dy) < EPSILON;
    }

    private recordReplayFrame() {
        const rocketBody = this.rocket.getBody();
        const [x, y] = rocketBody.getPosition();
        const tilt = this.rocket.getTilt();
        const pedal = this.rocket.getPedal();
        const thrust = this.rocket.getThrust();
        const frame: Frame = {
            rocket: {
                x,
                y,
                pedal,
                thrust,
                tilt,
            },
        };

        this.frames.push(frame);
    }

    update(dt: number) {
        if (this.resetNextFrame) {
            this.clock.restart();
            this.frames.length = 0;
            this.rocket.reset();
            this.elapsed = 0;
            this.countdownTime = AbstractPlaying.countDownTime;

            this.resetNextFrame = false;
        }

        if (this.countdownTime != undefined) {
            this.countdownTime -= dt;

            if (this.countdownTime <= 0) {
                this.countdownTime = undefined;
            }
        } else {
            this.elapsed += dt;
            
            while (this.elapsed >= timePerTick) {
                this.physicsUpdate(timePerTick);
                this.recordReplayFrame();
                this.elapsed -= timePerTick;
            }
        }

        this.camera.update(dt);
        this.stars.setViewport(...this.camera.getViewport());
    }

    physicsUpdate(dt: number) {
        this.rocket.update(dt);
        this.world.update(dt);

        const contacts: Contact[] = this.world.getContacts();
        let contactWithRefuelStation = false;
        for (const contact of contacts) {
            const [fixtureA, fixtureB] = contact.getFixtures();
            const [rocket, refuelStation] = this.matchFixtures(
                fixtureA,
                fixtureB,
                Rocket.userData,
                refuelStationUserData
            );
            if (rocket) {
                contactWithRefuelStation = true;
                break;
            }
        }
        if (contactWithRefuelStation) {
            const [xVel, yVel] = this.rocket.getBody().getLinearVelocity();
            if (this.notMoving(xVel, yVel)) {
                this.rocket.refuel(dt);
                this.refueling = true;
            } else {
                this.refueling = false;
            }
        } else {
            this.refueling = false;
        }

        if (math.abs(this.rocket.getTilt()) >= math.pi / 2) {
            this.lose();
        }
    }

    private drawObject(o: PhysicsObject<PolygonShape>) {
        love.graphics.polygon("fill", ...o.body.getWorldPoints(...o.shape.getPoints()));
    }

    private drawFuelIndicator(fuel: number) {
        const width = 30;
        const height = 120;

        const x = 15;
        const y = 60;

        const padding = 5;

        const [r, g, b, a] = love.graphics.getColor();

        love.graphics.setColor(0.7, 0.7, 0.7, 1);

        love.graphics.rectangle("fill", x - padding, y - padding, width + 2 * padding, padding);
        love.graphics.rectangle("fill", x - padding, y + height, width + 2 * padding, padding);
        love.graphics.rectangle("fill", x + width, y, padding, height);
        love.graphics.rectangle("fill", x - padding, y, padding, height);

        love.graphics.setColor(0, 0, 1, 1);

        const fraction = fuel / 100;
        love.graphics.rectangle("fill", x, y + height - fraction * height, width, fraction * height);

        love.graphics.setColor(r, g, b, a);
    }

    draw() {
        this.camera.apply();
        this.stars.draw();
        love.graphics.setColor(1, 1, 1, 1);
        this.rocket.draw();
        this.terrain.draw();
        this.drawObject(this.rocketStartingLocationObject);
        this.drawObject(this.rocketLandingLocationObject);
        for (const station of this.refuelStations) {
            this.drawObject(station);
        }

        love.graphics.origin();

        this.drawFuelIndicator(this.rocket.getFuel());
        if (this.countdownTime) {
            love.graphics.setColor(1, 0, 0, 1);
            love.graphics.printf(
                tostring(this.countdownTime), 
                love.graphics.getWidth() / 2, 
                love.graphics.getHeight() * 0.4, 
                300,
                "center");
            love.graphics.setColor(1, 1, 1, 1);
        }

        love.graphics.print("elapsed time " + tostring(this.clock.getElapsed()), love.graphics.getWidth() - 200, 0);

        if (Settings.isDevelopment()) {
            love.graphics.print(tostring(love.timer.getFPS()));
            love.graphics.print("fuel = " + tostring(this.rocket.getFuel()), 0, 15);
            love.graphics.print("refueling " + tostring(this.refueling), 0, 30);
        }
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            this.endGame(GameEndReason.Quit);
        }
        if (key == "p") {
            this.pause();
        }
    }
}

/**
 * Playing implements the game input
 */
export class Playing extends AbstractPlaying {

    update(dt: number) {
        const pedal = love.keyboard.isDown(Controls.game.applyThrust) ? 1 : 0;
        
        let rotation = 0;
        if (love.keyboard.isDown(Controls.game.rotateLeft)) {
            rotation = -1;
        }
        if (love.keyboard.isDown(Controls.game.rotateRight)) {
            rotation += 1;
        }

        this.setPedal(pedal);

        this.setRotation(rotation);

        super.update(dt);
    }
}
