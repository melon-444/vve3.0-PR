#vve:block_reader/test/build_model/main

execute unless score test int matches -1 run return run scoreboard players set @s killtime 0

execute if score @s killtime matches 20.. run function vve:block_reader/test/build_model/main_motion
execute if score @s killtime matches 20 run scoreboard players set @s killtime 0
#execute at @s run particle flame
function marker_control:data/_get

data modify storage vve:io input set from storage marker_control:io result.task_list[0]
execute if score @s killtime matches 1 if data storage marker_control:io result.task_list[0] at @s run playsound minecraft:block.netherite_block.place player @a ~ ~ ~ 1.0 1.5
execute if score @s killtime matches 1 if data storage marker_control:io result.task_list[0] run function vve:block_reader/_append_task
execute if score @s killtime matches 1 unless data storage marker_control:io result.task_list[0] run scoreboard players set @s killtime 240
execute if score @s killtime matches 1 if data storage marker_control:io result.task_list[0] run data remove storage marker_control:io result.task_list[0]
execute if score @s killtime matches 1 run scoreboard players set @s killtime 16

function marker_control:data/_store