# `vve:cublock`

`vve:cublock` 是标量惯量立方体刚体与长方体实体介质的组合模型。它既使用八个顶点探测世界，也通过 `check_material` 接收其他物体的碰撞点，因此支持物体间双向碰撞。

实现位于 `data/vve/function/cublock/`，函数前缀为 `vve:cublock/`。这是完整可实例化的内置模型，同时出现在“物体模型”和“介质模型”分类中，两处共用本文。

## 扩展数据

除 `vve:block` 的 `a/mass/inertia` 和刚体状态外，还包含：

| 字段 | 含义 |
| --- | --- |
| `scale` | 实体介质沿局部 `u/v/w` 三轴的完整尺寸 |
| `cube_shift_y` | 根实体位置与介质几何中心之间的纵向偏移 |
| `nvec` | 最近一次实体介质接触法线 |

默认 `_class` 创建边长 `0.5`、质量 `17`、惯量约 `4.58` 的立方体模板，并写入 `storage vve:class cublock_plate`。

## 实例与身份

`_new` 从 `storage vve:io input` 创建根实体与显示实体。`set_operation` 设置 `vve_material_type = 2`，使 `vve:call_material` 将它作为 `cublock/cubox` 类型实体介质处理。

`check_material` 将外部碰撞点转换到本体局部坐标，判断是否进入盒体并生成法线、深度、位移、冲量、摩擦和层响应。若实例能接收冲量，反向冲量会进入其 `data.impulse_receiver`，由 `_outer_impulse` 在自身物理帧中处理。

## 主程序

| 接口 | 用途 |
| --- | --- |
| `main` | 普通完整物理帧 |
| `main_c` | 使用力偶矩拆分的完整帧，推荐 |
| `main_l` | 启用流体浮力的碰撞点方案 |
| `main_force` | 只运行介质探测与力学响应 |
| `main_sync` | 只运行同步 |
| `main_slow_key/main_slow_mov` | 慢速模拟拆分帧 |

## 创建示例

```mcfunction
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute at @e[tag=math_marker,limit=1] run function vve:cublock/_new
```

`_sync_motion` 负责根实体、显示实体和介质几何中心的一致性。修改 `scale` 后应重新调用 `_calc_shift`，并按尺寸平方和质量比例调整 `inertia`。
