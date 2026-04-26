#vve:cublock/test/cp/start

function vve:_init

# 生成测试程序实体
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute positioned 193 -53 53 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute positioned 193 -53 53 run function vve:cublock/_new
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:cublock/test/cp/main"
data modify storage marker_control:io result.del_func set value "vve:cublock/test/cp/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20
scoreboard players set test int -1

execute positioned 193 -53 53 positioned ~15 ~15 ~15 as @e[tag=result,limit=1] run function vve:object/_rotate_here_as