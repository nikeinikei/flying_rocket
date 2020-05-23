export class Terrain {
    public static userData: string = "Terrain";

    private points: number[][];

    private body: Body[];
    private shape: Shape[];
    private fixture: Fixture[];

    constructor(world: World, points: number[][]) {
        this.points = points;
        this.body = [];
        this.shape = [];
        this.fixture = [];
        for (const ps of points) {
            let body = love.physics.newBody(world, 0, 0, "static");
            let shape = love.physics.newChainShape(false, ps);
            let fixture = love.physics.newFixture(body, shape);
            fixture.setUserData(Terrain.userData);

            this.body.push(body);
            this.shape.push(shape);
            this.fixture.push(fixture);
        }
    }

    draw() {
        for (const ps of this.points) {
            love.graphics.line(ps as any);
        }
    }
}
