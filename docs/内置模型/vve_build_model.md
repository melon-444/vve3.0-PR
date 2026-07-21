# `vve:block_reader/test/build_model`

`vve_build_model` 是方块读取阵列与刚体显示组合的测试模型。它读取一个世界区域，为每个读取到的方块创建缩小的 `block_display` 乘客，从而构成可以整体旋转和移动的多方块视觉模型。

> **测试模型。** 实现位于 `data/vve/function/block_reader/test/build_model/`，真实函数前缀为 `vve:block_reader/test/build_model/`。它依赖测试坐标、`marker_control` 任务数据和 `vve:block_reader`，不是通用建模 API。

## 数据与物理范围

根对象使用 `box_object` 风格的数据：质量、惯性张量、三轴尺寸以及完整刚体姿态。默认模板尺寸为 `(1,1,2)`、质量 `17`，通过 `vve:box_object/_calc_tensor` 计算惯性张量。

当前测试只让根对象执行 `vve:object/_iter_motion` 并同步显示，重点验证异步方块读取和模型组装，不包含完整的介质碰撞主程序。

## 构建流程

1. `start` 放置测试结构并创建根实例。
2. `vve:block_reader/task/_corner_list` 生成区域读取任务。
3. `main` 分批把任务交给方块读取器。
4. `get_block` 把每个读取结果交给 `_add_block`。
5. `_add_block` 创建 `vve_build_model_display` 方块展示实体并骑乘根实例。
6. `add_operation` 写入方块状态和按 `0.2` 缩放后的局部平移。
7. `_sync_motion` 更新所有乘客显示实体的四元数和位置。

## 关键接口

| 接口 | 作用 |
| --- | --- |
| `_add_block` | 以局部 `(u,v,w)` 和 `storage vve:io result` 的方块状态添加显示块 |
| `get_block` | 方块读取器的逐方块回调 |
| `read_over` | 读取完成回调，目前仅输出测试消息 |
| `_sync_motion` | 同步根对象位置以及所有显示乘客 |
| `start/end` | 建立和清理固定测试场景 |

若要发展为正式模型构建器，需要把测试场景、固定缩放、任务 storage、回调和生命周期抽象成公共输入，并明确碰撞外形是包围盒还是读取到的方块集合。
