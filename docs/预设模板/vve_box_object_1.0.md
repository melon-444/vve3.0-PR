# `vve_box_object_1.0`

`vve_box_object_1.0` 是使用完整惯性张量的刚体骨架模板。它适合长、宽、高不同，且需要不同转轴产生不同转动响应的物体；实例本身不充当实体介质。

模板源码位于 `memory_storage/vve_box_object_1.0/`，核心计算复用 `vve:box_object` 与 `vve:object`。

## 数据与默认值

| 字段组 | 默认值 | 含义 |
| --- | --- | --- |
| `mass` | `17` | 质量 |
| `tensor` | 由尺寸和质量计算 | `xx/yy/zz/xy/xz/yz` 六个张量分量 |
| `scale` | `(1,1,2)` | 三轴尺寸 |
| `center` / `velocity` | `0` | 平移状态 |
| 角速度、局部坐标与四元数 | 单位姿态、零速度 | 转动状态 |

`_class` 把 `inp` 设为 `120` 后调用 `vve:box_object/_calc_tensor_i`。该入口使用整数数据计算均匀长方体的默认惯性张量。

## 碰撞与运行

模板当前提供长方体八顶点碰撞点实现，也允许用户覆盖 `_iter_cpoints*`。默认 `tick` 调用 `main_c`，使用张量版本的冲量和力偶计算。

与 `cubox` 不同，`_new` 只创建一个 `item_display`，没有 `vve_material_box` 身份，也不接收其他物体返回的外部冲量。

## 主要接口

模板提供完整对象转换与实例生命周期接口，以及：

| 接口 | 作用 |
| --- | --- |
| `_iter_cpoints` / `_iter_cpoints_c` | 普通探测或带力偶汇总的探测 |
| `_iter_cpoints_l` | 带浮力参数的探测 |
| `_iter_cpoints_render` | 可视化当前碰撞点 |
| `_poke_here_i_as` | 在指定作用点施加冲量 |
| `main_force` / `main_sync` | 分离力学阶段和显示同步 |

