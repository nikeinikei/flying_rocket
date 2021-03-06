export abstract class GameState {
    /**
     * name of the game state
     */
    abstract getName(): string;

    /**
     * objects that are dependant on all the löve callbacks
     * convenient method so all the callbacks don't have to be hooked up manually
     */
    getObjects(): unknown[] {
        return [];
    }

    /**
     * called when pushed onto the stack
     */
    enter() {}

    /**
     * called when state becomes active again after the state
     * above gets popped
     */
    onActive(data?: any) {}

    /**
     * called when getting destroyed because it gets popped
     */
    leave(): any | null {
        return null;
    }

    /**
     * called when state becomes inactive because another state gets pushed onto the stack
     */
    onInactive() {}
}
