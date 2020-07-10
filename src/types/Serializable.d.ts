export type Serialized =
    | { name: "Menu" }
    | { name: "Playing"; level: string }
    | { name: "LevelPicker"; page: number }
    | { name: "GameModeChooserGameState" }
    | { name: "CampaignLevelPicker" }
    | { name: "PreLevelEditorGameState"; levelName: string };

export interface Serializable {
    serialize(): Serialized;
}
