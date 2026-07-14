#vve:block_reader/arrow_sloop
# vve:block_reader/arrow_loop调用

scoreboard players operation stemp_x int = x int
scoreboard players operation stemp_z int = z int
execute store result score u int run scoreboard players operation stemp_x int -= x_min int
execute store result score w int run scoreboard players operation stemp_z int -= z_min int
execute store result storage math:io xyz[0] double 1 run scoreboard players operation stemp_x int += vec_x int
execute store result storage math:io xyz[1] double 1 run scoreboard players get vec_y int
execute store result storage math:io xyz[2] double 1 run scoreboard players operation stemp_z int += vec_z int
data modify entity @s Pos set from storage math:io xyz
tag @e[tag=result] remove result
execute at @s run summon arrow ~0.5 ~1.5 ~0.5 {Tags:["result"],Motion:[0.0d,-10.0d,0.0d]}
scoreboard players operation layer_index int = inp int
scoreboard players operation v int = y int
scoreboard players operation v int -= y_start int
execute as @e[tag=result,limit=1] run function vve:block_reader/arrow/_as
execute as @e[tag=result,limit=1] run data modify entity @s data.run_func set from storage vve:io block_reader_tasks[0].run_func

scoreboard players add z int 1
execute if score z int <= z_max int run function vve:block_reader/arrow_sloop