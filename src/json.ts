interface RxiJsonLibrary {
    decode(this:void, input: string): any;
    encode(this:void, obj: any): string;
}

const rxiJsonLibrary: RxiJsonLibrary = require("libs.json");

/**
 * wrapper around native lua
 */
export namespace json {
    export function encode(luaTable: any): string {
        return rxiJsonLibrary.encode(luaTable);
    }

    export function decode(json: string): any {
        return rxiJsonLibrary.decode(json);
    }
}