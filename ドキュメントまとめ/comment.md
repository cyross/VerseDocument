# Verse のコメントについて

## 単一行のコメント

- `#` から行末までの間にあるものは、すべてコードコメントの一部

```Verse
1+2 # こんにちは
```

## インラインのブロックコメント

- `<#` から `#>` までの間にあるものは、すべてコードコメントの一部
- インラインのブロックコメントは単一行の式の間に含められる
  - それぞれの式の動作は変わりません。

```Verse
1<# インライン コメント #>+2
```

## 複数行のブロックコメント

- `<#` から `#>` までの間にあるものは、すべてコードコメントの一部
- コメントを複数行にまたがって追加できる

```Verse
DoThis()
<# それらは
複数の長い行を
実行できます #>
DoThat()
```

## ネスティングされたブロックコメント

- `<#` から `#>` までの間にあるもは、すべてコードコメントの一部
- ネスティング可能
- このタイプのコードコメントは、テスティングやデバッグを行う際に、既存のコードコメントを変更せずに、行内にあるいくつかの式をコメントアウトしたい場合に便利

```Verse
<# ブロックコメントは <# このように #> ネスティングします　#>
```

## インデントされたコメント

- `<#>` の後の新しい行にあり、4 つのスペースでインデントされたものは、すべてコードコメントの一部
- 4 つのスペースでインデントせずに行を開始すると、その行はコードコメントには含まれず、コードコメントが終了する

```Verse
<#>
    複数行にまたがる
    長い
    説明です。
DoThis() # この式はインデントされたコメントには含まれません。
```
