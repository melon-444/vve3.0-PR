# `vve_test_1.0`

`vve_test_1.0` 是预设刚体自动化测试功能层。它在现有物体模块下增加 `test/` 目录，不定义被测对象本身。

模板源码位于 `memory_storage/vve_test_1.0/`。

## 测试集合

| 目录 | 测试内容 |
| --- | --- |
| `test/cp` | 旋转物体并记录碰撞点/姿态相关运动 |
| `test/fall` | 从空中释放，检查重力和落地响应 |
| `test/push` | 对物体施加侧向冲量，检查平动与转动 |
| `test/float` | 在水池中检查浮力和流体响应 |
| `test/inter_bounce` | 创建两个物体相向运动，检查实体间碰撞 |

每组包含 `start`、`main`、`store_frame`、`frame` 和 `end`。`test/_auto` 把五个测试前缀写入 `storage vve:io test_pointers`，再调用 `vve:test_auto/_start`。

## 执行方式

`test/_auto` 以玩家为执行者，把测试坐标基准放在 `(0,100,0)` 附近。各 `start` 函数重置 VVE 常量、初始化被测模块、构建场地，并从模块默认数据模板创建测试实例。

测试实例通常移除正常模块标签，改由 `marker_control` 指定 `tick_func` 和 `del_func` 单独调度。`killtime` 控制阶段持续时间。

## 运行测试方法

```
function <module_prefix>test/<test_name>/start
```

## 结束测试方法

```
scoreboard players set test int 1
```

## 兼容性

该模板硬编码调用 `main_c`、刚体锚定、旋转、冲量和对象转换接口，适合 `block/cublock/box_object/cubox` 一类兼容刚体，不保证适用于质点、介质或模拟器。

`inter_bounce` 只有在被测模板真正实现实体介质查询和反作用冲量时才应通过。对 `vve_block_1.0` 这类非实体介质刚体，两个物体相互穿透是当前模型的预期结果。

## 当前实现注意事项

测试会调用被测模块的 `init`，并修改场地方块、全局常量和测试标签。不要在生产世界直接执行，也不要与正在运行的正式实例共享同一测试区域。
