# Verse の演算子について

- 数学演算などのアクションを実行するための特殊関数
  - `1 + 2` => `+`が演算子、`1, 2` が被演算子
  - 演算子 = operator
  - 被演算子 = operand

## 演算子の形式

### prefix

- 被演算子が 1 つ
- その前に演算子が置かれる

```Text
Operator Operand
```

例:

```Text
Operator Operand
   -        2
```

### infix

- 被演算子が 2 つ
- 被演算子の間に演算子が置かれる

```Text
Operand1 Operator Operand2
```

例:

```Text
Operand1 Operator Operand2
   1         +        2
```

### postfix

- 被演算子が 1 つ
- その後ろに演算子が置かれる

```Text
Operand Operator
```

例:

```Text
Operator Operand
isMorning   ?
```
