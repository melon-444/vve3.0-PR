# `vve:vehicle`

`vve:vehicle` 是建立在张量刚体和盒体实体介质之上的载具基础组件。它增加底盘接触点分类、贴地姿态修正、转向和发动机状态，供载具模板组合使用。

> **基础组件，需模板补全。** 实现位于 `data/vve/function/vehicle/`，函数前缀为 `vve:vehicle/`。内置目录缺少 `_class`、`_consts`、`_new`、完整显示设置和部分 `control/*` 实现，不能作为独立成品载具直接实例化；应使用 `vve_vehicle_1.0` 或 `vve_vehicle_lite_1.0` 模板生成模块。

## 扩展数据

除 `cubox` 的质量、惯性张量、尺寸、介质和刚体状态外，`engine` 包含：

| 字段 | 含义 |
| --- | --- |
| `target_power` | 目标动力状态 |
| `damp_x/damp_v/damp_k/damp_b/damp_f` | 引擎或阻尼控制参数 |
| `v_max` | 最大目标速度 |

## 底盘接触

`_iter_cpoints_c` 不只汇总普通介质响应，还输出：

- `storage vve:io shift_points`：产生位移修正的底盘点；
- `shift_origins`：对应的局部来源点；
- `not_shift_points/not_shift_origins`：未产生位移的采样点。

`_regular` 根据有效支撑点数量和分布规整底盘姿态。`_render_shift` 可以在安装 `math3.1_gelib` 时可视化这些点。

## 主程序

`main_c` 依次运行刚体运动、底盘介质探测、重力、位移/冲量/力偶矩响应、贴地姿态修正、外部冲量、摩擦、乘客控制信号、引擎和运动同步。

| 接口 | 作用 |
| --- | --- |
| `_set_rotation` | 按转弯半径 `r` 和符号 `sign` 设置水平角速度 |
| `engine/_set_power` | 设置目标动力 |
| `engine/main` | 根据目标动力、阻尼和速度限制迭代引擎 |
| `_detect_*_c` | 按不同查询尺寸探测附近 `cube` 实体介质 |
| `_receive_shift*` | 记录底盘位移点并汇总响应 |

载具的显示模型、乘员结构、输入谓词和控制曲线属于具体业务模块，不由本基础组件统一决定。
