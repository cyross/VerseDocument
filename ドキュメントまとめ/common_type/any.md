# Verse の any 型

- すべての型のスーパータイプ
- これをパラメータとして利用すると、他の型での定義も必要になる
- エラーを起こすときに使用する型

```Verse
# 必ず失敗する関数
SampleFunction(:any): void = ?false

X: string := if (SampleFunction()): # 必ず "Y" が返る
  "X"
else:
  "Y"
```

- 無視したいパラメータを定義するときにも使える

```Verse
SampleFunction(:any, B: string): string = B

var T2: tuple(int, string) = (5, "FOX")

S1: string := SampleFunction(T2) # = "FOX"
```
