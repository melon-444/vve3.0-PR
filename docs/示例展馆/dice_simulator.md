# `dice_simulator`

模块：`vve_examples:dice_simulator`  
代码：`data/vve_examples/function/dice_simulator/`

`dice_simulator` 是骰子专用模拟器示例。它保存一个模拟器数据模板，并在 `main_loop` 中固定调度四面、六面、八面和十二面骰子。

## 模拟环境

`_consts` 先调用 `vve:_consts` 恢复默认环境，再覆盖骰子使用的摩擦和反弹参数：

- `vve_grab_friction = 9500`
- `vve_solid_friction = 9500`
- 切向摩擦为 `2500`
- `vve_solid_bounce_inv = 6896`

模拟器状态保存在 `storage vve_examples:io dice_simulator_plate`，默认时间倍率为 `global_rate/global_inv_dt = 1/1`。`_start` 和 `_stop` 负责计划或清除 `tick` 调度。

## 调度内容

`main_loop` 固定执行：

```text
@e[tag=dice_4]  → dice_4/main_c
@e[tag=dice_6]  → dice_6/main_c
@e[tag=dice_8]  → dice_8/main_c
@e[tag=dice_12] → dice_12/main_c
```

其他模块可以通过预设模拟器的 `tick_funcs` 接口追加回调，但不应让同一个物体同时被多个模拟器调度。

## 初始化与运行

测试入口会自动初始化依赖和本模拟器；模块初始化函数为：

```mcfunction
function vve_examples:dice_simulator/init
function vve_examples:dice_simulator/_start
```

停止时执行：

```mcfunction
function vve_examples:dice_simulator/_stop
```
