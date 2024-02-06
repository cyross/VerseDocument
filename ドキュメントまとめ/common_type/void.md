# Verse の void 型

- 定数・関数パラメータ・関数の戻り値として、役に立たない結果を返す型(常に `false` を返す)
- 転じて、値を返さないことを示す型
  - 関数型プログラミングの体を成すための仕様と考えられる

## 例

```Verse
Foo() : void = {}
```

- `Foo` 関数は、必ず `false` を返す

```Verse
FirstInt(X: int, :void) : int = x
```
