# `vve:point`

`vve:point` 是 VVE 的质点运动基础组件。它只保存位置和线速度，不维护姿态、角速度或惯性张量，因此是运行成本最低的物体模型。

> **组件状态：需模板补全。** 运行实现位于 `data/vve/function/point/`，函数前缀为 `vve:point/`。目录提供实例运行和运动计算，但 `init` 所调用的 `_class`、`_consts` 未在内置目录中提供；创建业务模块时应使用 `vve_point_1.0` 预设模板补齐模块定义。

## 数据结构

```text
point {
    center:   [x, y, z]       # 位置，10000 = 1 格
    velocity: [vx, vy, vz]    # 线速度，10000 = 1 格/物理帧
}
```

质点没有显式 `mass` 字段。介质探测时按单位等效质量构造碰撞点。

## 运行流程

普通 `main` 依次执行：读取实例、位置迭代、以质点中心探测介质、接收位移/冲量/摩擦响应、施加重力、同步实体、写回实例。

`main_force` 和 `main_sync` 可将力学迭代与运动同步拆开；`main_slow_key`、`main_slow_mov` 和 `main_slow` 用于慢速模拟。

## 关键接口

| 接口 | 输入与结果 |
| --- | --- |
| `vve:point/_anchor_to` | 读取执行位置和朝向，以 `inp` 设置初速度 |
| `vve:point/_get_cpoint` | 把质点状态输出为 `cpoint` 临时对象 |
| `vve:point/_iter_motion` | 按当前速度推进位置 |
| `vve:point/_receive_shift` | 应用介质返回的位移修正 |
| `vve:point/_receive_impulse` | 把冲量直接叠加到线速度 |
| `vve:point/_receive_friction` | 按摩擦保留系数缩放线速度 |
| `vve:point/_sync_motion` | 将计算位置同步到非玩家实例实体 |
| `vve:point/_new` / `_del` | 从 `storage vve:io input` 创建实例或销毁实例 |

## 使用边界

质点适合弹丸、粒子化物体和不需要物理姿态的小物件。它可以使用与刚体相同的 `_detect_*` 介质函数，但单个中心点不能描述大体积物体的边角接触，也不会因偏心冲量产生旋转。
