# `vve:grab_layer`

`vve:grab_layer` 表示表面附近的浅层、低速稳定接触。它用于支撑物体、消除小幅穿透、产生接触摩擦，并为着陆后的姿态规整提供法线。

实现位于 `data/vve/function/grab_layer/`，函数前缀为 `vve:grab_layer/`。

## 数据

```text
grab_layer_response
grab_depth
nvec = [nvec_x, nvec_y, nvec_z]
```

`grab_depth` 是沿法线反方向的侵入深度；`nvec` 是朝介质外侧的单位法线，按 `10000 = 1` 缩放。

## 响应条件

当侵入深度不超过 `grab_depth_max`，且沿法线进入介质的速度不超过 `grab_layer_v` 时，介质可以调用 `response`。若碰撞点正在离开表面或进入速度过大，函数会跳过支持力响应。

有效响应包括：

- 把碰撞点移到 `grab_depth_mid` 目标深度的 `shift`；
- 抵消法向进入速度的支持冲量；
- 衰减切向相对速度的摩擦冲量；
- 整体摩擦保留系数。

`response_material` 使用当前特殊方块材质加载的 `stemp_gf/stemp_gft`，普通 `response` 使用全局附着层常量。

刚体汇总时累计有效附着点数量，并保存法向速度最具代表性的接触法线。主程序通常要求至少三个附着点才进行稳定姿态规整。
