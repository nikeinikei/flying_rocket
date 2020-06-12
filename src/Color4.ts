export class Color {
    public r: number;
    public g: number;
    public b: number;
    public a: number;

    constructor(r: number, g: number, b: number, a?: number) {
        this.r = r;
        this.g = g;
        this.b = b;
        this.a = a || 1;
    }

    public static fromBytes(r: number, g: number, b: number) {
        const [r1, g1, b1] = love.math.colorFromBytes(r, g, b);
        return new Color(r1, g1, b1);
    }

    /**
     * @tupleReturn
     */
    unpacked(): [number, number, number, number] {
        return [this.r, this.g, this.b, this.a];
    }
}
