# [[Class]]/Fortnite.com/Devices/attribute_evaluator_device

- [一つ上位へ移動](../main.md)
- [API リファレンスのトップに移動](../../../main.md)

---

## インポート方法

```verse
using { /Fortnite.com/Devices }
```

## 説明

Evaluates attributes for agent when signaled from other devices. Acts as branching logic, checking whether the agent associated with the signal passes all of the tests setup in this device, then sends a signal on either `PassEvent` or `FailEvent`

### 基底クラス

- `creative_object`

- `creative_device_base`

- `trigger_base_device`

## メンバー

### 関数

- [EvaluateAgent](./F_EvaluateAgent/main.md)

### データ

- [FailEvent](./D_FailEvent/main.md)
- [PassEvent](./D_PassEvent/main.md)

---

- [一つ上位へ移動](../main.md)
- [API リファレンスのトップに移動](../../../main.md)
