# `vve:sim_slow`

`vve:sim_slow` 是附着在外部实体上的慢速播放状态模型。它保存模拟器当前倍率和拆分相位，使一个实体可以在多 tick 内完成一轮物理运动。

实现位于 `data/vve/function/sim_slow/`，函数前缀为 `vve:sim_slow/`。分类页和具体模型都应链接本文，不存在独立的 `vve_sim_low` 模型。

## 数据

| 字段 | 含义 |
| --- | --- |
| `vve_rate` | 模拟时间倍率或慢放控制量 |
| `vve_sim_mod` | 当前拆分相位 |
| `inv_dt` | 当前逆时间步倍率 |
| `set_inv_dt` | 等待切换的新逆时间步倍率 |

`_store` 将临时对象写入执行实体的同名记分板；`_as` 为外部实体添加 `vve_sim_slow` 标签并初始化状态。

## 当前完整性

> **辅助组件，需模板或调用方补全。** `_as` 当前调用 `vve:sim_slow/store`，但内置目录实际提供的是 `_store.mcfunction`。文档按现有真实文件记录此不一致；在修正实现前，调用者应使用 `vve:sim_slow/_store` 或在生成模块中补齐代理函数。

慢速播放的调度逻辑主要位于模拟器和各物体的 `main_slow_key/main_slow_mov`。本模型只保存状态，不自行调度物理对象。
