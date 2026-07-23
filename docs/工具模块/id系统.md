# ID 系统

`vve:id` 为实例分配可回收的非负整数 ID。模块源码位于 `data/vve/function/id/`，使用 `vve_id` 记分板保存实体 ID，并使用 `storage vve:io free_addr` 保存空闲编号队列。

ID 系统只负责编号分配与回收，不负责根据 ID 查询实体，也不保证业务模块之间的编号语义。

## 1. 初始化

`vve:id/init` 由 `vve:_init` 调用，执行：

```text
#id vve_id = -1
storage vve:io free_addr = []
```

其中 `#id vve_id` 记录已经生成到的最大编号。首次分配时，内部函数 `vve:id/new_addr` 会生成 ID `0` 并放入空闲队列。调用者不需要直接调用 `new_addr`。

重新执行初始化会清空空闲队列并把生成计数恢复为 `-1`。如果世界中仍存在已经分配 ID 的实体，此时重新分配可能产生重复编号，因此不应在保留旧实例的同时单独重置 ID 系统。

## 2. 拉取 ID

接口：

```mcfunction
function vve:id/_pull
```

调用时以需要编号的实体为执行者。函数会：

1. 如果空闲队列为空，则创建一个从未使用的新编号；
2. 读取 `free_addr[0]`；
3. 把编号写入 `@s vve_id`；
4. 从队列中移除该编号；
5. 给实体添加 `vve_id` 标签。

示例：

```mcfunction
execute as @e[tag=example_object,tag=!vve_id] run function vve:id/_pull
```

分配后可以通过记分板读取：

```mcfunction
scoreboard players get @s vve_id
```

## 3. 归还 ID

接口：

```mcfunction
function vve:id/_return
```

调用时以持有 ID 的实体为执行者。函数把 `@s vve_id` 追加到 `storage vve:io free_addr`，并移除实体的 `vve_id` 标签。后续 `_pull` 会优先从队首复用已经归还的编号。

典型销毁流程：

```mcfunction
function vve:id/_return
kill @s
```

## 4. 数据结构

| 数据 | 位置 | 含义 |
| --- | --- | --- |
| 生成计数 | `#id vve_id` | 已生成的最大 ID |
| 实体 ID | `@s vve_id` | 当前实体持有的编号 |
| 持有标记 | `tag=vve_id` | 实体当前是否已分配编号 |
| 空闲队列 | `storage vve:io free_addr` | 可以重新分配的编号列表 |

队列采用先归还、先复用的顺序。只有空闲队列为空时，系统才递增 `#id vve_id` 创建新编号。

## 5. 使用约束

1. `_pull` 和 `_return` 都要求以实例为 `@s`。
2. 不要对已经带有 `vve_id` 标签的实体再次调用 `_pull`，否则旧编号不会自动归还。
3. 不要对同一实体重复调用 `_return`。当前实现不会检查标签，也不会清空实体记分板；重复归还会把同一个编号多次加入空闲队列。
4. 销毁带 ID 的实体前应先调用 `_return`，否则编号不会被复用。
5. `vve_id` 只保证在正确分配和归还流程下不重复，不提供跨重新初始化的持久唯一性。

## 6. 完整示例

创建实体并分配 ID：

```mcfunction
summon marker ~ ~ ~ {Tags:["example_object","result"]}
execute as @e[tag=result,limit=1] run function vve:id/_pull
tag @e[tag=result,limit=1] remove result
```

删除指定实例时归还编号：

```mcfunction
execute as @e[tag=example_object,limit=1,sort=nearest] run function example:delete
```

```mcfunction
# example:delete
function vve:id/_return
kill @s
```
