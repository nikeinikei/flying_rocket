/**
 * this collection stores weak references to all added elements
 * Useful when holding objects, without preventing garbage collection
 * 
 * Implementation in pure lua
 */
interface WeakCollection {
    add(e: any): void;
    forEach(consumer: (this: void, e: any) => void): void;
}
