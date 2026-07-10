#vve:test/float/start

function vve:_init
scoreboard players set vve_water_c int 300000

# 测试场地
fill 202 -46 50 198 -46 54 oak_log
fill 203 -45 50 203 -44 54 oak_log
fill 198 -44 55 202 -45 55 oak_log
fill 197 -45 54 197 -44 50 oak_log
fill 202 -44 49 198 -45 49 oak_log
fill 198 -45 50 202 -44 54 water

# center: 200.5 -41.5 52.5

# 生成测试程序实体
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute positioned 200.5 -41.5 52.5 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
execute positioned 200.5 -41.5 52.5 rotated 0.0 0.0 positioned ~8.0 ~ ~ as @e[tag=math_marker,limit=1] run function vve:object/_rotate_here
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute positioned 200.5 -41.5 52.5 run function vve:cublock/_new
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/float/main"
data modify storage marker_control:io result.del_func set value "vve:test/float/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20

scoreboard players set test int -1