# `vve_fixed_object_1.0`

`vve_fixed_object_1.0` 是固定姿态刚体模板。实例可以平动，但主程序不迭代或同步旋转，因此初始姿态在运行期间保持不变。它适合需要多个空间采样点、但不希望物体翻滚的板、平台或简化碰撞体。

模板源码位于 `memory_storage/vve_fixed_object_1.0/`。

## 数据结构

模板保留完整刚体数据，以便利用局部坐标和八顶点几何：

| 字段组 | 含义 |
| --- | --- |
| `mass` | 质量 |
| `tensor` | 六个独立惯性张量分量 |
| `scale` | 局部 `u/v/w` 三轴尺寸 |
| `center` / `velocity` | 世界位置和线速度 |
| `angular_vec` / `angular_len` | 角速度数据；默认主流程不推进它 |
| `ivec/jvec/kvec`、`xyzw` 等 | 局部坐标系与四元数姿态 |

默认数据尺寸为 `(1,1,2)`，质量为 `17`，并调用 `vve:box_object/_calc_tensor_i` 计算惯性张量。

## 碰撞点与物理流程

模板中的 `_iter_cpoints*` 当前给出长方体八个顶点的实现，但这些文件属于可编辑模板内容；使用者可以替换为自己的固定碰撞点集合。

默认 `main` 使用 `vve:point/_iter_motion` 和 `vve:point/_sync_motion`，只更新平移。它仍会汇总多点产生的位移、冲量和摩擦，但不调用力偶或角速度更新。

`main_l` 增加浮力与流体响应；`main_force` 只执行力学阶段；`main_sync` 只同步平移。

## 主要接口

除通用的 `_class`、`_new`、`_del`、对象转换和调度接口外，还提供：

| 接口 | 作用 |
| --- | --- |
| `_iter_cpoints` | 普通介质探测 |
| `_iter_cpoints_l` | 带浮力参数的介质探测 |
| `_iter_cpoints_render` | 使用 `storage math:io render_command` 可视化碰撞点 |
| `_poke_here_i_as` | 在指定作用点产生冲量；默认主流程不会把它转为角运动 |

## 当前实现说明

模板名称中的 `fixed` 指固定姿态，不是固定世界坐标。实例仍受速度、重力、碰撞位移和摩擦影响。

对象结构保存惯性张量和角速度，是为了兼容刚体工具与局部坐标计算；默认主程序不会消费这些字段来更新旋转。
