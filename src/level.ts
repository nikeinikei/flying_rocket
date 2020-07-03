const currentDataVersion: string = "0.0.3";

export interface Level {
    dataVersion: string;
    name: string;
    terrainPoints: number[][];
    rocketStartingLocation: Rectangle | undefined;
    rocketLandingLocation: Rectangle | undefined;
    refuelStations: Rectangle[];
}

export function newLevel(name: string): Level {
    return {
        dataVersion: currentDataVersion,
        name,
        rocketLandingLocation: undefined,
        rocketStartingLocation: undefined,
        terrainPoints: [],
        refuelStations: [],
    };
}
