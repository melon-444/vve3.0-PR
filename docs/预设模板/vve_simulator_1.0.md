# `vve_simulator_1.0`

`vve_simulator_1.0` 是自定义模拟器骨架模板。它保存模拟时间倍率、拆分相位和两组回调列表，并在每个游戏刻为被调度物体加载一套独立物理常量。

模板源码位于 `memory_storage/vve_simulator_1.0/`。

## 状态

| 字段 | 默认值 | 含义 |
| --- | ---: | --- |
| `global_sim_mod` | `0` | 当前拆分周期相位 |
| `global_inv_dt` | `1` | 当前物理步拆分数 |
| `global_set_inv_dt` | `1` | 下个完整周期使用的拆分数 |
| `global_rate` | `1` | 每游戏刻执行的子步数 |
| `tick_funcs` | `[]` | 每个子步执行的回调 |
| `sync_funcs` | `[]` | 本游戏刻所有子步后执行一次的回调 |

模拟时间倍率为 `global_rate / global_inv_dt`。`global_rate=0` 表示模拟时间暂停，但 `sync_funcs` 仍可运行。

## 存储与生命周期

与物体模板不同，模拟器没有实体实例。状态保存在：

```text
storage <namespace>:io <module>_plate
```

`_get` 把它投射到共享临时对象，`_store` 写回。`_start` 计划一游戏刻后运行 `tick`，`tick` 执行 `main` 后再次计划自己；`_stop` 清除计划任务。

## 调度流程

`main` 先调用 `_consts` 恢复 VVE 默认常量并应用项目覆盖，然后按 `global_rate` 递归执行 `main_loop`。每个子步推进相位、运行固定调用占位和 `tick_funcs`，周期结束时再切换 `global_inv_dt`。最后运行 `sync_funcs` 并保存状态。

模板在 `main_loop` 中保留“手动添加要执行的 tick 函数”占位，供固定调度特定模块；也可以完全使用动态回调列表。

## 主要接口

| 接口 | 作用 |
| --- | --- |
| `init` | 清空共享回调缓存并生成模拟器状态 |
| `_start` / `_stop` | 开始或停止计划调度 |
| `_get` / `_store` | 读取或保存模拟器状态 |
| `_proj` / `_model` | 在数据模板和临时对象间转换 |
| `_consts` | 恢复默认物理环境并覆盖常量 |
| `main` / `main_loop` | 执行一游戏刻和一个模拟子步的调度 |

回调的添加、查询、删除接口由内置 `vve:simulator` 提供，不在本模板中重复生成。

## 当前实现注意事项

- `init` 直接清空共享的 `storage vve:io tick_funcs/sync_funcs`，初始化期间不应与另一个模拟器的未保存临时状态交错。
- 模板不验证 `global_inv_dt`；设为 `0` 会使取模运算无效，调用方必须保证其为正整数。
- 多个模拟器共用临时记分板和常量表，只能依次完整运行，不能嵌套。
