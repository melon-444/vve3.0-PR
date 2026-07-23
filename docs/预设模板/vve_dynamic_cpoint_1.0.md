# `vve_dynamic_cpoint_1.0`

`vve_dynamic_cpoint_1.0` 为物体模块增加动态盒体碰撞点查询。它让当前临时刚体与附近带 `vve_cube_box`、`vve_material_box` 标签的 OBB 实例求最近点，并把该点作为介质查询位置。

模板源码位于 `memory_storage/vve_dynamic_cpoint_1.0/`。它是功能层，不包含对象格式、初始化、实例生命周期或主程序。

## 生成接口

模板提供四档查询范围，每档有普通版和 `_c` 版：

| 接口 | 查询立方体范围 |
| --- | ---: |
| `_detect_1` / `_detect_1_c` | `1×1×1` |
| `_detect_4` / `_detect_4_c` | `4×4×4` |
| `_detect_8` / `_detect_8_c` | `8×8×8` |
| `_detect_16` / `_detect_16_c` | `16×16×16` |

范围越大，能找到更远或更大的实体介质，但候选实体数量和选择器成本也可能更高。

## 输入契约

调用 `_detect_*` 时需要：

- 世界实体为执行者，用于移动查询位置；
- 当前物体临时对象中的 `x/y/z`、`vx/vy/vz`、质量与局部坐标；
- 当前物体的 `scale_u/scale_v/scale_w`；
- 候选介质实例保存自己的中心、局部坐标和三轴尺寸；
- VVE 的碰撞点与响应临时对象已初始化。

`detect_point` 将当前物体和候选 OBB 分别做局部坐标 clamp，得到两盒最近点，再调用 `vve:_detect_box` 汇总反弹层、附着层、摩擦、位移和冲量。

`detect_point_c` 在冲量阶段使用 `vve:object/_dec_impulse`，用于带碰撞耦合/反作用处理的主流程；普通版使用 `_receive_impulse`。

## 组合方式

该模板会生成 `_detect_*`、`detect_point` 和 `detect_point_c`。物体自己的 `_iter_cpoints*` 仍需显式调用合适的查询档位，并在查询前后正确清空与结算响应。

如果骨架已经带有同名动态探测文件，后压入本模板会覆盖它们，应先比较实现差异。
