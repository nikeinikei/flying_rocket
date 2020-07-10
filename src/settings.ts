export namespace Settings {
    let development = false;

    export function setDevelopment(val: boolean) {
        development = val;
    }

    export function isDevelopment(): boolean {
        return development;
    }

    export function getRestartFilePath(): string {
        return "restart.json";
    }
}
