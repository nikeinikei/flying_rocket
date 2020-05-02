interface WeakCollection {
    add(e: any): void;
    forEach(consumer: (this: void, e: any) => void): void;
}
