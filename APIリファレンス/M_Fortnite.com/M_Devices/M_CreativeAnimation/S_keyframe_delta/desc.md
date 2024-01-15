# Instead of specifying the actual keyframe positions, we specify the keyframe deltas

This allows us to treat the initial position of the prop as keyframe 0 and avoid the question of how to get the prop to its initial location

For a animation_mode.Loop animation, the net rotation and translation must both be zero

Each delta is interpreted as a world-space transformation to be concatenated onto the previous transform(s)
