let fixers = new Table<string, (this: void, data: any) => boolean>();
fixers.set("->0.0.1", data => {
    data.dataVersion = "0.0.1";
    data.terrainPoints = data.terrainPoints._items;

    return true;
});
fixers.set("0.0.1->0.0.2", data => {
    data.dataVersion = "0.0.2";
    let points = data.terrainPoints;
    let newTerrainPoints = [points];
    data.terrainPoints = newTerrainPoints;

    return true;
});

interface LevelData {
    dataVersion: string;
}

let versionHistory = ["0.0.1", "0.0.2"];

export function fixData(this: void, data: LevelData): boolean {
    if (data.dataVersion == undefined) {
        const fixer = fixers.get("->0.0.1");
        if (fixer) {
            const success = fixer(data);
            if (!success) {
                return false;
            } else {
                print("[data fixer] successful transformation, no undefined->0.0.1");
            }
        } else {
            return false;
        }
    }

    let currentVersion = versionHistory[versionHistory.length - 1];
    if (data.dataVersion != currentVersion) {
        let oldDataVersionIndex = versionHistory.indexOf(data.dataVersion);
        let currentDataVersionIndex = versionHistory.indexOf(currentVersion);

        for (let i = oldDataVersionIndex; i < currentDataVersionIndex; i++) {
            let fixerKey = versionHistory[i] + "->" + versionHistory[i + 1];
            let fixer = fixers.get(fixerKey);
            if (!fixer) {
                error("fixer not found for " + fixerKey);
            } else {
                if (!fixer(data)) {
                    return false;
                } else {
                    print("[data fixer] successful transformation, " + fixerKey);
                }
            }
        }
        return true;
    } else {
        return true;
    }
}
