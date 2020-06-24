import { WrappedDrawable } from "./wrappeddrawable";

interface Velocities {
    minX: number;
    maxX: number;
    minY: number;
    maxY: number;
}

interface Particle {
    object: PhysicsObject<CircleShape>;
    creationTime: number;
}

export class ParticleSystem {
    public velocities: Velocities;
    public emissionRate: number;
    public drawable: WrappedDrawable;

    private world: World;
    private particles: Particle[];

    constructor(world: World, drawable: WrappedDrawable) {
        this.world = world;
        this.drawable = drawable;
        this.particles = [];
        this.emissionRate = 0;
        this.velocities = {
            minX: 0,
            maxX: 0,
            minY: 0,
            maxY: 0,
        };
    }

    update(dt: number) {}

    draw() {}
}
