let fixers = new Table<string, (this:void, data: any) => boolean>();

interface LevelData {
    dataVersion: string;
}

let versionHistory = [
    "0.0.1"
];

export function fixData(this:void, data: LevelData): boolean {
    print("fixData " + tostring(data));
    let currentVersion = versionHistory[versionHistory.length - 1];
    if (data.dataVersion != currentVersion) {
        let oldDataVersionIndex = versionHistory.indexOf(data.dataVersion);
        let currentDataVersionIndex = versionHistory.indexOf(currentVersion);

        for (let i = oldDataVersionIndex; i < currentDataVersionIndex; i++) {
            let fixerKey = versionHistory[i] + "->" + versionHistory[i+1];
            let fixer = fixers.get(fixerKey);
            if (!fixer) {
                error("fixer not found for " + fixerKey);
            } else {
                if (!fixer(data)) {
                    return false;
                }
            }
        }
        return true;
    } else {
        return true;
    }
}
