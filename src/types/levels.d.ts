import { Level } from "../levelbuilder";

export interface LevelModule {
    addLevel(this: void, level: Level): void;
    removeLevel(this: void, index: number): void;
    nameUsed(this: void, name: string): boolean;
    getLevels(): Level[];
}
