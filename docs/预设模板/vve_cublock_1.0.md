# `vve_cublock_1.0`

`vve_cublock_1.0` 是标量惯量刚体与盒状实体介质的组合模板。它既用碰撞点探测世界，也能被其他物体的动态碰撞点探测，适合边长接近、可以使用单一惯量近似的可碰撞物体。

模板源码位于 `memory_storage/vve_cublock_1.0/`，主要复用内置 `vve:cublock`、`vve:block` 和 `vve:object`。

## 数据与默认值

除 `vve_block_1.0` 的标量惯量刚体字段外，模板增加：

| 字段 | 默认值 | 含义 |
| --- | ---: | --- |
| `scale` | `(0.5,0.5,0.5)` | 实体介质盒的三轴尺寸 |
| `cube_shift_y` | 由 `_calc_shift` 计算 | 实例根位置到盒体几何中心的竖直偏移 |
| `nvec` | 由 `_calc_shift` 计算 | 接触法线临时数据 |

默认 `a=0.25`、质量 `17`、标量惯量 `5.00`。

## 实例结构

`_new` 创建以下实体层次：

```text
interaction 根实体
└─ item_display 显示乘客
```

根实体带有模块标签、`vve_cube_box`、`vve_material_box` 和 `vve_impulse_receiver`。`init` 向 `module_control` 注册模块，`set_operation` 保存 `module_id`，使 `vve:call_material` 能动态调用本模块的 `check_material`。

默认显示物品是命令方块。

## 碰撞与主程序

`_iter_cpoints*` 包含两部分：

1. 以边长 `2a` 的八个固定顶点探测方块和流体介质；
2. 调用 `_detect_1_c/_4_c/_8_c/_16_c`，按物体尺寸选择范围，探测附近盒状实体介质。

默认 `tick` 调用 `main_c`，处理位移、冲量、力偶、外部冲量、摩擦、着陆姿态修正和运动同步。`check_material`、`response` 与 `return_impulse` 负责在本实例被其他物体查询时生成实体介质响应，并把反作用冲量写入 `data.impulse_receiver`。

## 主要接口

除通用对象接口外，模板提供四档动态探测入口、碰撞点可视化、外部冲量接收和模块控制分派协议。`_update_display` 更新盒体中心偏移与显示缩放。

## 适用边界

`inertia` 是绕所有轴共享的标量。细长或扁平盒体需要不同轴向惯量时，应使用 `vve_cubox_1.0`。自定义碰撞点时也要同步检查 `a`、`scale` 与实体介质几何是否仍然一致。
