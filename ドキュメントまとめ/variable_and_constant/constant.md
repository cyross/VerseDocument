# Verse の定数

## 特徴

- 値が格納される場所
- プログラムのライタイム中はその値を**変更できない**
- 宣言時に初期化し、宣言してから使用する必要がある

## 構文

### 型を指定した宣言

```Verse
Identifier : type = expression
```

| :Declaration: | | | > | Initialization |
| Constant Name |　 | Type |　 | Expression |
| `PlayerSpeed` | `:` | `float` | `=` | `2.0` |

### 型を省略した宣言

```Verse
Identifier := expression
```

| :Declaration: | | > | Initialization |
| Constant Name |　 |　 | Expression |
| `PlayerSpeed` | `:` | `=` | `2.0` |

- 型が省略された場合、その定数の型は定数の初期化で使用された式から推測される
- 型を省略できるのは**ローカル定数のみ**
- モジュールの定数は、それを含むモジュールの**インターフェースの一部を構成**する
  - 型がない場合はそのインタフェースでは明白ではない

### ローカル変数の宣言と使用

- ブロック内で定数を定義するとローカル定数扱い
  - ライフタイムはそのブロックでの実行中のときみ
  - 次のループに入ると、その定数は存在しなくなる
  - Javascript の `const` と同じようなもの

```Verse
loop:
    Limit := 20
    # ローカル変数の場合は、型を省略できる
    RandomNumber: int = GetRandomNumber()
    # 明示的に型を指定するとコードが読みやすくなる
    if (RandomNumber < Limit):
        break
```

- 各ループのイテレーションでは、`RandomNumber` という新しい定数が導入される
  - その値として `GetRandomNumber()` の結果が割り当てられる
