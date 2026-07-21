# `vve:block`

`vve:block` 是使用单一标量惯量的立方体刚体基础组件。它在 `vve:object` 的刚体状态上增加半边长 `a`、质量 `mass` 和惯量 `inertia`，并使用八个顶点作为固定碰撞点。

> **基础组件，需模板补全。** 实现位于 `data/vve/function/block/`，函数前缀为 `vve:block/`。该目录不包含 `_class`、`_consts`、`_new`、`_del` 和 `tick` 的完整实现，应使用 `vve_block_1.0` 或相关预设模板生成可实例化模块。

## 数据结构

| 字段 | 含义 |
| --- | --- |
| `a` | 立方体半边长 |
| `mass` | 质量 |
| `inertia` | 绕任意方向使用的标量惯量 |
| `center/velocity` | 质心位置和线速度 |
| `angular_vec/angular_len` | 角速度 |
| `ivec/jvec/kvec`、四元数字段 | 姿态与局部坐标系 |

`a`、坐标和速度按 `10000 = 1` 缩放；`inertia` 在临时对象中按 `100 = 1` 表示。

## 碰撞点方案

`_iter_cpoints` 和 `_iter_cpoints_c` 都遍历局部坐标为 `(±a, ±a, ±a)` 的八个顶点。每个顶点被换算成世界位置和瞬时速度，再交给介质探测函数。

- `_iter_cpoints` 使用传统偏心冲量汇总。
- `_iter_cpoints_c` 将偏心冲量拆成平动冲量与力偶矩，是当前优先方案。

## 关键接口

| 接口 | 作用 |
| --- | --- |
| `_proj` / `_model` | 在数据模板和临时对象之间转换 |
| `_get` / `_store` | 在实例记分板和临时对象之间转换 |
| `_iter_cpoints*` | 八顶点介质探测与响应汇总 |
| `_apply_impulse` | 按 `mass/inertia` 应用偏心冲量 |
| `_regular` | 根据接触法线规整姿态并消除法向角速度 |
| `main` / `main_c` | 普通或力偶矩拆分方案的完整物理帧 |

## 使用边界

标量惯量使计算更轻，但无法表达长方体绕不同轴旋转时的惯量差异。需要非立方形状或精确转动响应时，应改用 `vve:box_object`。`vve:block` 自身不具备实体介质身份，其他物体不会把它探测为可碰撞实体；需要双向物体碰撞时使用 `vve:cublock`。
