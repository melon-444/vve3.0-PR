# `vve:liquid`

`vve:liquid` 是通用液体响应的预留实现。它与水、岩浆采用相同的阻力和浮力算法，使用通用常量 `vve_liquid_friction`、`vve_liquid_c`，并返回 `material_response = -9`。

实现位于 `data/vve/function/liquid/`，函数前缀为 `vve:liquid/`。

## 接口

| 接口 | 作用 |
| --- | --- |
| `response_friction` | 返回通用液体材质和阻力 |
| `response` | 计算连续液体深度、浮力冲量和层响应 |

## 当前状态

`#vve:liquid` 方块标签目前包含水和岩浆，但 `_detect_material` 与 `_detect_liquid` 中调用通用液体响应的分支被注释，实际执行会优先分别调用 `vve:water/*` 和 `vve:lava/*`。

因此，`vve:liquid` 当前更适合作为自定义液体实现参考，而不是默认会触发的介质。启用它时应先定义哪些方块不由水/岩浆分支处理，并避免同一碰撞点重复响应。
