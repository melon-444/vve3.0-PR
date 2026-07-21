# `vve:test/explode/block`

`vve_explode_block` 是爆炸唤醒方块的测试模型：方块平时保留在世界中，被测试 TNT 唤醒后移除原方块并切换为可运动、可碰撞的实体方块。

> **测试模型。** 实现位于 `data/vve/function/test/explode/block/`，真实函数前缀为 `vve:test/explode/block/`。它不是稳定公共 API，文档名仅沿用导航中的 `vve_explode_block`。

## 模型组成

数据结构接近 `vve:cublock`：包含半边长、质量、标量惯量、实体介质尺寸、几何中心偏移、接触法线和完整刚体姿态。默认模板边长为 `1` 格、质量 `17`、惯量约 `18.32`。

`set_operation` 将实例设为 `vve_material_type = 2`，因此唤醒后的方块既会自行运动，也会成为其他物体可探测的盒体实体介质。

## 唤醒流程

`vve:test/explode/tnt` 读取爆炸附近的方块并创建或定位对应实例，然后调用：

```mcfunction
function vve:test/explode/block/wake_up
```

`wake_up` 在实例所在位置把世界方块替换为空气，并添加 `vve_exploded` 标签。之后 `tick/main` 才按刚体流程推进实例。

## 关键接口

| 接口 | 作用 |
| --- | --- |
| `_class` | 创建 `storage vve:class explode_block_plate` |
| `_new` / `_del` | 创建或销毁根实体及乘客显示实体 |
| `wake_up` | 移除原方块并标记为已爆炸 |
| `main` | 运动、八顶点介质探测、响应、外部冲量和同步 |
| `_sync_motion` | 按方块显示中心偏移同步姿态 |

该模型与爆炸测试目录、测试 TNT 生命周期和固定标签约定耦合。正式项目若要复用，应复制到自己的命名空间并补充方块状态保存、区块卸载处理和稳定的创建/销毁策略。
