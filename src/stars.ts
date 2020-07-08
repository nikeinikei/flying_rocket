class Star {
    private x: number;
    private y: number;
    private r: number;

    constructor(x: number, y: number, r: number) {
        this.x = x;
        this.y = y;
        this.r = r;
    }

    draw() {
        love.graphics.setColor(1, 1, 1, love.math.noise(this.x, this.y, math.max(love.timer.getTime() * 0.4, 0.4)));
        love.graphics.circle("fill", this.x, this.y, this.r);
    }
}

class Chunk {
    private static starDensity = 5 / (500 * 500); //read: 5 stars per 500 by 500 area
    private static deviation = 2;

    private stars: Star[];

    constructor(x: number, y: number, chunkLength: number) {
        this.stars = [];

        const n = 10;
        const length = chunkLength / n;
        const area = length * length;
        const medianNumberOfStars = area * Chunk.starDensity;
        for (let i = 0; i < n; i++) {
            for (let j = 0; j < n; j++) {
                const currentX = x + i * length;
                const currentY = y + j * length;
                const numberOfStars = math.floor(
                    math.max(love.math.randomNormal(Chunk.deviation, medianNumberOfStars), 0)
                );
                for (let i = 0; i < numberOfStars; i++) {
                    const starX = love.math.random(currentX, currentX + length);
                    const starY = love.math.random(currentY, currentY + length);
                    const r = math.max(love.math.randomNormal(0.4, 3), 1);
                    table.insert(this.stars, new Star(starX, starY, r));
                }
            }
        }
    }

    draw() {
        for (const star of this.stars) {
            star.draw();
        }
    }
}

export class Stars {
    private static chunkLength = 1000;

    private chunks: Table<number, Table<number, Chunk>>;
    private viewport: Rectangle;
    private activeChunks: Chunk[] = [];

    constructor() {
        this.chunks = new Table();
        this.viewport = {
            x: 0,
            y: 0,
            w: love.graphics.getWidth(),
            h: love.graphics.getHeight(),
        };
    }

    private getChunk(i: number, j: number): Chunk {
        let col = this.chunks.get(i);
        if (!col) {
            col = new Table();
            this.chunks.set(i, col);
        }

        let entry = col.get(j);
        if (!entry) {
            entry = new Chunk(i * Stars.chunkLength, j * Stars.chunkLength, Stars.chunkLength);
            col.set(j, entry);
        }
        return entry;
    }

    setViewport(x: number, y: number, w: number, h: number) {
        this.viewport.x = x;
        this.viewport.y = y;
        this.viewport.w = w;
        this.viewport.h = h;
    }

    private getActiveChunks(): Chunk[] {
        const firstI = math.floor(this.viewport.x / Stars.chunkLength);
        const firstJ = math.floor(this.viewport.y / Stars.chunkLength);

        const lastI = math.floor((this.viewport.x + this.viewport.w) / Stars.chunkLength);
        const lastJ = math.floor((this.viewport.y + this.viewport.h) / Stars.chunkLength);

        this.activeChunks.length = 0;
        for (let i = firstI; i <= lastI; i++) {
            for (let j = firstJ; j <= lastJ; j++) {
                table.insert(this.activeChunks, this.getChunk(i, j));
            }
        }
        return this.activeChunks;
    }

    draw() {
        for (const chunk of this.getActiveChunks()) {
            chunk.draw();
        }
    }
}
