# Verseのオプション型

- 一つの値、もしくは空を示す型
- 宣言するときは、型名の先頭に `?` を追加する
- 初期値を指定しないときは設定されていない任意の(例: `?false` )を設定する

```Verse
var Option1: ?int = false # 設定されていない任意の値
var Option2: ?string = "ABC" # 初期値を割り当て

set Option1 := option{100} # 100を割り当て
set Option2 := "DEF" # "DEF"を割り当て

set Option2 := false # 空にする

# Option2 に値が設定されていればその値、 false のときは "NOTHING" が Z に割り当てられる
Z: string :=
  if (VAR := Option2?):
    VAR
  else:
    "NOTHING"
```
