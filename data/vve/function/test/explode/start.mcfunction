#vve:test/explode/start

function vve:_consts
function vve:test/explode/tnt/init
function vve:test/explode/block/init
function vve:test/explode/block_object/init

# 测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run place template minecraft:village/plains/houses/plains_small_house_6 ~ ~-3 ~6 180

execute at @e[tag=math_marker,limit=1] run setblock ~0.0 ~-3.5 ~3.0 air
execute at @e[tag=math_marker,limit=1] run setblock ~-3.0 ~-3.5 ~2.0 cobblestone
execute at @e[tag=math_marker,limit=1] run fill ~-6.0 ~0.5 ~0.0 ~-6.0 ~2.5 ~6.0 air

# 生成托底cube
execute as @e[tag=vve_cube,tag=test] run function vve:cube/_del
function vve:cube/_zero
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~-3 ~-10 ~ rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set scale_u int 500000
scoreboard players set scale_v int 80000
scoreboard players set scale_w int 500000
function vve:cube/_model
data modify storage vve:io input set from storage vve:io result
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~-3 ~-10 ~ run function vve:cube/_new
tag @e[tag=result,limit=1] add test
tag @e[tag=result,limit=1] add vve_large_material
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with glass

#execute at @e[tag=math_marker,limit=1] run fill ~13.0 ~-4.5 ~-13.0 ~-23.0 ~-5.5 ~23.0 minecraft:obsidian

# 生成测试程序实体
tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["test", "vve_test", "result"], CustomName:'{"text":"vve_test"}'}

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/explode/main"
data modify storage marker_control:io result.del_func set value "vve:test/explode/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 400
scoreboard players set test int -1
scoreboard players set test_cnt int 0

scoreboard players set vve_sim_mod int 0
scoreboard players set inv_dt int 1

data modify storage vve:io test_timer set value 120