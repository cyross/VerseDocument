# Verse のグローバル変数

## 特徴

- モジュールのスコープで宣言される変数
- 現状、`weak_map(session, t)` 型しか宣言できない
  - `weak_map` に関しては [マップ](map.md) を参照
- `session` = 現在のフォートナイトの島インスタンス( `session` )の型
- 値の型( `t` )は任意

## 宣言

- ユーザーが現在いるセッションに対する値のみアクセス可能
  - 他のセッションで生きているグローバル変数にはアクセス不可
- グローバル変数 `weak_map` は安全な読み書きができない
  - すべてのセッションに対する値の読み取りやオーバーライドは不可
- `weak_map` には長さがない
  - `weak_map`の値を使用してイテレートできない
  - 現在アクティブなセッション数を確認できない

### 宣言・使用例

```Verse
using { /Verse.org/Simulation } # セッション用

var GlobalInt:weak_map(session, int) = map{}

ExampleFunction(): void =
    X := if (Y := GlobalInt[GetSession()]) then Y + 1 else 0
    if:
        set GlobalInt[GetSession()] = X
    Print("{X}")
```
