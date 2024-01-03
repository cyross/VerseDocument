# [[Interface]]/Verse.org/Simulation/Tags/tag_view

- [一つ上位のモジュールへ移動](../main.md)
- [API リファレンスのトップに移動](../../../../main.md)

---

## 概要

問い合わせ可能なタグコレクション群を定義するときに使用するインタフェース

## インポート方法

```verse
using { /Verse.org/Simulation/Tags }
```

## Member

- メンバーなし

## Function

### Has

- 書式
  - `Has<public>(TagToCheck:tag)<decides><varies><transacts>:logic`
- 引数
  - `TagToCheck`: `tag`
- 戻り値
  - `logic`
- 説明
  - タグのコレクション内に引数で示したタグが含まれていれば `true` 、そうでなければ `false` を返す

### HasAny

- 書式
  - `HasAny<public>(InTags:[]tag)<decides><varies><transacts>:logic`
- 引数
  - `InTags`: `[]tag`
- 戻り値
  - `logic`
- 説明
  - タグのコレクション内に引数で示したタグコレクションのどれかが含まれていれば `true` 、そうでなければ `false` を返す

### HasAll

- 書式
  - `Has<public>(TagToCheck:tag)<decides><varies><transacts>:logic`
- 引数
  - `InTags`: `[]tag`
- 戻り値
  - `logic`
- 説明
  - タグのコレクション内に引数で示したタグコレクションのすべてが含まれていれば `true` 、そうでなければ `false` を返す

---

- [一つ上位のモジュールへ移動](../main.md)
- [API リファレンスのトップに移動](../../../../main.md)
