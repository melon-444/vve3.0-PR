# `vve:box_object`

`vve:box_object` 是使用完整惯性张量的长方体刚体模型。它能表达长宽高不同的盒体绕不同轴旋转时的惯量差异，但不承担实体介质职责。

实现位于 `data/vve/function/box_object/`，函数前缀为 `vve:box_object/`。

## 数据结构

| 字段 | 含义 |
| --- | --- |
| `mass` | 物体质量 |
| `tensor` | `xx/yy/zz/xy/xz/yz` 六个独立惯性张量分量 |
| `scale` | 局部三轴完整尺寸 |
| 刚体公共字段 | 质心、速度、角速度、局部坐标轴和四元数 |

默认 `_class` 使用尺寸 `(1,1,2)`、质量 `17`，调用 `_calc_tensor` 计算均匀长方体惯性张量，并保存为 `storage vve:class box_object_plate`。

## 物理行为

`_iter_cpoints` 使用长方体八个顶点进行介质探测。`_apply_couple` 会根据当前局部坐标系和惯性张量求指定方向的等效惯量，再修改角速度；因此它比 `vve:block` 的标量惯量更适合细长、扁平或不等边物体。

## 关键接口

| 接口 | 作用 |
| --- | --- |
| `_calc_tensor` | 根据 `mass` 和 `scale` 计算均匀盒体惯性张量 |
| `_apply_impulse` / `_apply_couple` | 使用张量应用偏心冲量或力偶矩 |
| `_iter_cpoints` | 遍历八顶点并汇总介质响应 |
| `_new` / `_del` | 创建或销毁实例 |
| `_poke_here_i` | 在执行位置沿执行朝向施加大小为 `inp` 的冲量 |
| `main` / `tick` | 运行完整物理帧或遍历全部实例 |

## 使用边界

修改 `mass` 或 `scale` 后应重新调用 `_calc_tensor`。本模型能撞击方块和实体介质，但没有 `check_material`，因此其他物体不能将它作为实体介质探测。需要双向盒体碰撞时使用 `vve:cubox`。
