export abstract class GameState {
    /**
     * name of the game state
     */
    abstract getName(): string;

    /**
     * called when pushed onto the stack
     */
    enter() {}

    /**
     * called when state becomes active again after the state
     * above gets popped
     */
    onActive<T>(data?: T) {}

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
