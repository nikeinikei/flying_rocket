export type Serialized =
    { name: "Menu" } |
    { name: "Playing", level: string } |
    { name: "LevelPicker" } |
    { name: "GameModeChooserGameState" };

interface Serializable {
    serialize(): Serialized;
}