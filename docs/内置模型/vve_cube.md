# `vve:cube`

`vve:cube` 是可旋转长方体实体介质。它保存盒体的中心、尺寸和姿态，用有向包围盒判断外部碰撞点是否进入介质，但默认不进行重力或刚体运动。

实现位于 `data/vve/function/cube/`，函数前缀为 `vve:cube/`。

## 数据结构

| 字段 | 含义 |
| --- | --- |
| `scale` | 沿局部 `u/v/w` 三轴的完整尺寸 |
| `center` | 盒体几何中心 |
| `velocity` | 介质整体线速度，用于相对碰撞速度 |
| `angular_vec/angular_len` | 介质角速度 |
| `ivec/jvec/kvec`、四元数字段 | 有向盒体姿态 |

默认 `_class` 生成全零模板 `storage vve:class cube_plate`，调用者必须设置有效尺寸和姿态。

## 实例与探测

`_new` 创建实例，`set_operation` 设置 `vve_material_type = 1`。探测函数通过 `vve_material_box` 找到候选实体，再调用 `vve:cube/check_material`。

`check_material` 将碰撞点相对中心的世界向量投影到局部三轴。如果局部坐标均位于半尺寸范围内，`response` 选择最近表面，输出：

- `material_response = 1`；
- 朝外法线 `nvec` 与侵入深度 `grab_depth`；
- 浅层低速接触的附着响应；
- 深层接触的位移、反弹冲量和切向摩擦。

## 查询尺寸接口

`_detect_1/_4/_8/_16` 使用不同大小的选择盒寻找附近实例；后缀 `_c` 的版本配合力偶矩拆分响应。查询盒越大，能发现的远端大模型越多，但候选实体查询成本也越高。

## 运动方式

`main` 只执行 `_get`、`vve:object/_iter_motion`、同步和 `_store`，不会施加重力或介质响应。它适合移动平台、旋转障碍和由外部程序控制的碰撞区域。需要同时接受物理作用并自行运动时，应使用 `vve:cublock` 或 `vve:cubox`。
