# `vve:object`

`vve:object` 是刚体公共运算核心。它定义刚体的姿态、局部坐标系、角速度、碰撞点换算和介质响应汇总，但不定义具体形状、质量、惯量、显示实体或碰撞点集合。

> **基础组件，不能独立实例化。** 实现位于 `data/vve/function/object/`，函数前缀为 `vve:object/`。目录没有完整的 `_new`、`_del`、`tick`、`_class` 和 `_consts`，应由 `block`、`box_object`、`cublock`、`cubox`、`vehicle` 或用户模板组合使用。

## 核心状态

| 字段 | 含义 | 缩放 |
| --- | --- | --- |
| `center` | 质心坐标 | `10000 = 1` |
| `velocity` | 质心线速度 | `10000 = 1` |
| `angular_vec` | 世界坐标中的角速度向量 | `1000000 = 1` |
| `angular_len` | 角速度大小 | `1000000 = 1` |
| `ivec/jvec/kvec` | 物体局部坐标轴 | `10000 = 1` |
| `xyzw` | 当前姿态四元数 | `10000 = 1` |
| `start_xyzw/orth_xyzw/quat_phi` | 分段旋转迭代状态 | `10000 = 1` |

此外，`receiver` 临时对象汇总材质、附着层、反弹层、摩擦、位移和冲量响应。

## 运动接口

| 接口 | 作用 |
| --- | --- |
| `_anchor_to` / `_rot_to` | 从执行坐标与朝向建立刚体姿态 |
| `_iter_motion` | 推进质心并沿当前角速度更新四元数和局部坐标轴 |
| `_iter_motion_slow_key` / `_iter_motion_slow_mov` | 执行慢速关键帧或运动帧迭代 |
| `_set_angular` | 根据角速度向量重建旋转迭代状态 |
| `_scale_angular` | 按 `inp` 缩放角速度 |
| `_sync_motion` / `_motion_data` | 生成或应用实体运动同步数据 |

## 碰撞与响应接口

`_get_cpoint` 接收局部坐标 `(u,v,w)`，输出世界坐标位置以及 `v + ω × r` 得到的碰撞点速度。

响应接收流程为：

```text
_clear_receiver
    -> 对每个碰撞点调用 _receive_*
    -> _receive_over
    -> _apply_shift / _apply_impulse_f / _apply_couple / _apply_friction
```

`_apply_impulse` 会同时修改线速度与角速度；`_apply_impulse_f` 只处理平动。当前推荐的 `_c` 碰撞点方案先用 `_dec_impulse` 将偏心冲量拆成平动冲量和 `couple`，最后分别应用。

## 辅助接口

`_poke_here*` 用执行位置和朝向施加测试冲量；`_rotate_here*` 设置朝向某位置的角速度；`_render_uvw*` 可在安装图形库时显示局部坐标轴。这些接口依赖调用者已经准备好质量、惯量和世界实体执行上下文。
