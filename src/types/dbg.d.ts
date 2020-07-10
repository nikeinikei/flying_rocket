/** @noSelfInFile */

/**
 * useful debug functions
 * implementation in lua/util/dbg
 */
declare namespace dbg {
    function shallowSequenceToString(t: Table): string;
    function printShallowSequence(t: Table): void;

    function shallowTableToString(t: Table): string;
    function printShallowTable(t: Table): void;
}
