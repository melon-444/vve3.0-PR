# `vve_singular_s_1.0`

`vve_singular_s_1.0` 是带盒状实体介质能力的自定义碰撞点近似球陀螺模板。它继承 `singular` 的标量惯量、用户碰撞点和稳定姿态框架，同时让实例能够被其他物体的动态碰撞点查询。

模板源码位于 `memory_storage/vve_singular_s_1.0/`。

## 与 `singular` 的差异

模板增加 `scale`、`cube_shift_y` 和 `nvec`，默认由 `a=0.25` 生成 `(0.5,0.5,0.5)` 的盒体范围。实例结构变为：

```text
interaction 根实体
└─ item_display 显示乘客
```

根实体带 `vve_cube_box`、`vve_material_box`、`vve_impulse_receiver` 标签。`init` 注册 `module_control`，`set_operation` 保存 `module_id`，并提供 `check_material`、`response` 和 `return_impulse` 以完成实体介质响应。

模板还加入 `_detect_1_c/_4_c/_8_c/_16_c` 与 `detect_point_c`，供自定义碰撞点查询附近盒体介质。

## 用户必须实现的部分

和 [`vve_singular_1.0`](vve_singular_1.0.md) 一样，当前 `_iter_cpoints*` 只包含一个示范点和省略号。用户应根据近似球、多面体或陀螺的实际几何补全全部碰撞点，并决定：

- 哪些点参与方块、流体和实体介质探测；
- 每个点的相对位置、速度与质量；
- 使用哪一档动态实体查询范围；
- 八个默认稳定姿态是否需要替换。

## 物理与显示

默认 `tick` 调用 `main_c`，运动同步使用 `vve:cublock/_sync_motion`。实例既能接收外部冲量，也会在其他物体查询时返回反作用冲量。

`s` 表示模板加入了实体介质相关的空间范围和探测流程，不表示碰撞点已经由模板自动生成。
