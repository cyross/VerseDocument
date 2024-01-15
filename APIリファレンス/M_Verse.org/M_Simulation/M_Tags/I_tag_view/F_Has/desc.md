# タグのコレクション内に引数で示したタグが含まれていれば `true` 、そうでなければ `false` を返す

- 書式
  - `Has<public>(TagToCheck:tag)<decides><varies><transacts>:logic`
- 引数
  - `TagToCheck`: `tag`
- 戻り値
  - `logic`
- アクセス指定子
  - `<public>`
- 排他的エフェクト指定子
  - `<transacts>`
  - `<varies>`
- 加法的エフェクト指定子
  - `<decides>`
