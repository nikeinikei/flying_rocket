export class Color {
    public r: number;
    public g: number;
    public b: number;
    public a: number;
    
    constructor(r: number, g: number, b: number, a: number) {
        this.r = r;
        this.g = g;
        this.b = b;
        this.a = a;
    }

    /**
     * @tupleReturn
     */
    unpacked(): [number, number, number, number] {
        return [this.r, this.g, this.b, this.a];
    }
}