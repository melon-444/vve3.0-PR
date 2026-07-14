#vve:test/explode/block_object/test/cp/start

function vve:_consts
function vve:test/explode/block_object/init

# 测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 glass

# 生成测试程序实体
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
data modify storage vve:io input set from storage vve:class explode_block_object_plate
function vve:test/explode/block_object/_proj
execute at @e[tag=math_marker,limit=1] positioned ~ ~4 ~ rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:test/explode/block_object/_model
data modify storage vve:io input set from storage vve:io result
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~ ~4 ~ run function vve:test/explode/block_object/_new
execute as @e[tag=result,limit=1] run data modify entity @s block_state set value {Name:"minecraft:emerald_block"}
execute as @e[tag=result,limit=1] run data modify entity @s transformation.scale set value [1.0f,1.0f,1.0f]

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/explode/block_object/test/cp/main"
data modify storage marker_control:io result.del_func set value "vve:test/explode/block_object/test/cp/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20
scoreboard players set test int -1

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~ ~4 ~ positioned ~5 ~5 ~5 as @e[tag=result,limit=1] run function vve:object/_rotate_here_as