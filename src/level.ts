const currentDataVersion: string = "0.0.4";

export interface GroundTerrainColor {
    r: number;
    g: number;
    b: number;
}

function copyGroundTerrainColor(color: GroundTerrainColor): GroundTerrainColor {
    return {
        r: color.r,
        g: color.g,
        b: color.b,
    };
}

export interface GroundTerrain {
    color: GroundTerrainColor;
    points: number[];
}

function copyGroundTerrain(groundTerrain: GroundTerrain): GroundTerrain {
    return {
        color: copyGroundTerrainColor(groundTerrain.color),
        points: [...groundTerrain.points],
    };
}

function copyGroundTerrains(groundTerrains: GroundTerrain[]): GroundTerrain[] {
    let copy: GroundTerrain[] = [];
    for (const terrain of groundTerrains) {
        copy.push(copyGroundTerrain(terrain));
    }
    return copy;
}

export interface Level {
    dataVersion: string;
    name: string;
    terrainPoints: number[][];
    groundTerrain: GroundTerrain[];
    rocketStartingLocation: Rectangle | undefined;
    rocketLandingLocation: Rectangle | undefined;
    refuelStations: Rectangle[];
}

function copyRectangle(rect: Rectangle): Rectangle {
    return {
        x: rect.x,
        y: rect.y,
        w: rect.w,
        h: rect.h,
    };
}

function copyTerrainPoints(terrainPoints: number[][]): number[][] {
    let copy: number[][] = [];
    for (const terrain of terrainPoints) {
        copy.push([...terrain]);
    }
    return copy;
}

function copyRefuelStations(rectangles: Rectangle[]): Rectangle[] {
    let copy: Rectangle[] = [];
    for (const rect of rectangles) {
        copy.push(copyRectangle(rect));
    }
    return copy;
}

export function copyLevel(level: Level): Level {
    return {
        dataVersion: level.dataVersion,
        name: level.name,
        terrainPoints: copyTerrainPoints(level.terrainPoints),
        rocketLandingLocation: level.rocketLandingLocation ? copyRectangle(level.rocketLandingLocation) : undefined,
        rocketStartingLocation: level.rocketStartingLocation ? copyRectangle(level.rocketStartingLocation) : undefined,
        groundTerrain: copyGroundTerrains(level.groundTerrain),
        refuelStations: copyRefuelStations(level.refuelStations),
    };
}

export function newLevel(name: string): Level {
    return {
        dataVersion: currentDataVersion,
        name,
        rocketLandingLocation: undefined,
        rocketStartingLocation: undefined,
        terrainPoints: [],
        groundTerrain: [],
        refuelStations: [],
    };
}
