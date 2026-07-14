#vve:test/float_cmp/start

function vve:_consts
scoreboard players set vve_water_c int 300000

# x: -200
# y: +45
# z: -50

# 测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~2 ~-1 ~0 ~-2 ~-1 ~4 oak_log
execute at @e[tag=math_marker,limit=1] run fill ~3 ~0 ~0 ~3 ~1 ~4 oak_log
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~1 ~5 ~2 ~0 ~5 oak_log
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~0 ~4 ~-3 ~1 ~0 oak_log
execute at @e[tag=math_marker,limit=1] run fill ~2 ~1 ~-1 ~-2 ~0 ~-1 oak_log
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~0 ~0 ~2 ~1 ~4 water

# center: 200.5 -41.5 52.5

# 生成测试方块A
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute at @e[tag=math_marker,limit=1] positioned ~-0.5 ~3.5 ~2.5 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~-0.5 ~3.5 ~2.5 rotated 0.0 0.0 positioned ~ ~ ~6.0 as @e[tag=math_marker,limit=1] run function vve:object/_rotate_here
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~-0.5 ~3.5 ~2.5 run function vve:cublock/_new
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight
tag @e[tag=result,limit=1] add test

# 生成测试方块B
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute at @e[tag=math_marker,limit=1] positioned ~1.5 ~3.5 ~2.5 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~1.5 ~3.5 ~2.5 rotated 0.0 0.0 positioned ~ ~ ~6.0 as @e[tag=math_marker,limit=1] run function vve:object/_rotate_here
scoreboard players operation mass int *= 7 int
scoreboard players operation inertia int *= 7 int
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~1.5 ~3.5 ~2.5 run function vve:cublock/_new
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:iron_block
tag @e[tag=result,limit=1] add test

# 生成测试程序实体
tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["test", "vve_test", "result"], CustomName:'{"text":"vve_test"}'}

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/float_cmp/main"
data modify storage marker_control:io result.del_func set value "vve:test/float_cmp/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20

scoreboard players set test int -1