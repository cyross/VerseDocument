# パラメトリック型

- C#やTypeScriptで用いられるジェネリックのようなもの
- 現在は、不変(変数ではない)データのみパラメトリック型を利用可能

## 明示的な型引数

- 引数の型は `type`
- クラス定義でのみ使用でき、パラメトリック型に関する継承も許可されていない
- 再帰が直接的であるときのみ、再帰的に自分自身の型を参照可能

```Verse
sample_class(type1: type, type2: type) := class:
  First: type1
  Second: type2

Sample01 := sample_class(int, string){ First := 5, Second := "ABC"}
```

## 暗黙的な型引数

- `type` と `where` キーワードを使用し、パラメトリック型を暗黙的に取得できる
- `subtype` キーワードを使用して、引数として渡せる型を制限できる
  - `type` は、 `subtype(any)` の省略表現として見られる時がある

```Verse
sample_class(type1: type, type2: type) := class:
  First: type1
  Second: type2

MakeSample(Value1: T, Value2: U where T:type, U: type) : sample_class(T, U) =
  sample_class(T, U){ First := value1; Second := value2}

Sample02 := MakeSample(5, "ABC") # 暗黙的に sample_class(int, string) が定義される
```

## 共変性と反変性

- 型が複合型もしくはまたは関数で使用される場合の2つの型の関係性

### 共変性

- コードでより汎用的なものが期待される場合に、より具体的な型を使用する
  - クラスの継承関係でも言えており、スーパークラスで定義した関数の引数としてサブクラスのインスタンスを渡せることも共変
- 通常、関数の出力用

#### 共変性の例1

- `IsGreater` 関数を例に取る

```Verse
IsGreater(A:T, B:T where T: type): logic =
  A > B
```

- 型 `logic` は関数の出力として**共変**の関係を持つ

#### 共変性の例2

- クラス `a` のサブクラス `sub_a` を例に取る。

```Verse
a := class:
  Val1: int
sub_a := class(a):

b := class:
  Make(X: int): a =
  a(){ Val1 := X}

sub_b := class(b):
  Make<override>(X: int): sub_a =
  sub_a(){ Val1 := X}
```

- `sub_b`.`Make` 関数の戻り値の型 `sub_a` は `a` に対して**共変**の関係を持つ

### 反変性

- コードでより具体的なものが期待される場合に、より汎用的な型を使用する
- 通常、関数の入力用

#### 反変性の例1

- 共変性と同様、 `IsGreater` 関数を例に取る

```Verse
IsGreater(A:T, B:T where T: type): logic =
  A > B
```

- 型 `T` は関数の入力として**反変**の関係を持つ

#### 反変性の例2

- クラス `a` のサブクラス `sub_a` を例に取る。

```Verse
a := class:
  Val1: int
sub_a := class(a):

b := class:
  Make(X: int): a =
    a(){ Val1 := X}
  Approve(A: a): void = {}

sub_b := class(b):
  Make<override>(X: int): sub_a =
    sub_a(){ Val1 := X}
```

- `sub_b`.`Approve` 関数の引数 `sub_a` は `a` に対して**反変**の関係を持つ
  - クラス `sub_a` のインスタンスはすべて クラス `a` のインスタンスであることがわかっているため
