export class Terrain {
    public static userData: string = "Terrain"

    private points: number[];

    private body: Body;
    private shape: Shape;
    private fixture: Fixture;

    constructor(world: World, points: number[]) {
        this.points = points;
        this.body = love.physics.newBody(world, 0, 0, "static");
        this.shape = love.physics.newChainShape(false, points);
        this.fixture = love.physics.newFixture(this.body, this.shape);
        this.fixture.setUserData(Terrain.userData);
    }

    draw() {
        love.graphics.line(this.points as any);
    }
}