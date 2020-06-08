import { WrappedDrawable } from "./wrappeddrawable";

const rotationSpeed = (2 * math.pi) / 20;
const maxThrust = 600;

const rocketImage = love.graphics.newImage("res/rocket.png");

export class Rocket {
    public static width: number = 50;
    public static height: number = 80;
    public static userData = "Rocket";

    private body: Body;
    private shape: PolygonShape;
    private fixture: Fixture;
    private rotation: number;
    private thrust: number;
    private rocketDrawable: WrappedDrawable;

    constructor(world: World, x: number, y: number) {
        this.body = love.physics.newBody(world, x, y, "dynamic");
        this.body.setMass(1);
        this.shape = this.createGraphicsCoordinatesRectangleShape(Rocket.width, Rocket.height);
        this.fixture = love.physics.newFixture(this.body, this.shape);
        this.fixture.setUserData(Rocket.userData);
        this.rotation = 0;
        this.thrust = 0.9;
        this.rocketDrawable = new WrappedDrawable(rocketImage);
        const [imageWidth, imageHeight] = rocketImage.getDimensions();
        [this.rocketDrawable.sx, this.rocketDrawable.sy] = [Rocket.width / imageWidth, Rocket.height / imageHeight];
    }

    private createGraphicsCoordinatesRectangleShape(width: number, height: number): PolygonShape {
        return love.physics.newPolygonShape(0, 0, width, 0, width, height, 0, height);
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
    }

    draw() {
        [this.rocketDrawable.x, this.rocketDrawable.y] = this.body.getPosition();
        this.rocketDrawable.r = this.body.getAngle();
        this.rocketDrawable.draw();
    }
}
