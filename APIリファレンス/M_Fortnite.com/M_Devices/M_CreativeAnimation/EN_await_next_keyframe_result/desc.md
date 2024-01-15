# `animation_controller.AwaitNextKeyframe` 関数を実行した結果を示します

- `KeyframeReached`
  - The next keyframe has been reached successfully
- `NotPlaying`
  - No animation is currently playing and this function call has returned immediately
- `AnimationAborted`
  - The animation was canceled either due to the object being destroyed, becoming invalid, or because it was moved via some other API
