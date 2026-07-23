# `vve_response_1.0`

`vve_response_1.0` 是最小化的介质响应辅助模板。它不定义具体响应字段或算法，只为一个已经存在的响应对象增加初始化信号和打印接口。

模板源码位于 `memory_storage/vve_response_1.0/`，只包含两个文件。

## 生成内容

| 文件 | 行为 |
| --- | --- |
| `init` | 将 `$(module_name)_response int` 设为 `0` |
| `_print` | 使用 MOT 的 `$print $(_this)` 打印当前临时对象 |

例如模块名为 `impulse` 时，初始化信号为 `impulse_response`。

## 组合要求

模板没有 `.doc.mcfo`，因此自身并未定义 `$(_this)`。`_print` 只有在记忆栈中已经存在响应对象格式时才能展开为有意义的打印代码。

它也不创建记分板 objective，不负责清空负载字段，不实现响应汇总或消费逻辑。调用方需要自行提供这些部分。

## 覆盖风险

该功能层带有顶层 `init.mcfi`。若它后压入一个已有完整 `init` 的模板，会直接覆盖原初始化文件，而不是把一行信号初始化追加到末尾。

组合时应手动把 `scoreboard players set $(module_name)_response int 0` 合并进最终模块的 `init`，或确保该模板用于构建一个本来就只需要这项初始化的响应模块。
