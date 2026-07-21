# `vve:impulse`

`vve:impulse` 表示一个带作用点的瞬时冲量。实现位于 `data/vve/function/impulse/`，函数前缀为 `vve:impulse/`。

## 数据结构

```text
impulse_response
impulse {
    center: [impulse_x, impulse_y, impulse_z]
    vector: [impulse_fx, impulse_fy, impulse_fz]
}
```

`center` 是世界坐标作用点，`vector` 是世界坐标冲量向量，均按 `10000 = 1` 缩放。只有 `impulse_response` 有效时，消费者才应应用负载。

## 接口

| 接口 | 作用 |
| --- | --- |
| `_clear` | 清空响应信号，并初始化冲量接收列表 |
| `_proj` / `_model` | 与 `storage vve:io input/result` 转换 |
| `_add_couple` | 将偏心冲量产生的 `r x J` 累加到 `couple` |
| `_add_couple_high` | 使用更高精度计算同一结果 |
| `_append_friction` | 根据碰撞点速度、法线和摩擦系数构造切向摩擦冲量 |
| `_print/_print_f` | 输出作用点或向量数据 |
| `_render` | 安装 `math3.1_gelib` 时可视化冲量 |

## 汇总与应用

多碰撞点刚体不会立即逐点改变速度。`vve:object/_receive_impulse` 累计冲量作用点与向量，`_receive_over` 按有效点数求平均。

质点只把冲量除以等效质量后加入线速度。刚体还需处理偏心作用：可直接调用 `_apply_impulse` 同时修改平动与转动，或使用推荐的 `_c` 方案分别应用平动冲量和力偶矩。
