export function updateSmoothValue(currentValue: number, targetValue: number, rate: number, dt: number): number {
    return currentValue + (targetValue - currentValue) * rate * dt;
}