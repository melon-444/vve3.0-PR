#vve:cublock/test/inter_bounce/start

function vve:_consts
function vve:cublock/init

# 测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~ ~-2 ~3 ~5 ~2 air
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~-1 ~-2 ~3 ~-1 ~2 glass

tag @e[tag=test] remove test

# 生成测试程序实体A
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute as @e[tag=math_marker,limit=1] at @s positioned ~-1 ~4 ~ rotated 0.0 0.0 run function vve:object/_anchor_to
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
data modify entity @e[tag=math_marker,limit=1] Pos set from storage vve:io input.center
execute at @e[tag=math_marker,limit=1] run function vve:cublock/_new
tag @e[tag=result,limit=1] add test
scoreboard players set mass int 17
scoreboard players set inertia int 500
scoreboard players set inp int 20000
execute as @e[tag=result,limit=1] at @s positioned ~-1.0 ~0.5 ~ rotated -90.0 0.0 run function vve:object/_poke_here_i_as
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight

# 生成测试程序实体B
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute as @e[tag=math_marker,limit=1] at @s positioned ~ ~4 ~ rotated 0.0 0.0 run function vve:object/_anchor_to
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
data modify entity @e[tag=math_marker,limit=1] Pos set from storage vve:io input.center
execute at @e[tag=math_marker,limit=1] run function vve:cublock/_new
tag @e[tag=result,limit=1] add test
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:cublock/test/inter_bounce/main"
data modify storage marker_control:io result.del_func set value "vve:cublock/test/inter_bounce/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 10
scoreboard players set test int -1
scoreboard players set test_n int 0

# 设置旋转
execute as @e[tag=result,limit=1] at @s positioned ~5.0 ~5.0 ~5.0 run function vve:object/_rotate_here_as