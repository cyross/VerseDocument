# [[Enumeration]]/Fortnite.com/Devices/CreativeAnimation/animation_mode

- [一つ上位へ移動](../main.md)

- [API リファレンスのトップに移動](/main.md)

---

## インポート方法

```verse

using { /Fortnite.com/Devices/CreativeAnimation }

```

## 説明

 Animation play modes

- See `creative_prop.GetAnimationController` for information on acquiring an instance of an animation_controller for a given `creative_prop`.

- See `SetAnimation` for details on authoring movement and animations.

- `OneShot`

  - アニメーションが終端までたどり着いたときに停止します

- `PingPong`

  - 最後の `keyframe_delta` に到達したとき、アニメーションを逆再生します

- `Loop`

  - アニメーションをループ再生します。ループの終端が先端につながるように作られている必要があります

## メンバー

(メンバーなし)

---

- [一つ上位へ移動](../main.md)

- [API リファレンスのトップに移動](/main.md)
