#vve:test/explode/main

execute unless score test int matches -1 run return run scoreboard players set @s killtime 0

execute if entity @e[tag=vve_explode_block_object,tag=vve_exploded,limit=1] run scoreboard players add vve_sim_mod int 1
execute if score vve_sim_mod int < inv_dt int as @e[tag=vve_explode_block_object,tag=vve_exploded] run function vve:test/explode/block_object/main_slow_mov
execute if score vve_sim_mod int = inv_dt int as @e[tag=vve_explode_block_object,tag=vve_exploded] run function vve:test/explode/block_object/main_slow_key
execute if score vve_sim_mod int = inv_dt int as @e[tag=vve_explode_block_object,tag=vve_exploded] run function vve:test/explode/block_object/main_force
execute as @e[tag=vve_explode_block_object,tag=vve_exploded] run function vve:test/explode/block_object/main_sync
execute if entity @e[tag=vve_explode_block_object,tag=vve_exploded,limit=1] run scoreboard players operation vve_sim_mod int %= inv_dt int

execute if score @s killtime matches 398 as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute if score @s killtime matches 398 at @e[tag=math_marker,limit=1] run setblock ~-2.0 ~-2.5 ~3.0 glass
execute if score @s killtime matches 398 at @e[tag=math_marker,limit=1] run setblock ~-2.0 ~-1.5 ~3.0 glass
execute if score @s killtime matches 398 at @e[tag=math_marker,limit=1] run setblock ~-2.0 ~-0.5 ~3.0 air
execute if score @s killtime matches 394 at @e[tag=math_marker,limit=1] positioned ~-2.0 ~-0.5 ~3.0 run function vve:test/explode/tnt/_new