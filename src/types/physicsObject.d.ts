interface PhysicsObject<S> {
    body: Body;
    shape: S;
    fixture: Fixture;
}