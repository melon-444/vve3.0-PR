# `vve:water`

`vve:water` 定义水方块的介质响应。实现位于 `data/vve/function/water/`，函数前缀为 `vve:water/`，它是无实例的方块介质组件。

## 响应入口

| 接口 | 调用方 | 行为 |
| --- | --- | --- |
| `response_friction` | `vve:_detect_material` 等普通探测 | 设置水材质编号和阻力，不计算浮力 |
| `response` | `vve:_detect_liquid` | 计算水面深度、浮力冲量、阻力和层响应 |

水返回 `material_response = -7`。普通阻力使用 `vve_water_friction`；浮力强度使用 `vve_water_c`。

## 浮力计算

`response` 根据碰撞点在当前方块内的高度计算浸入深度，并向上检查最多四个连续液体方块。深度受调用者传入的 `buoyancy_h` 限制。

向上浮力冲量近似为：

```text
J_y = buoyancy_area * submerged_height * vve_water_c
```

结果写入 `impulse`，作用点为当前碰撞点。模型同时输出向上的接触法线和浸入深度，供物体汇总浸水接触。

## 使用要求

需要浮力的碰撞点遍历必须调用 `_detect_liquid` 并准备 `buoyancy_area` 与 `buoyancy_h`。普通 `_detect_material` 只获得水阻力。水识别目前直接匹配 `minecraft:water`。
