# Used to move and animate the position of `creative_prop` objects

- See `creative_prop.GetAnimationController` for information on acquiring an instance of an animation_controller for a given `creative_prop`.
- See `SetAnimation` for details on authoring movement and animations.

- `InvalidObject`
  - [TBD]The target of the animation is not an animatable prop. This could be because:
    - It is not a `creative_prop` that can be animated.
    - It was disposed or otherwise destroyed.
    - It has the 'Register with Structural Grid' option set in UEFN.
- `AnimationNotSet`
  - [TBD]No animation has been successfully set via `animation_controller.SetAnimation`, or that animation has been cleared by a failed call to `animation_controller.SetAnimation`
- `Stopped`
  - [TBD]Animation has either never started, finished, or was explicitly stopped
- `Playing`
  - [TBD]Animation is playing
- `Paused`
  - [TBD]Animation is paused
