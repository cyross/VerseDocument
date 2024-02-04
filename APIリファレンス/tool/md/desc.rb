class MarkdownDescMd
  FILENAME = "desc.md"
  MODULE_TEMPLATE_LINES = <<'EOS'
# (TBD)
EOS
  CLASS_TEMPLATE_LINES = <<'EOS'
# (TBD)

## 基底クラス

- [`基底クラス名`]()

## 実装インタフェース

- [`インタフェース名`]()
EOS
  STRUCT_TEMPLATE_LINES = <<'EOS'
# (TBD)
EOS
  INTERFACE_TEMPLATE_LINES = <<'EOS'
# (TBD)

## 実装インタフェース

- [`インタフェース名`]()
EOS
  ENUMERATION_TEMPLATE_LINES = <<'EOS'
# (TBD)

- `(名前)`
  - (内容)
EOS
  EXTENSION_TEMPLATE_LINES = <<'EOS'
# (TBD)

## 書式

```Verse
%%_NAME_%%():(返却値の型)
```

## 引数

なし

- (名前)
  - 型
    - `(型)`
  - 内容
    - (内容)

## 返却値

- 型
  - `void`
  - `(型)`
- 内容
  - (内容)
EOS
  FUNCTION_TEMPLATE_LINES = <<'EOS'
# (TBD)

## 書式

```Verse
%%_NAME_%%():(返却値の型)
```

## 引数

なし

- (名前)
  - 型
    - `(型)`
  - 内容
    - (内容)

## 返却値

- 型
  - `void`
  - `(型)`
- 内容
  - (内容)
EOS
  DATA_TEMPLATE_LINES = <<'EOS'
# (TBD)

- 型
  - `listenable(payload)`
EOS
end
