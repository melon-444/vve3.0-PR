#vve_examples:roll_head/main_sync_cam
# vve_examples:roll_head/main_c调用

execute as 0-0-0-0-0 run function math:uvw/_to_euler
execute store result storage math:io rotation[1] float 0.0001 run scoreboard players get phi int
execute store result storage math:io rotation[0] float -0.0001 run scoreboard players get theta int
data modify entity 0-0-0-0-0 Rotation set from storage math:io rotation
scoreboard players operation sstemp_x int = kvec_x int
scoreboard players operation sstemp_y int = kvec_y int
scoreboard players operation sstemp_z int = kvec_z int
scoreboard players operation sstemp_x int /= 2 int
scoreboard players operation sstemp_y int /= 2 int
scoreboard players operation sstemp_z int /= 2 int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation sstemp_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation sstemp_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation sstemp_z int += z int
data modify entity 0-0-0-0-0 Pos set from storage math:io xyz
scoreboard players operation tempid int = @s vve_id
execute as @e[tag=vve_examples_roll_head_cam] if score @s int = tempid int run tag @s add tmp_1
execute at 0-0-0-0-0 run tp @e[tag=tmp_1,limit=1] ~ ~ ~ ~ ~
tag @e[tag=tmp_1] remove tmp_1