# `vve_cublock_b_1.0`

`vve_cublock_b_1.0` 是 `vve_cublock_1.0` 的 `block_display` 适配版。物理模型、实体介质职责、动态碰撞点和模块控制协议不变，只替换显示乘客及其同步方式。

模板源码位于 `memory_storage/vve_cublock_b_1.0/`。

## 实例结构

```text
interaction 根实体
└─ block_display 显示乘客
```

与普通版相比：

- `_new` 明确创建 `minecraft:block_display` 乘客；
- `set_operation` 写入 `block_state`，默认方块为命令方块；
- `_update_display` 同时设置缩放和方块中心平移；
- `_sync_motion` 更新乘客变换，并调整根实体位置；
- 所有需要同步的 `main*` 都调用模块自己的 `_sync_motion`。

## 数据与物理行为

数据结构、默认值、八个固定碰撞点、动态实体介质探测以及反作用冲量流程均与 [`vve_cublock_1.0`](vve_cublock_1.0.md) 相同。

`b` 不改变质量、惯量、介质响应或性能等级。选择该模板的理由应当是最终视觉模型使用方块展示实体，而不是需要另一种碰撞算法。

## 自定义显示

替换默认命令方块时修改 `set_operation` 中的 `block_state`。如需修改模型中心，必须同时检查 `_update_display` 和 `_sync_motion` 中的 `transformation.translation`，否则视觉中心与物理碰撞中心会分离。
