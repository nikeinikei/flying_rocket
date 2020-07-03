import { Color } from "./Color4";
import { ImageUtils } from "./graphics/ImageUtils";
import { WrappedDrawable } from "./wrappeddrawable";

export class Rocket {
    public static userData = "Rocket";
    public static width: number = 50;
    public static height: number = 80;

    private static maxEmissionRate = 200;
    private static maxThrust = 600;
    private static rotationSpeed = (2 * math.pi) / 20;
    private static rocketImage = love.graphics.newImage("res/rocket.png");
    private static fuelThrustConversionFactor: number = 100 / 20;
    private static refuelRate = 10;

    private body: Body;
    private shape: PolygonShape;
    private fixture: Fixture;
    private rotation: number;
    private pedal: number;
    private thrust: number;
    private fuel: number;
    private rocketDrawable: WrappedDrawable;
    private particleSystems: [ParticleSystem, WrappedDrawable][];

    constructor(world: World, x: number, y: number) {
        this.body = love.physics.newBody(world, x, y, "dynamic");
        this.body.setMass(1);
        this.shape = love.physics.newRectangleShape(Rocket.width, Rocket.height);
        this.fixture = love.physics.newFixture(this.body, this.shape, 1);
        this.fixture.setUserData(Rocket.userData);
        this.rotation = 0;
        this.pedal = 0;
        this.thrust = 0;
        this.fuel = 100;

        this.rocketDrawable = new WrappedDrawable(
            ImageUtils.scaleImageToDimensions(Rocket.rocketImage, Rocket.width, Rocket.height)
        );
        [this.rocketDrawable.ox, this.rocketDrawable.oy] = [Rocket.width / 2, Rocket.height / 2];

        const shadesOfRed = [
            Color.fromBytes(255, 160, 122),
            Color.fromBytes(250, 128, 114),
            Color.fromBytes(233, 150, 122),
            Color.fromBytes(255, 160, 122),
            Color.fromBytes(240, 128, 128),
            Color.fromBytes(205, 92, 92),
            Color.fromBytes(220, 20, 60),
            Color.fromBytes(178, 34, 34),
            Color.fromBytes(255, 0, 0),
            Color.fromBytes(139, 0, 0),
            Color.fromBytes(128, 0, 0),
            Color.fromBytes(255, 99, 71),
            Color.fromBytes(255, 69, 0),
        ];

        const width = 4;
        const height = 4;

        let imageData = love.image.newImageData(4, 4);
        for (let i = 0; i < width; i++) {
            for (let j = 0; j < height; j++) {
                const randomColor = shadesOfRed[love.math.random(shadesOfRed.length) - 1];
                imageData.setPixel(i, j, ...randomColor.unpacked());
            }
        }

        this.particleSystems = [];
        for (let i = 0; i < 3; i++) {
            let particleSystem = love.graphics.newParticleSystem(love.graphics.newImage(imageData));
            particleSystem.setParticleLifetime(0.4, 0.8);
            particleSystem.setEmissionRate(0);
            particleSystem.setLinearAcceleration(-10, 500, 10, 700);
            particleSystem.setColors(1, 1, 1, 1, 1, 1, 1, 0);

            let drawable = new WrappedDrawable(particleSystem);
            drawable.oy = -Rocket.height / 2;
            drawable.ox = -Rocket.width / 2 + (i * Rocket.width) / 2;

            this.particleSystems.push([particleSystem, drawable]);
        }
    }

    getBody() {
        return this.body;
    }

    getTilt() {
        return this.body.getAngle();
    }

    setPedal(pedal: number) {
        this.pedal = pedal;
    }

    setRotation(rotation: number) {
        this.rotation = rotation;
    }

    getFuel() {
        return this.fuel;
    }

    /** @tupleReturn */
    getPosition(): [number, number] {
        return this.body.getPosition();
    }

    refuel(dt: number) {
        this.fuel = Math.min(100, this.fuel + Rocket.refuelRate * dt);
    }

    update(dt: number) {
        let angle = this.body.getAngle();
        angle = angle + Rocket.rotationSpeed * dt * this.rotation;
        this.body.setAngle(angle);

        this.fuel -= this.thrust * Rocket.fuelThrustConversionFactor * dt;
        this.fuel = Math.max(0, this.fuel);

        const currentThrust = this.thrust;
        let diff: number;
        if (this.fuel > 0) {
            diff = this.pedal - currentThrust;
        } else {
            diff = -currentThrust;
        }
        const rate = 7;
        this.thrust = this.thrust + diff * rate * dt;

        let effectiveThrust = this.thrust * Rocket.maxThrust;
        let effectiveThrustX = math.sin(angle) * effectiveThrust;
        let effectiveThrustY = -math.cos(angle) * effectiveThrust;
        this.body.applyForce(effectiveThrustX, effectiveThrustY);

        for (const [particleSystem, _] of this.particleSystems) {
            particleSystem.setEmissionRate(this.thrust * Rocket.maxEmissionRate);
            particleSystem.update(dt);
        }
    }

    draw() {
        [this.rocketDrawable.x, this.rocketDrawable.y] = this.body.getPosition();
        this.rocketDrawable.r = this.body.getAngle();
        this.rocketDrawable.draw();

        for (const [_, particleSystemDrawable] of this.particleSystems) {
            [particleSystemDrawable.x, particleSystemDrawable.y] = this.body.getPosition();
            particleSystemDrawable.r = this.body.getAngle();
            particleSystemDrawable.draw();
        }
    }
}
