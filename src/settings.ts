export namespace Settings {
    let development = false;

    export function setDevelopment(val: boolean) {
        development = true;
    }

    export function isDevelopment(): boolean {
        return development;
    }
}
