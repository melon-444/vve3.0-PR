#vve:block_reader/free_workid
# vve:block_reader/work_loop调用

data modify storage vve:io block_reader_free prepend from storage vve:io block_reader_work[0]
execute store result score temp_cnt int run data get storage vve:io block_reader_cnt
execute store result storage vve:io block_reader_cnt int 1 run scoreboard players remove temp_cnt int 1

# 检查是否有over_func
data modify storage vve:io index set from storage vve:io block_reader_work[0]
function vve:block_reader/get_task with storage vve:io {}
execute if data storage vve:io result.over_func run function vve:block_reader/call_over_func with storage vve:io result