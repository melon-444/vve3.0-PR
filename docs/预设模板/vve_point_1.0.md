# `vve_point_1.0`

`vve_point_1.0` 是质点模块骨架模板。它只保存质量、位置和线速度，不维护姿态、角速度或惯量，适合粒子、小型抛射物以及不需要转动响应的对象。

模板源码位于 `memory_storage/vve_point_1.0/`，生成的模块依赖内置 `vve:point` 运动与同步函数。

## 数据结构与默认值

| 字段 | 精度 | 默认值 | 含义 |
| --- | --- | ---: | --- |
| `mass` | `1` | `1` | 质量 |
| `center[0..2]` | `1w` | `[0,0,0]` | 世界坐标 |
| `velocity[0..2]` | `1w` | `[0,0,0]` | 线速度 |

`_class` 先清空临时对象，再通过 `vve:point/_anchor_to` 建立默认位置，最后把数据保存到 `storage <namespace>:class <module>_plate`。

## 实例与运行流程

`_new` 创建一个 `item_display` 作为根实例，并写入模块标签。`set_operation` 默认把显示物品设为命令方块；实际项目通常会覆盖它。

默认 `tick` 调用 `main`。`main` 的流程为：

1. `_get` 读取实例；
2. `vve:point/_iter_motion` 更新位置；
3. 在质心位置调用 `vve:_detect_material`；
4. 应用重力、位移、冲量和摩擦响应；
5. `vve:point/_sync_motion` 同步实体；
6. `_store` 写回状态。

模板还提供 `main_l`、`main_force`、`main_slow_mov`、`main_slow_key` 和 `main_sync`，用于流体响应、拆分物理阶段和慢放调度。

## 主要接口

| 接口 | 输入与执行者 | 输出或副作用 |
| --- | --- | --- |
| `_new` | `storage <namespace>:io input`；调用位置 | 创建实例，输出 `@e[tag=result,limit=1]` |
| `_del` | 实例为 `@s` | 删除实例 |
| `_get` / `_store` | 实例为 `@s` | 读取或保存临时对象 |
| `_proj` / `_model` | `io input` 或临时对象 | 转换数据模板，输出到 `io result` |
| `_poke_here_i_as` | 世界实体为 `@s`，`inp` 为冲量大小 | 在执行位置沿执行朝向施加冲量 |
| `_regular` | `nvec` 与世界实体 | 当前未完成的遗留姿态归正入口，默认主程序不调用 |

## 使用边界

质点只使用一个查询位置，无法产生由作用点偏心导致的旋转。需要姿态、角速度或多个碰撞点时，应选择刚体模板。
