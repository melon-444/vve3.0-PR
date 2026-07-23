# `vve_block_b_1.0`

`vve_block_b_1.0` 是 `vve_block_1.0` 的 `block_display` 适配版。物理数据、标量惯量、碰撞点接口和默认调度均与普通版相同，差异集中在展示内容和运动同步。

模板源码位于 `memory_storage/vve_block_b_1.0/`。

## 与普通版的差异

| 文件 | 适配内容 |
| --- | --- |
| `_update_display` | 写入 `block_state` 适用的缩放和中心平移 |
| `_sync_motion` | 直接合并 `transformation`，并调整实体位置与局部平移 |
| `main*` / `main_sync` | 调用模块自己的 `_sync_motion` |
| `set_operation` | 使用 `block_state` 设置命令方块，而不是物品槽 |

自定义同步会把方块展示实体的几何中心从默认角点偏移到刚体中心，并使用四元数更新 `left_rotation`。

## 数据、碰撞与接口

数据字段、默认值和物理入口与 [`vve_block_1.0`](vve_block_1.0.md) 相同：默认半边长 `0.25`、质量 `17`、标量惯量 `5.00`，默认 `tick` 调用 `main_c`。

模板仍不把实例注册为实体介质；`b` 只表示显示实体适配，不改变碰撞职责。
