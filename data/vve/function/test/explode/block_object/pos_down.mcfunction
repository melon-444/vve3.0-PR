#vve:test/explode/block_object/pos_down

data modify storage math:io xyz set from entity @s Pos
execute store result score sstemp_x int run data get storage math:io xyz[0] 10000
execute store result score sstemp_y int run data get storage math:io xyz[1] 10000
execute store result score sstemp_z int run data get storage math:io xyz[2] 10000
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players remove sstemp_y int 10000
data modify entity @s Pos set from storage math:io xyz