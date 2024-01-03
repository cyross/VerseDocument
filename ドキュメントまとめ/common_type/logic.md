# Verse の logic 型

## 特徴

- ブール型の値
  - `true` と `false` がある
  - ともにロジックリテラル

### 宣言の例

```Verse
var TargetLocked : logic = false
```

## ロジック演算

### クエリ演算

- クエリ演算子(`?`)を使用して `logic` が `true` かどうかをチェック
  - `logic` が `false` の場合、式は失敗する

```Verse
if (TargetLocked?):
    ShowTargetLockedIcon()
```

### 比較演算

## 失敗する可能性がある式をロジックに変換する

- `logic{失敗する可能性がある式}`を使う

```Verse
IsMined := logic{GetRandomInt(0, MineFrequency) <> 0}
```

- `GetRandomInt(0, MineFrequency) <> 0` は 評価の結果が 0 のときに失敗する
- しかし、`logic{...}` を使用しているため、単純に `true` か `false` を返すようになる

## 標準ライブラリ

Verse の API としてロジック値の作成と仕様に役立つ関数が用意されている
