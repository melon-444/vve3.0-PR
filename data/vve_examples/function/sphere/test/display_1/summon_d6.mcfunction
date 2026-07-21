#vve_examples:sphere/test/display_1/summon_d6

execute store result storage math:io rotation[0] float -0.0001 run random value 1..3600000
execute store result storage math:io rotation[1] float -0.0001 run random value -900000..900000
data modify entity @e[tag=math_marker,limit=1] Rotation set from storage math:io rotation
execute as @e[tag=math_marker,limit=1] at @s positioned 0.0 0.0 0.0 run tp @s ^ ^ ^75
data modify storage math:io xyz set from entity @e[tag=math_marker,limit=1] Pos
execute store result score vec_x int run data get storage math:io xyz[0] 10000
execute store result score vec_y int run data get storage math:io xyz[1] 10000
execute store result score vec_z int run data get storage math:io xyz[2] 10000
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation vec_x int += @s x
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation vec_y int += @s y
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation vec_z int += @s z
data modify entity @e[tag=math_marker,limit=1] Pos set from storage math:io xyz

data modify storage vve_examples:io input set from storage vve_examples:class dice_6_plate
function vve_examples:dice_6/_proj
execute as @e[tag=math_marker,limit=1] at @s rotated 0.0 0.0 run function vve:object/_anchor_to
scoreboard players set a int 10000
scoreboard players set mass int 17
scoreboard players set inertia int 8000
data modify entity @e[tag=math_marker,limit=1] Rotation set from storage math:io rotation
execute as @e[tag=math_marker,limit=1] at @s positioned 0.0 0.0 0.0 run tp @s ^1.75 ^ ^
data modify storage math:io xyz set from entity @e[tag=math_marker,limit=1] Pos
execute store result score vx int run data get storage math:io xyz[0] 10000
execute store result score vy int run data get storage math:io xyz[1] 10000
execute store result score vz int run data get storage math:io xyz[2] 10000
function vve_examples:dice_6/_model
data modify storage vve_examples:io input set from storage vve_examples:io result
data modify entity @e[tag=math_marker,limit=1] Pos set from storage vve_examples:io input.center
execute at @e[tag=math_marker,limit=1] run function vve_examples:dice_6/_new
tag @e[tag=result,limit=1] add test
#scoreboard players set @e[tag=result,limit=1] killtime 720

data modify entity @e[tag=result,limit=1] view_range set value 64.0f