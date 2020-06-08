import { KeyConstant } from "love.keyboard";
import { World } from "love.physics";

import { Controls } from "./controls";
import { Level } from "./leveleditor";
import { Lost } from "./lost";
import { Paused } from "./paused";
import { PlayingCamera } from "./playingCamera";
import { Rocket } from "./rocket";
import { Terrain } from "./terrain";
import { Clock } from "./util/clock";
import { GameEndMetrics, Won } from "./won";

const borderUserData = "border";
const rocketStartingLocationUserData = "rocketStartingLocationUserData";
const rocketLandingLocationUserdata = "rocketLandingLocationUserdata";

export class Playing {
    private level: Level;
    private world: World;
    private clock: Clock;
    private rocket: Rocket;
    private terrain: Terrain;
    private rocketStartingLocationObject: PhysicsObject<PolygonShape>;
    private rocketLandingLocationObject: PhysicsObject<PolygonShape>;
    private camera: PlayingCamera;

    constructor(level: Level) {
        this.level = level;
        this.world = love.physics.newWorld(0, 100);
        this.world.setCallbacks((a, b, c) => this.beginContact(a, b, c));

        let rocketStartingLocation = level.rocketStartingLocation as Rectangle;
        let rocketLandingLocation = level.rocketLandingLocation as Rectangle;

        let rocketX = rocketStartingLocation.x + (rocketStartingLocation.w - Rocket.width) / 2;
        let rocketY = rocketStartingLocation.y - Rocket.height;

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

        let [windowWidth, windowHeight] = love.graphics.getDimensions();

        this.terrain = new Terrain(this.world, level.terrainPoints);
        this.camera = new PlayingCamera(this.rocket);
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
        const tilt = rocket.getTilt();
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
        let rocket, border, terrain, rocketStartingLocation, rocketLandingLocation;
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

    update(dt: number) {
        if (love.keyboard.isDown(Controls.game.applyThrust)) {
            this.rocket.setThrust(1);
        } else {
            this.rocket.setThrust(0);
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

        if (math.abs(this.rocket.getTilt()) >= math.pi / 2) {
            this.lose();
        }

        this.camera.update(dt);
    }

    private drawObject(o: PhysicsObject<PolygonShape>) {
        love.graphics.polygon("fill", ...o.body.getWorldPoints(...o.shape.getPoints()));
    }

    draw() {
        this.camera.apply();
        love.graphics.setColor(1, 1, 1, 1);
        this.rocket.draw();
        this.terrain.draw();
        this.drawObject(this.rocketStartingLocationObject);
        this.drawObject(this.rocketLandingLocationObject);

        love.graphics.origin();
        love.graphics.print("elapsed time " + tostring(this.clock.getElapsed()), love.graphics.getWidth() - 200, 0);
        love.graphics.print(tostring(love.timer.getFPS()));
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
