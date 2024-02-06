# [[Function]]/Fortnite.com/Devices/SpawnProp

- [一つ上位へ移動](../main.md)
- [API リファレンスのトップに移動](../../../main.md)

---

## インポート方法

```verse
using { /Fortnite.com/Devices }
```

## 説明

プロップを実行時に生成する

仕掛けに依存することなく、ゲーム中ならばどのタイミングでも生成できる

`creative_prop` クラスのサブクラスなら全て生成できる

### 書式

```verse
(1)
pawnProp<native><public>(Asset:creative_prop_asset, Position:vector3, Rotation:rotation)<varies><transacts>:(?creative_prop, spawn_prop_result)
(2)
SpawnProp<native><public>(Asset:creative_prop_asset, Transform:transform)<varies><transacts>:(?creative_prop, spawn_prop_result)
```

### 引数

- Asset
  - 型
    - `creative_prop_asset`
  - 内容
    - 生成するプロップ
    - 指定できるのは、アウトライナーに存在するプロップではなく、コンテンツブラウザに表示されるアセットが使用可能
      - `Fortnite/Props` 以下のフォルダに収められているアセット

- Position
  - 型
    - `vector3`
  - 内容
    - (内容)
- Rotation
  - 型
    - `rotation`
  - 内容
    - (内容)
- Transform
  - 型
    - `transform`
  - 内容
    - (内容)

### 返却値

- 型
  - `(?creative_prop, spawn_prop_result)`

- 内容
  - `?creative_prop`: 生成したプロップ(失敗する可能性あり)
  - `spawn_prop_result`: 生成の結果

## メンバー

(メンバーなし)

---

- [一つ上位へ移動](../main.md)
- [API リファレンスのトップに移動](../../../main.md)
