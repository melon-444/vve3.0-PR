#vve:box_object/test/cp/start

function vve:_init

# 生成测试程序实体
data modify storage vve:io input set from storage vve:class box_object_plate
function vve:box_object/_proj
execute positioned 193 -53 53 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:box_object/_model
data modify storage vve:io input set from storage vve:io result
execute positioned 193 -53 53 run function vve:box_object/_new
item replace entity @e[tag=result,limit=1] container.0 with minecraft:sea_lantern

# 初始冲量
scoreboard players set mass int 35
scoreboard players set inertia int 1800
execute as @e[tag=result,limit=1] at @s positioned ~-0.5 ~1.0 ~0.0 rotated -90.0 0.0 run function vve:object/_poke_here_as

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:box_object/test/cp/main"
data modify storage marker_control:io result.del_func set value "vve:box_object/test/cp/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20
scoreboard players set test int -1
scoreboard players set test_n int 0