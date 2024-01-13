# 属性と指定子

- [参照](https://dev.epicgames.com/documentation/ja-jp/uefn/specifiers-and-attributes-in-verse)

## エフェクト指定子

関数の公開が許可される動作のカテゴリを、指定子を使って付与できます。

関数定義(引数を定義する括弧)・`class` キーワードの後ろでのみ付与できます。

エフェクトが省略されたときは、 `no_rollback` のみ付与されたと意味します。

特定のエフェクトを持つ関数を呼び出すには、呼び出し元もそのエフェクトを保持している必要があります。

### エフェクトの種類

- 排他的
  - 関数または `class` キーワードに付与可能
  - 一つだけ追加可能
- 加法的
  - 関数または `class` キーワードに付与可能
  - すべてまたは一部を追加可能

### エフェクト指定子の書式

```Verse
# 関数定義の場合
name()<指定子> : type = codeblock

# クラス定義の場合
class_name := class<指定子>():
```

### 排他的エフェクト指定子

### transacts

このエフェクトは、関数によって行われるすべてのアクションがロールバック可能であることを示しています。

変更可能な変数（`var`）が書き込まれる場合には、`<transacts>` エフェクトが必要です。コードをコンパイルする際に、ロールバックできない関数に `<transacts>` エフェクトが追加された場合には通知されます。

ただし、`<native>` 属性を持つ関数については、このチェックは行われないことに注意してください。

```Verse
# 関数定義の場合
name()<transacts> : type = codeblock

# クラス定義の場合
class_name := class<transacts>():
```

### varies

このエフェクトは、関数への同じ入力が常に同じ出力を生み出さない可能性を示しています。

また、`<varies>` エフェクトは、関数の振る舞いが含まれるパッケージの新しいバージョンでは同じであることが保証されていないことも示しています。

```Verse
# 関数定義の場合
name()<varies> : type = codeblock

# クラス定義の場合
class_name := class<varies>():
```

### computes

このエフェクトは、同じ引数が指定されたときは同じ結果を返すことを示しています。

このエフェクトを付与するときは、副次的エフェクトがない関数が必要となります。

`<native>` 指定子を持つときはコンパイラによるチェックがありません(逆に言うと、 `<native>` 指定子がないときはコンパイラがチェックします)。

```Verse
# 関数定義の場合
name()<computes> : type = codeblock

# クラス定義の場合
class_name := class<computes>():
```

### converges

このエフェクトは、関数を実行したことによる副次的なエフェクトが無いことを保証します。

更に、関数が確実に完了する(無限再帰しない)ことを保証します。

`<native>` 指定子を持つ関数でのみ表示されますが、コンパイラではチェックしません。

また、`<converges>` エフェクトを付与するためには、クラスのデフォルト値またはグローバル変数の値を提供するコードが必要です。

```Verse
# 関数定義の場合
name()<converges> : type = codeblock

# クラス定義の場合
class_name := class<converges>():
```

### 加法的エフェクト指定子

### decides

その関数は失敗する可能性があり、この関数の呼び出しは失敗する可能性がある式であることを示します。

`<decides>` エフェクトを持つ関数定義は、`<transacts>` エフェクトも持たなければならず、つまり、この関数によって行われるアクションは、関数内のどこかで失敗があった場合、ロールバックされる可能性があります（アクションが実行されなかったかのように）。

```Verse
# 関数定義の場合
name()<transacts><decides> : type = codeblock

# クラス定義の場合
class_name := class<transacts><decides>():
```

### suspends

関数が非同期であることを指定します。

```Verse
# 関数定義の場合
name()<suspends> : type = codeblock

# クラス定義の場合
class_name := class<suspends>():
```

## アクセス指定子

メンバーと何でどのようにやり取りできるのかを定義します。

メンバー名かキーワード `var` の後ろでのみ付与できます。

省略時は `internal` が指定されているものとします。

### アクセス指定子の書式

```Verse
# メンバー定義の場合
name<指定子> : type = value

# var を使用する場合
var<指定子> name : type = value
```

### public(アクセス指定子)

その属性は、どこからでもアクセス可能なことを示しています。

モジュール、クラス、インターフェース、構造体、列挙型、メソッド、およびデータに使用できます。

```Verse
# メンバー定義の場合
name<public> : type = value

# var を使用する場合
var<public> name : type = value
```

### protected

その属性は、現在のクラスとサブタイプからのみ、アクセス可能なことを示しています。

クラス、インターフェース、構造体、列挙型、非モジュールメソッド、およびデータに使用できます。

```Verse
# メンバー定義の場合
name<protected> : type = value

# var を使用する場合
var<protected> name : type = value
```

### private

その属性は、現在のスコープ(モジュール・クラス・構造体など)内でのみアクセス可能なことを示しています。

クラス、インターフェース、構造体、列挙型、非モジュールメソッド、およびデータに使用できます。

```Verse
# メンバー定義の場合
name<private> : type = value

# var を使用する場合
var<private> name : type = value
```

### internal(アクセス指定子)

その属性は、現在のスコープのすぐ外側のモジュールでのみアクセス可能なことを示しています。

モジュール、クラス、インターフェース、構造体、列挙型、メソッド、およびデータに使用できます。

```Verse
# メンバー定義の場合
name<internal> : type = value

# var を使用する場合
var<internal> name : type = value
```

## クラス指定子

クラスまたはそのメンバーの特性を指定子ます(サブクラスを作れるか、など)。

### クラス指定子の書式

```Verse
class_name := class<指定子>():
    # フィールド
    FieldName<指定子>: type = value
    # メソッド
    MethodName()<指定子>: type = {}
```

### abstract

これが付与されたクラスは、直接インスタンスの作成ができません。

また、メソッドはメソッドの引数や返却値の型を指定するだけで実装は記載しません。

このようなクラスを `抽象クラス` と呼びます。

このクラスを継承・インタフェース実装の際に使用することで、同じインタフェースで違う処理ができるクラスを作りやすくなる。

```Verse
abstract_class := class<abstract>:
    Call() : void # 実装はしない

main_class_1 := class(abstract_class):
    Call() : void = {...} # ここで実装

main_class_2 := class(abstract_class):
    Call() : void = {...} # ここで実装

Value1 := main_class_1{}
Value2 := main_class_2{}
```

(※)クラスメソッドにも `<abstract>` の指定ができるとあるが、どのように使うのだろう？？？

### concrete

これが付与されたときは、`<abstract>` とは逆に、全てのフィールドはすべてデフォルト値を持っています。

このようなクラスを `具象クラス` と呼びます。

具象クラスは、空のアーキタイプでインスタンスが作れることが条件です。

```Verse
concrete_class := class<concrete>:
     # デフォルト値を必ず指定
    ID: int = 1
    var Prop1: string = "default"

Value := concrete_class{} # 具象クラスのインスタンス化
Value := concrete_class{Id := 10, Prop1 := "c1"} # 値を渡してのインスタンス化も可能
```

このクラスを継承したときは、自動的に `<concrete>` が付与されたものとします。

抽象クラスから具象クラスへ継承するとき、それぞれは同じモジュールスコープに存在しなければいけません。

### unique

これが付与されたときは、各インスタンスが一意になることを保証します。

```Verse
unique_class := class<unique>:
    var Name: string

Value1 := unique_class{Name := "a"}
Value2 := unique_class{Name := "a"}

Value1 <> Value2 # true
```

これが付与されたときだけ、比較演算子を使ってインスタンスの比較ができるようになります。
アーキタイプに同じ値を指定子たとしても、別々に生成されたときは違うインスタンスとして識別できます。

### final

これはクラス・フィールド・メソッドに付与できますが、それぞれ効果が変わります。

クラスに付与されたときは、サブクラスを作れなくなります。

フィールド・メソッドに付与されたときは、サブクラスでオーバーライドできなくなります。

```Verse
# クラス
class_name := class<final>:

# フィールド
class_name := class:
    Field1<final>: int = 10

# メソッド
class_name := class:
    Method1()<final>: int = {}
```

### public(クラス指定子)

これが付与されると、モジュールの外でもコンストラクタを呼び出すことができます。

```Verse
module_name := module:
   class_name := class<public>:


MakeClassName(): void =
    MyInstance := module_name.class_name{}
```

### internal(クラス指定子)

これが付与されると、現在のすぐ外側のモジュールでのみコンストラクタを呼び出すことができます。

```Verse
module_name := module:
    class_name := class<internal>():
      :
    MakeClassName(): void =
        MyInstance := class_name{} # エラーにならない


MakeClassName(): void =
    MyInstance := module_name.class_name{} # エラーになる
```

## 実装指定子

### native

これが付与されているときは、 C++ で実装されていることを示しています。

`<native>` 指定子を持つ Verse の定義は、開発者が実装を記述できる C++ の定義を自動生成します。

クラス、インターフェース、列挙型、メソッド、およびデータに使用できます。

```Verse
# クラス
class_name := class<native>():
# インタフェース
interface_name := interface<native>():
# 列挙型
enum_name := enum<native>():
# メソッド
Method1<native>(): void = external {}
# データ
enum_name := enum<native>():
```

### native_callable

これが付与されているときは、この関数が C++ で実装されており、他の C++ コードから呼び出される可能性があることを示しています。

この指定子はサブクラスには伝播されません。

この指定子を持つメソッドをオーバーライドするときは、定義にこの指定子を追加する必要はありません。

```Verse
# メソッド
Method1<native_callable>(): void = external {}
```

## 属性

Verse 言語以外で使用される動作を指定子ます。

定義の前のコード業に追加します。

属性は、先頭に `@` を追加します。

### editable

UEFN から直接変更できる公開されたプロパティであることを示します。
値を変更するために、Verse のコードを修正する必要がありません。

```Verse
@editable
ActionRate: number = 0.5 # UEFN上で0.8などに変更可能
```
