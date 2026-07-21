#vve_examples:sphere/test/display_1/gravity

scoreboard players operation uvec_x int = @s x
scoreboard players operation uvec_y int = @s y
scoreboard players operation uvec_z int = @s z
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation uvec_x int -= x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation uvec_y int -= y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation uvec_z int -= z int
data modify entity 0-0-0-0-0 Pos set from storage math:io xyz
execute as 0-0-0-0-0 positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity 0-0-0-0-0 Pos
execute store result score uvec_x int run data get storage math:io xyz[0] 10000
execute store result score uvec_y int run data get storage math:io xyz[1] 10000
execute store result score uvec_z int run data get storage math:io xyz[2] 10000

scoreboard players operation uvec_x int *= vve_gravity int
scoreboard players operation uvec_y int *= vve_gravity int
scoreboard players operation uvec_z int *= vve_gravity int
scoreboard players operation uvec_x int /= 10000 int
scoreboard players operation uvec_y int /= 10000 int
scoreboard players operation uvec_z int /= 10000 int

scoreboard players operation vx int += uvec_x int
scoreboard players operation vy int += uvec_y int
scoreboard players operation vz int += uvec_z int