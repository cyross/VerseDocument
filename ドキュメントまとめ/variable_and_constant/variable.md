# Verse での変数

## 特徴

- 宣言は定数に似ているが、どの時点でも値を変更できる
  - `var`キーワードを使用する

## 構文

### 宣言

```Verse
var Identifier : type = expression
```

| :Declaration: | | | > | Initialization |
| Variable Name |　 | Type |　 | Expression |
| `PlayerSpeed` | `:` | `float` | `=` | `2.0` |

### 代入

```Verse
set Identifier := expression
```

| :Assignment: | | | |
|　 | Variable Name |　 | Expression |
| `set` | `PlayerSpeed` | `=` | `2.0` |

### 宣言と使用の例

```Verse
var MaxHealthUpgrade : int = 10
```

- 上記の宣言では以下の意味を持つ
  - 整数型の変数
  - 初期値は 10
  - いつでも必ず 10 ということはない

```Verse
var x:int = 0
set x += 1 # この処理は関数型としてよろしくない
set x *= 2 # この処理は関数型としてよろしくない
```
