#vve:block_reader/main
# 方块读取器主程序

# 若无处理中或待处理任务则提前返回
execute store result score temp_cnt int run data get storage vve:io block_reader_cnt
execute unless data storage vve:io block_reader_tasks[0] if score temp_cnt int matches 0 run return fail

# 如果有空闲位置则添加待处理任务
execute if score temp_cnt int matches ..127 if data storage vve:io block_reader_tasks[0] as 0-0-0-0-0 run function vve:block_reader/start_task_loop

# 箭矢调用回调函数
execute as @e[tag=vve_block_reader_arrow,nbt={inBlockState:{}}] run function vve:block_reader/arrow/call_func with entity @s data

# 回收编号
execute store result score loop int run data get storage vve:io block_reader_work
execute if score loop int matches 1.. run function vve:block_reader/work_loop

# 主程序持续运行
schedule function vve:block_reader/main 1t replace