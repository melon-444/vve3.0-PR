# `vve:friction`

`vve:friction` 是整体速度衰减响应。实现位于 `data/vve/function/friction/`，当前模块只负责初始化 `friction_response` 信号。

## 数值含义

`friction_response` 使用 `10000 = 1` 的速度保留比例：

| 值 | 结果 |
| ---: | --- |
| `10000` | 不衰减 |
| `8500` | 保留约 85% 速度 |
| `0` | 完全消除速度 |

它不是摩擦力大小。`vve:object/_apply_friction` 按此比例缩放线速度、角速度及相关角速度分量；质点使用 `vve:point/_receive_friction`。

## 汇总规则

`vve:object/_receive_friction` 对多个碰撞点取最小值，因此同一帧中最强的整体衰减占优。

VVE 还会通过 `vve:impulse/_append_friction` 或介质响应直接加入切向摩擦冲量。前者处理整体速度保留，后者处理接触点切向相对运动，两种机制可以同时存在。
