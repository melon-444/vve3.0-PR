#vve:block_reader/start_task_loop
# vve:block_reader/main调用

# 投射任务临时对象
data modify storage vve:io input set from storage vve:io block_reader_tasks[0]
function vve:block_reader/task/_proj

# 获取任务编号
execute store result score inp int run data get storage vve:io block_reader_free[0]
data modify storage vve:io block_reader_work prepend from storage vve:io block_reader_free[0]
data remove storage vve:io block_reader_free[0]

# 清空平面
data modify storage vve:io run_func set value "vve:block_reader/clear_func"
function vve:block_reader/_iter_layer

# clone方块
function vve:block_reader/_get_start_pos
execute at @s run function vve:block_reader/clone_from with storage vve:io block_reader_tasks[0]
# 扫描平面生成箭矢
scoreboard players operation x int = x_min int
execute if score x int <= x_max int run function vve:block_reader/arrow_loop

# 区块安全
tp @s 0 0 0

# 存储任务
execute store result storage vve:io index int 1 run scoreboard players get inp int
function vve:block_reader/store_task with storage vve:io {}

execute store result storage vve:io block_reader_cnt int 1 run scoreboard players add temp_cnt int 1
data remove storage vve:io block_reader_tasks[0]
execute if score temp_cnt int matches ..127 if data storage vve:io block_reader_tasks[0] run function vve:block_reader/start_task_loop