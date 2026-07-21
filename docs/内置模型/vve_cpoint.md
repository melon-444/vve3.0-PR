# `vve:cpoint`

`vve:cpoint` 是碰撞点模型，也是物体模型与介质模型之间的统一查询协议。实现位于 `data/vve/function/cpoint/`，函数前缀为 `vve:cpoint/`。

## 数据结构

```text
cpoint {
    center:   [c_x, c_y, c_z]
    velocity: [c_vx, c_vy, c_vz]
    mass:     c_mass
}
```

坐标和速度按 `10000 = 1` 缩放。`c_mass` 是本次介质响应使用的等效质量。

质点直接复制自身中心和速度。刚体则从局部采样点 `r_local` 计算：

```text
center   = object.center + R * r_local
velocity = object.velocity + angular_velocity x (R * r_local)
```

## 接口

| 接口 | 作用 |
| --- | --- |
| `_zero` | 清空碰撞点临时对象 |
| `_proj` / `_model` | 与 `storage vve:io input/result` 转换 |
| `_topos` | 把执行实体移动到碰撞点坐标 |
| `_iter_v_max` | 将最大线速度分量迭代到 `res` |
| `_print` | 输出碰撞点数据 |
| `_render_debug` | 以世界实体为执行者可视化调试信息 |

## 质量与汇总

刚体的每个碰撞点通常使用完整物体质量，而不是除以碰撞点数量。多个点产生的冲量会在物体级接收器中取平均，这两项规则必须配套，否则增减采样点会无条件改变总响应强度。
