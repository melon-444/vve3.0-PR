# `vve:lava`

`vve:lava` 定义岩浆方块的介质响应。实现位于 `data/vve/function/lava/`，函数前缀为 `vve:lava/`，不需要创建实例。

## 输出

岩浆返回 `material_response = -8`，并使用：

| 常量 | 作用 |
| --- | --- |
| `vve_lava_friction` | 速度保留比例，默认比水产生更强阻力 |
| `vve_lava_c` | 浮力冲量系数，默认大于水 |

`response_friction` 供普通介质探测调用，只设置材质和阻力。`response` 供 `_detect_liquid` 调用，根据浸入深度、`buoyancy_area` 和 `buoyancy_h` 生成向上浮力冲量，并输出接触层信息。

## 与水的区别

水和岩浆使用相同算法，只读取不同常量并返回不同材质编号。当前模型只负责物理响应，不包含 Minecraft 原生的着火、伤害、熔毁或声音副作用；这些行为应由业务模块另外处理。
