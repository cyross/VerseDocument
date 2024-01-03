# [[Class]]/Verse.org/Simulation/Tags/tag_search_criteria

- [一つ上位のモジュールへ移動](../main.md)
- [API リファレンスのトップに移動](../../../../main.md)

---

## インポート方法

```verse
using { /Verse.org/Simulation/Tags }
```

## Member

- メンバーなし

## Data

### RequireTags

- 型
  - `[]tag`
- 説明
  - オブジェクトに必要なタグコレクション

### PreferredTags

- 型
  - `[]tag`
- 説明
  - [TBD] Tags that are used if no required tags are specified. These are treated as if any of them will do.

### ExclusionTags

- 型
  - `[]tag`
- 説明
  - オブジェクトに含めてはいけないタグコレクション。すべてのアイテムは、これらのタグを除外して検索する。

### SortType

- 型
  - `tag_search_sort_type`
- 説明
  - タグが要求されたときに、ソートして返すかを指定するためのフラグ

---

- [一つ上位のモジュールへ移動](../main.md)
- [API リファレンスのトップに移動](../../../../main.md)
