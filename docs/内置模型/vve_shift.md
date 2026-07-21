# `vve:shift`

`vve:shift` 表示世界坐标中的位置修正，用于把已经进入介质的碰撞点或物体推出到目标深度。

实现位于 `data/vve/function/shift/`，函数前缀为 `vve:shift/`。

## 数据

```text
shift_response
shift = [shift_x, shift_y, shift_z]   # 10000 = 1 格
```

`init` 将 `shift_response` 置零；`_print` 输出当前向量。位移负载通常由接触法线和侵入深度构造：

```text
shift = nvec * (grab_depth - target_depth)
```

## 汇总与应用

多碰撞点汇总按坐标轴处理：同方向响应保留更强值，不同方向响应相加。结束后，`vve:object/_apply_shift` 或 `vve:point/_receive_shift` 直接修改位置。

位移修正不改变速度，因此通常还需要支持力或反弹冲量处理进入介质的速度。只施加位移可能导致下一帧再次穿透。
