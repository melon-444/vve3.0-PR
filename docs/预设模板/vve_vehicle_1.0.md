# `vve_vehicle_1.0`

`vve_vehicle_1.0` 是完整载具骨架模板。它以惯性张量盒体为基础，增加底盘接触点、贴地姿态修正、玩家输入、发动机状态、座椅和聊天栏快捷接口。

模板源码位于 `memory_storage/vve_vehicle_1.0/`，运行时依赖内置 `vve:vehicle`、`vve:cubox`、`vve:seat` 与数学阻尼函数。

## 数据与默认值

除 `cubox` 刚体字段外，模板增加：

| 字段 | 默认值 | 含义 |
| --- | ---: | --- |
| `forward_power` | `3.6` | 前进控制功率 |
| `backward_power` | `-2.5` | 后退控制功率 |
| `rotation_r` | `5` | 转弯半径 |
| `target_power` | `0` | 当前目标动力 |
| `damp_x` / `damp_v` | `0` | 阻尼状态 |
| `damp_k/damp_b/damp_f` | `17/20/1000` | 阻尼参数 |
| `v_max` | `0.35` | 前进速度上限 |

默认车身尺寸为 `(1,0.6,2)`，质量为 `50`。

## 实例层次与座椅

```text
interaction 物理根实体
└─ item_display 车身
   └─ interaction 座椅
```

根实体承担物理状态和实体介质身份，显示乘客保存物品模型，第二层交互实体作为座椅。默认模型为海晶灯；座椅宽度为 `1`，高度偏移为 `-0.8`。

`_seat_on`、`_seat_off`、`_ride_on_nearest`、`_summon_here` 和 `_del_nearest` 提供常用管理入口。

## 主程序

默认 `main_c` 依次执行：

1. 张量刚体运动与底盘碰撞点探测；
2. 位移、冲量、力偶和外部冲量；
3. 根据支撑点数量进行贴地姿态修正；
4. 从座椅实体读取玩家按键信号；
5. 执行地面或空中控制；
6. 在需要时运行 `vve:vehicle/engine/main`；
7. 同步车身与座椅并保存状态。

控制目录中的 `get_signal*`、`main_surface` 和 `main_air` 是默认策略，实际载具通常需要按输入谓词与操控手感覆盖。

## 使用要求

载具实例的显示物品、座椅尺寸、功率、转弯半径和阻尼参数都只是示例默认值。自定义载具至少应审核 `_class`、`set_operation` 和 `control/*`。
