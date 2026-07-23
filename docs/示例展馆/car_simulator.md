# `car_simulator`

模块：`vve_examples:car_simulator`  
代码：`data/vve_examples/function/car_simulator/`

`car_simulator` 是载具专用模拟器示例。它在自己的环境中固定调度测试车、绿车和测试船，并保留通用模拟器的时间倍率和回调机制。

## 模拟环境

`_consts` 先恢复 VVE 默认常量，再使用较低的切向摩擦：

- `vve_grab_friction = 9500`
- `vve_solid_friction = 9500`
- `vve_grab_friction_tan = 9500`
- `vve_solid_friction_tan = 9500`
- `vve_solid_bounce_inv = 6896`

状态保存于 `storage vve_examples:io car_simulator_plate`。默认 `global_rate=1`、`global_inv_dt=1`；可以通过模拟器模板接口调整时间倍率，但拆分数应在完整周期结束时切换。

## 调度内容

`main_loop` 固定执行：

```text
@e[tag=vve_test_car]             → test_car/main_c
@e[tag=vve_examples_green_car]   → green_car/main_c
@e[tag=vve_examples_test_boat]   → test_boat/main_c
```

载具输入、发动机和座椅仍由各自模块处理；模拟器只负责为它们提供统一的物理时钟和环境常量。

## 初始化与运行

```mcfunction
function vve_examples:car_simulator/init
function vve_examples:car_simulator/_start
```

停止调度：

```mcfunction
function vve_examples:car_simulator/_stop
```

测试入口会自动初始化所需载具模块。模拟器应与其他模拟器顺序运行，避免覆盖共享临时对象和常量表。
