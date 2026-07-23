# `vve_cubox_1.0`

`vve_cubox_1.0` 是惯性张量刚体与盒状实体介质的组合模板。它面向不等边盒体，提供八顶点世界介质探测、主动动态实体介质探测所需的几何字段，以及外部冲量消费流程。

模板源码位于 `memory_storage/vve_cubox_1.0/`。

## 数据与默认值

| 字段组 | 默认值 | 含义 |
| --- | --- | --- |
| `mass` | `50` | 质量 |
| `tensor` | 由 `_calc_tensor_i` 计算 | 完整惯性张量 |
| `scale` | `(1,1,2)` | 盒体三轴尺寸 |
| `cube_shift_y` / `nvec` | 由 `_calc_shift` 计算 | 盒体中心偏移和接触几何 |
| 刚体运动字段 | 单位姿态、零速度 | 平移与转动状态 |

## 实例与主程序

`_new` 创建带 `item_display` 乘客的 `interaction` 根实体，并添加 `vve_cube_box`、`vve_material_box` 与 `vve_impulse_receiver` 标签。

默认 `tick` 调用 `main_c`。运行流程包括张量刚体运动、固定及动态碰撞点探测、位移/冲量/力偶、外部冲量、摩擦和 `vve:cubox/_sync_motion`。动态部分按 `cube_shift_y` 选择内置 `vve:cube/_detect_1/_4/_8/_16` 或对应 `_c` 入口，因此本实例可以主动查询已经正确注册的盒状实体介质。

与 `box_object` 相比，它增加 `scale/cube_shift_y/nvec` 所代表的实体介质几何；与 `cublock` 相比，它用张量计算偏心冲量和力偶。