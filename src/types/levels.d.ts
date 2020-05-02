interface Levels {
    addLevel(this: void, level: any): void;
    removeLevel(this: void, index: number): void;
    nameUsed(this: void, name: string): boolean;
}
