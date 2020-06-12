import { Color } from "./Color4";
import { ImageUtils } from "./graphics/ImageUtils";
import { WrappedDrawable } from "./wrappeddrawable";

const rotationSpeed = (2 * math.pi) / 20;
const maxThrust = 600;

const rocketImage = love.graphics.newImage("res/rocket.png");

export class Rocket {
    public static width: number = 50;
    public static height: number = 80;
    public static userData = "Rocket";
    public static maxEmissionRate = 200;

    private body: Body;
    private shape: PolygonShape;
    private fixture: Fixture;
    private rotation: number;
    private thrust: number;
    private rocketDrawable: WrappedDrawable;

    private particleSystems: [ParticleSystem, WrappedDrawable][];

    constructor(world: World, x: number, y: number) {
        this.body = love.physics.newBody(world, x, y, "dynamic");
        this.body.setMass(1);
        this.shape = love.physics.newRectangleShape(Rocket.width, Rocket.height);
        this.fixture = love.physics.newFixture(this.body, this.shape, 1);
        this.fixture.setUserData(Rocket.userData);
        this.rotation = 0;
        this.thrust = 0.9;

        this.rocketDrawable = new WrappedDrawable(
            ImageUtils.scaleImageToDimensions(rocketImage, Rocket.width, Rocket.height)
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

    setThrust(thrust: number) {
        this.thrust = thrust;
    }

    setRotation(rotation: number) {
        this.rotation = rotation;
    }

    /** @tupleReturn */
    getPosition(): [number, number] {
        return this.body.getPosition();
    }

    update(dt: number) {
        let angle = this.body.getAngle();
        angle = angle + rotationSpeed * dt * this.rotation;
        this.body.setAngle(angle);

        let effectiveThrust = this.thrust * maxThrust;
        let effectiveThrustX = math.sin(angle) * effectiveThrust;
        let effectiveThrustY = -math.cos(angle) * effectiveThrust;
        this.body.applyForce(effectiveThrustX, effectiveThrustY);

        const targetEmissionRate = this.thrust * Rocket.maxEmissionRate;
        for (const [particleSystem, _] of this.particleSystems) {
            const currentEmissionRate = particleSystem.getEmissionRate();
            const diff = targetEmissionRate - currentEmissionRate;
            const rate = 7;

            particleSystem.setEmissionRate(currentEmissionRate + diff * rate * dt);
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
