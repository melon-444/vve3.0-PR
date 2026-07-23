# `vve_vehicle_lite_1.0`

`vve_vehicle_lite_1.0` 是减少一层实体的载具模板。它保留标准载具的数据、底盘探测、控制、引擎与座椅接口，但让 `item_display` 自身同时承担物理根实体和车身显示。

模板源码位于 `memory_storage/vve_vehicle_lite_1.0/`。

## 与标准版的结构差异

```text
item_display 物理根实体兼车身
└─ interaction 座椅
```

因此 `_new`、`_del`、座椅上下车、碰撞点可视化、显示更新和同步函数都比标准版少一次 `on passengers`。数据字段及 `_class` 默认参数与 [`vve_vehicle_1.0`](vve_vehicle_1.0.md) 相同。

轻量版主要减少实体数量和跨乘客访问，适合不需要独立物理碰撞根的载具。

## 物理与控制

默认 `tick` 仍调用 `main_c`，并使用相同的：

- 八个底盘点及动态探测；
- 位移、冲量、力偶和贴地姿态修正；
- `control/get_signal`、地面/空中控制；
- 阻尼引擎和速度上限；
- `_seat_on`、`_seat_off` 与快捷管理接口。
