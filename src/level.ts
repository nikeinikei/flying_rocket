const currentDataVersion: string = "0.0.2";

export interface Level {
    dataVersion: string;
    name: string;
    terrainPoints: number[][];
    rocketStartingLocation: Rectangle | undefined;
    rocketLandingLocation: Rectangle | undefined;
}

export function newLevel(name: string): Level {
    return {
        dataVersion: "0.0.2",
        name,
        rocketLandingLocation: undefined,
        rocketStartingLocation: undefined,
        terrainPoints: [],
    };
}
