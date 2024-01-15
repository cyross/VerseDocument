# [[Function]]/Verse.org/Simulation/Tags/tag_view/HasMany

- [一つ上位へ移動](../main.md)

- [API リファレンスのトップに移動](/main.md)

---

## インポート方法

```verse

using { /Verse.org/Simulation/Tags }

```

## 説明

 タグのコレクション内に引数で示したタグコレクションのどれかが含まれていれば `true` 、そうでなければ `false` を返す

- 書式

  - `HasAny<public>(InTags:[]tag)<decides><varies><transacts>:logic`

- 引数

  - `InTags`: `[]tag`

- 戻り値

  - `logic`

- アクセス指定子

  - `<public>`

- 排他的エフェクト指定子

  - `<transacts>`

  - `<varies>`

- 加法的エフェクト指定子

  - `<decides>`

## メンバー

(メンバーなし)

---

- [一つ上位へ移動](../main.md)

- [API リファレンスのトップに移動](/main.md)
