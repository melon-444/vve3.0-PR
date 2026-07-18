#vve_examples:impulse_lamp/test/point/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:impulse_lamp/_get
#function vve_examples:impulse_lamp/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:impulse_lamp/test/point/store_frame with storage vve_examples:io {}

function vve_examples:impulse_lamp/main_c
#scoreboard players set inp int 7500
#execute if score test_n int matches 60..72 at @s positioned ~-1 ~0.5 ~ rotated -90.0 0.0 run function vve_examples:impulse_lamp/_poke_here_i_as
#execute as 0-0-0-0-0 run function vve:impulse/_render

scoreboard players add test_n int 1

scoreboard players operation temp_mod int = test_n int
scoreboard players operation temp_mod int > 100 int
scoreboard players operation temp_mod int %= 60 int
execute unless score temp_mod int matches 0 run return fail

# 生成质点
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
tag @e[tag=result] remove result
execute at @e[tag=math_marker,limit=1] run summon item_display ~0.0 ~1.5 ~-3 {Tags:["test", "point_test", "result"], CustomName:{"text":"point_test"},teleport_duration:1,brightness:{sky:15,block:15}}
item replace entity @e[tag=result,limit=1] container.0 with verdant_froglight
data modify entity @e[tag=result,limit=1] transformation.scale set value [0.075f,0.075f,0.075f]
scoreboard players set inp int 2800
execute at @e[tag=math_marker,limit=1] positioned ~0.0 ~1.5 ~-3 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:point/_anchor_to
execute as @e[tag=result,limit=1] run function vve:point/_store

execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.tick_func set value "vve:test/point/main_point"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked

scoreboard players set @e[tag=result,limit=1] killtime 120