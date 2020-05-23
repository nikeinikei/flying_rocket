/**
 * the game is divided into several game states.
 * All the game states are managed through a stack
 * 
 * If the stack is empty the game will be automatically closed
 * 
 * Implementation in pure lua in application.lua
 */
declare module Application {
    function pushState(this: void, state: any): void;
    function popState(this: void): void;
}
