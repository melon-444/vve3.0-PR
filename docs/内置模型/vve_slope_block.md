# `vve:slope_block`

`vve:slope_block` 是用特定方块状态表示斜面的方块介质模型。实现位于 `data/vve/function/slope_block/`，函数前缀为 `vve:slope_block/`。

## 当前几何约定

`detect` 当前识别 `minecraft:birch_trapdoor` 的 `facing=west/east/south/north` 状态。活板门方块只作为斜面标记；响应函数按朝向建立斜面法线和表面高度。

`vve:_detect_slope` 先执行通用介质查询，再由 `shift_detect` 调用斜面检测。`grab_depth` 表示碰撞点相对斜面的侵入深度，`vve_slope_block_d` 控制斜面附着层厚度。

## 响应流程

```text
detect
  -> detect_<facing>
  -> response_<facing>
  -> nvec_<facing> / nvec_up
  -> grab_layer_response 或 shift_up
```

浅层接触复用附着层响应，深层接触产生向上或沿斜面法线的位移修正。输出仍遵守通用 `nvec/grab_depth/shift/impulse/friction` 协议。

## 使用限制

该模型不是任意方块形状求解器，目前硬编码桦木活板门和四个水平朝向。正式地图若要使用其它标记方块或不同坡度，应复制检测分支并重新推导表面方程与单位法线，同时避免标记方块被 `#vve:pass` 或普通实心响应重复处理。
