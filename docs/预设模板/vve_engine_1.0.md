# `vve_engine_1.0`

`vve_engine_1.0` 是载具引擎功能模板。它沿刚体局部前向 `kvec` 施加动力，并使用数学库的阻尼状态平滑切换目标功率。

模板源码位于 `memory_storage/vve_engine_1.0/`，只生成 `engine/` 子目录。

## 前置数据

模板假定当前临时对象已经包含：

- `mass`、`velocity` 与局部前向 `kvec`；
- `target_power`、`damp_x/damp_v/damp_k/damp_b/damp_f`；
- `v_max`；
- `storage vve:io shift_points`，用于判断底盘是否接触表面。

这些字段由 `vve_vehicle_1.0` 和 `vve_vehicle_lite_1.0` 提供。该模板不能独立构建可运行载具。

## 接口与流程

| 文件 | 作用 |
| --- | --- |
| `engine/_set_power` | 从 `inp` 设置新目标功率，并调整 `damp_x` 保持切换连续 |
| `engine/main` | 推进阻尼，计算当前功率和沿 `kvec` 的前进速度 |
| `engine/gain_velocity` | 按质量将动力加入三轴速度 |
| `engine/backward_friction` | 倒车时临时把摩擦响应设为 `8500` 并应用摩擦 |
| `engine/set_velocity` | 用计算得到的动力替换前向速度分量；当前 `main` 不调用它 |

只有 `shift_points[0]` 存在且当前前进速度低于 `v_max` 时，`main` 才调用 `gain_velocity`。因此默认引擎只在有底盘支撑点时推进。

## 组合方式

载具模板当前的 `main_c` 调用内置 `vve:vehicle/engine/main`。若要使用本功能层生成的模块内实现，需要把最终 `main_c` 调用改为 `<module>/engine/main`，或用该模板覆盖相同路径下的项目专用引擎文件。

功率正负、倒车摩擦和速度上限都是控制策略的一部分，使用前应结合载具质量与模拟时间倍率重新标定。
