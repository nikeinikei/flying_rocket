import { KeyConstant } from "love.keyboard";
import { World } from "love.physics";

import { Controls } from "./controls";
import { Level } from "./level";
import { Lost } from "./lost";
import { Paused } from "./paused";
import { PlayingCamera } from "./playingCamera";
import { Rocket } from "./rocket";
import { Settings } from "./settings";
import { Terrain } from "./terrain";
import { Clock } from "./util/clock";
import { GameEndMetrics, Won } from "./won";
import { Stars } from "./stars";

const borderUserData = "border";
const rocketStartingLocationUserData = "rocketStartingLocationUserData";
const rocketLandingLocationUserdata = "rocketLandingLocationUserdata";
const refuelStationUserData = "refuelStationUserData";

export class Playing {
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

    constructor(level: Level) {
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

        this.terrain = new Terrain(this.world, level.terrainPoints);
        this.camera = new PlayingCamera(this.rocket);
        this.stars = new Stars();
        this.clock = new Clock();
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

    private win() {
        const metrics: GameEndMetrics = {
            timeTaken: this.clock.getElapsed(),
        };
        Application.popState();
        Application.pushState(new Won(metrics));
    }

    private lose() {
        Application.popState();
        Application.pushState(new Lost());
    }

    private notMoving(dx: number, dy: number): boolean {
        const EPSILON = 0.0001;
        return Math.abs(dx) < EPSILON && Math.abs(dy) < EPSILON;
    }

    update(dt: number) {
        if (love.keyboard.isDown(Controls.game.applyThrust)) {
            this.rocket.setPedal(1);
        } else {
            this.rocket.setPedal(0);
        }

        let rotation = 0;
        if (love.keyboard.isDown(Controls.game.rotateLeft)) {
            rotation = -1;
        }
        if (love.keyboard.isDown(Controls.game.rotateRight)) {
            rotation += 1;
        }
        this.rocket.setRotation(rotation);

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

        this.camera.update(dt);
        const [x, y] = this.camera.getTranslation();
        this.stars.setViewport(x, y, love.graphics.getWidth(), love.graphics.getHeight());
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

        love.graphics.print("elapsed time " + tostring(this.clock.getElapsed()), love.graphics.getWidth() - 200, 0);

        if (Settings.isDevelopment()) {
            love.graphics.print(tostring(love.timer.getFPS()));
            love.graphics.print("fuel = " + tostring(this.rocket.getFuel()), 0, 15);
            love.graphics.print("refueling " + tostring(this.refueling), 0, 30);
        }
    }

    keypressed(key: KeyConstant) {
        if (key == "escape") {
            Application.popState();
        }
        if (key == "p") {
            this.pause();
        }
    }
}
