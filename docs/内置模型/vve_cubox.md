# `vve:cubox`

`vve:cubox` 将 `vve:box_object` 的惯性张量刚体与 `vve:cube` 的实体介质能力组合为一个完整模型。它适合尺寸不等、需要精确转动响应且需要参与物体间碰撞的盒体。

实现位于 `data/vve/function/cubox/`，函数前缀为 `vve:cubox/`。本页同时属于“物体模型”和“介质模型”。

## 数据与默认模板

模型保存 `mass`、六分量 `tensor`、三轴 `scale`、`cube_shift_y`、接触法线 `nvec` 以及全部刚体姿态字段。

默认 `_class` 创建尺寸 `(0.25,0.25,0.5)`、质量 `17` 的盒体，调用 `_calc_shift` 和 `_calc_tensor` 后写入 `storage vve:class cubox_plate`。

## 组合行为

作为运动体，`_iter_cpoints` 使用八个顶点探测世界并应用重力、介质响应和姿态修正。作为实体介质，实例具有 `vve_material_type = 2`，由与 `cublock` 共用的盒体响应协议处理外部碰撞点。

其他物体撞击本体时，反向冲量可写入 `data.impulse_receiver`。自身 `main` 读取该列表并通过 `_outer_impulse` 应用，从而形成双向动量交换。

## 关键接口

| 接口 | 作用 |
| --- | --- |
| `_calc_tensor` | 根据 `mass/scale` 计算惯性张量 |
| `_calc_tensor_i` | 使用额外倍率 `inp` 计算张量 |
| `_calc_shift` | 计算几何中心与根实体之间的纵向偏移 |
| `_iter_cpoints` | 八顶点介质探测 |
| `_outer_impulse` | 应用其他实体介质写入的外部冲量 |
| `_sync_motion` | 同步根实体、显示实体与介质位置 |
| `_new` / `_del` / `main` / `tick` | 实例生命周期和帧调度 |

修改尺寸或质量时必须重新计算张量；修改尺寸还应重新计算 `cube_shift_y`。若不需要被其他物体探测，使用更简单的 `vve:box_object` 可以减少实体介质查询成本。
