# [[Structure]]/Fortnite.com/Devices/CreativeAnimation/keyframe_delta

- [一つ上位へ移動](../main.md)

- [API リファレンスのトップに移動](/main.md)

---

## インポート方法

```verse

using { /Fortnite.com/Devices/CreativeAnimation }

```

## 説明

Instead of specifying the actual keyframe positions, we specify the keyframe deltas

This allows us to treat the initial position of the prop as keyframe 0 and avoid the question of how to get the prop to its initial location

For a animation_mode.Loop animation, the net rotation and translation must both be zero

Each delta is interpreted as a world-space transformation to be concatenated onto the previous transform(s)

## メンバー

### データ

- [DeltaLocation](./D_DeltaLocation/main.md)

- [DeltaRotation](./D_DeltaRotation/main.md)

- [DeltaScale](./D_DeltaScale/main.md)

- [Interpolation](./D_Interpolation/main.md)

- [Time](./D_Time/main.md)

---

- [一つ上位へ移動](../main.md)

- [API リファレンスのトップに移動](/main.md)
