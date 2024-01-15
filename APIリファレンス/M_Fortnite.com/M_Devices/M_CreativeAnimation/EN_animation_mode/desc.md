# Animation play modes

- See `creative_prop.GetAnimationController` for information on acquiring an instance of an animation_controller for a given `creative_prop`.
- See `SetAnimation` for details on authoring movement and animations.

- `OneShot`
  - アニメーションが終端までたどり着いたときに停止します
- `PingPong`
  - 最後の `keyframe_delta` に到達したとき、アニメーションを逆再生します
- `Loop`
  - アニメーションをループ再生します。ループの終端が先端につながるように作られている必要があります
