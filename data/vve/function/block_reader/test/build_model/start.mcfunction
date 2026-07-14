#vve:block_reader/test/build_model/start

function vve:block_reader/test/build_model/init

# 测试场地
# x:-300
# y:+62
# z:+10
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute as @e[tag=math_marker,limit=1] at @s run tp @s ~-4 ~-2 ~5
execute as @e[tag=math_marker,limit=1] at @s run place template vve:test_chicken ~ ~ ~ 180
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos

# 生成测试程序实体
tag @e[tag=test] remove test
data modify storage vve:io input set from storage vve:class build_model_plate
function vve:block_reader/test/build_model/_proj
execute at @e[tag=math_marker,limit=1] positioned ~0.0 ~-1.0 ~-0.50 run setblock ~ ~ ~ oak_log
execute at @e[tag=math_marker,limit=1] positioned ~0.0 ~0.0 ~-1.00 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:block_reader/test/build_model/_model
data modify storage vve:io input set from storage vve:io result
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~0.0 ~0.0 ~-1.00 run function vve:block_reader/test/build_model/_new
tag @e[tag=result,limit=1] add test

data modify storage vve:io run_func set value "vve:block_reader/test/build_model/get_block"
data modify storage vve:io over_func set value "vve:block_reader/test/build_model/read_over"
# 设置方块读取任务
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute as @e[tag=math_marker,limit=1] at @s run tp @s ~-4 ~-2 ~5
execute as @e[tag=math_marker,limit=1] at @s positioned ~-4 ~8 ~-6 run function vve:block_reader/task/_corner_list

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 存储任务列表
data modify storage marker_control:io result.task_list set from storage vve:io result

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:block_reader/test/build_model/main"
data modify storage marker_control:io result.del_func set value "vve:block_reader/test/build_model/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 18
scoreboard players set test int -1

execute as @e[tag=result,limit=1] at @s positioned ~0.0 ~-8.0 ~0.0 run function vve:object/_rotate_here_as

data modify storage vve:io test_timer set value 180