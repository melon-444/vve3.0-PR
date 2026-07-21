# `vve:test/explode/block_object`

`vve_explode_block_object` 是爆炸唤醒流程的另一种测试刚体。它使用八顶点碰撞和标量惯量，但不把实例注册为实体介质，因此可以撞击环境，却不会被其他物体当作盒体介质探测。

> **测试模型。** 实现位于 `data/vve/function/test/explode/block_object/`，真实函数前缀为 `vve:test/explode/block_object/`。接口不承诺稳定。

## 与 `explode/block` 的区别

| 项目 | `explode/block` | `explode/block_object` |
| --- | --- | --- |
| 实体介质身份 | 有，类型为 `2` | 无 |
| 外部物体可探测 | 可以 | 不可以 |
| 根实体与显示 | 根实体加乘客显示 | 单一显示实体方案 |
| 数据 | 带 `scale/cube_shift_y/nvec` | 仅标量惯量刚体字段 |

默认 `_class` 使用半边长 `0.5`、质量 `8`、惯量 `20`，保存为 `storage vve:class explode_block_object_plate`。

## 运行接口

`wake_up` 移除当前位置的世界方块并添加 `vve_exploded`。`main` 执行完整物理帧；`main_force` 与 `main_sync` 支持拆分迭代；`main_slow_key/main_slow_mov` 支持慢速播放。

`_iter_cpoints_c` 遍历八个顶点并使用力偶矩拆分方案汇总响应。`_sync_motion` 将质心和四元数直接写入展示实体。

该实现服务于爆炸自动化测试。正式使用前需要迁移函数前缀、标签、模板 storage 和 TNT 回调，不应让业务模块直接依赖 `vve:test/*`。
