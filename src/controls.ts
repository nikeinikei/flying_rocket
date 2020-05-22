import { KeyConstant } from "love.keyboard";

interface ControlsType {
    game: {
        applyThrust: KeyConstant;
        rotateRight: KeyConstant;
        rotateLeft: KeyConstant;
    };
}

export const Controls: ControlsType = {
    game: {
        applyThrust: "space",
        rotateRight: "right",
        rotateLeft: "left",
    },
};
