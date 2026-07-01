#vve:test/material_friction/start

function vve:_init

fill 198 -44 60 203 -44 61 minecraft:blue_ice
fill 198 -44 62 203 -44 63 minecraft:soul_sand
fill 204 -44 60 204 -42 63 glass

# spawn_A:198.5 -43.7625 61.0
# spawn_B:198.5 -43.7625 63.0

# 生成测试方块A
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute positioned 198.5 -42.7625 61.0 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
scoreboard players set inp int 50000
execute positioned 198.5 -42.7625 61.0 rotated -90.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_poke_here_i
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute positioned 198.5 -42.7625 61.0 run function vve:cublock/_new
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight
tag @e[tag=result,limit=1] add test

# 生成测试方块B
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute positioned 198.5 -42.7625 63.0 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
scoreboard players set inp int 50000
execute positioned 198.5 -42.7625 63.0 rotated -90.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_poke_here_i
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute positioned 198.5 -42.7625 63.0 run function vve:cublock/_new
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:sea_lantern
tag @e[tag=result,limit=1] add test

# 生成测试程序实体
tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["test", "vve_test", "result"], CustomName:'{"text":"vve_test"}'}

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/material_friction/main"
data modify storage marker_control:io result.del_func set value "vve:test/material_friction/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20
scoreboard players set test int -1