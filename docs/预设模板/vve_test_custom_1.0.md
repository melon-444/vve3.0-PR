# `vve_test_custom_1.0`

`vve_test_custom_1.0` 为兼容刚体生成一组命名的自动化测试脚手架。模板参数 `test_name` 同时用于目录名、函数前缀和回调路径。

模板源码位于 `memory_storage/vve_test_custom_1.0/`。

## 生成文件

```text
test/<test_name>/start
test/<test_name>/main
test/<test_name>/store_frame
test/<test_name>/frame
test/<test_name>/end
```

`start` 默认搭建草地方形场地、从模块预设数据创建测试实例，并交给 `marker_control` 调度。`main` 默认调用模块的 `main_c`，在第 60 至 72 帧附近施加冲量，并包含冲量可视化。

`store_frame`、`frame` 和 `end` 提供可编辑的记录、期望值和清理位置。

## 使用步骤

1. 在 MOT 构建时设置唯一的 `test_name`；
2. 将模板叠加到提供刚体对象接口的模块；
3. 修改 `start` 中的场地、初始数据和生命周期；
4. 修改 `main` 中的刺激与被测入口；
5. 在 `store_frame/frame` 中定义需要记录和比较的数据；

## 运行测试方法

```
function <module_prefix>test/<test_name>/start
```

## 结束测试方法

```
scoreboard players set test int 1
```

## 使用边界

默认脚手架依赖 `main_c`、`_poke_here_i_as`、`vve:impulse/_render`、`vve:test_coord`、`marker_control` 和 `math3.1_gelib`，并非通用单元测试框架。测试其他类型模块时，应替换这些刚体专用调用。
