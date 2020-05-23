const rotationSpeed = (2 * math.pi) / 20;
const maxThrust = 400;

export class Rocket {

    public static width: number = 50;
    public static height: number = 50;
    public static userData = "Rocket";

    private body: Body;
    private shape: PolygonShape;
    private fixture: Fixture;
    private rotation: number;
    private thrust: number;

    constructor(world: World, x: number, y: number) {
        this.body = love.physics.newBody(world, x, y, "dynamic");
        this.body.setMass(1);
        this.shape = love.physics.newRectangleShape(Rocket.width, Rocket.height);
        this.fixture = love.physics.newFixture(this.body, this.shape);
        this.fixture.setUserData(Rocket.userData);
        this.rotation = 0;
        this.thrust = 0.9;
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
        love.graphics.polygon("fill", ...this.body.getWorldPoints(...this.shape.getPoints()));
    }
}
