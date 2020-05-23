import { Level } from "../levelbuilder";

/**
 * implementation in pure lua
 */
export interface LevelModule {
    addLevel(this: void, level: Level): void;
    removeLevel(this: void, index: number): void;
    nameUsed(this: void, name: string): boolean;
    getLevels(): Level[];
}
