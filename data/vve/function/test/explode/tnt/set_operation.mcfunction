#vve:test/explode/tnt/set_operation
# vve:test/explode/tnt/_new调用

#data modify storage vve:io run_func set value "vve:test/explode/tnt/read_block"
#data modify storage vve:io run_func set value "vve:test/explode/tnt/read_block_object"
data modify storage vve:io run_func set value "vve:test/explode/tnt/read_block_object_1"
data modify storage vve:io over_func set value "vve:test/explode/tnt/read_over"
execute at @s as 0-0-0-0-0 run tp @s ~-3 ~-3 ~-3
execute at @s as 0-0-0-0-0 positioned ~3 ~3 ~3 run function vve:block_reader/task/_corner_list

function marker_control:data/_get

# 存储任务列表
data modify storage marker_control:io result.task_list set from storage vve:io result

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/explode/tnt/main"
data modify storage marker_control:io result.del_func set value "vve:test/explode/tnt/_del"

function marker_control:data/_store
tag @s add entity_ticked
tag @s add entity_todel

scoreboard players set @s killtime 60