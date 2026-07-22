#vve_examples:dice_6/test/spring/render
# vve_examples:dice_6/test/spring/main调用

execute store result entity @s Rotation[0] float -0.0001 run scoreboard players add psi int 100000
execute at @s positioned 0.0 0.0 0.0 rotated ~ 0.0 run tp @s ^ ^ ^0.25
data modify storage math:io xyz set from entity @s Pos
execute store result score u int run data get storage math:io xyz[2] 10000
execute store result score v int run data get storage math:io xyz[0] 10000
scoreboard players operation sstemp_ix int = ivec_x int
scoreboard players operation sstemp_iy int = ivec_y int
scoreboard players operation sstemp_iz int = ivec_z int
scoreboard players operation sstemp_ix int *= u int
scoreboard players operation sstemp_iy int *= u int
scoreboard players operation sstemp_iz int *= u int
scoreboard players operation sstemp_ix int /= 10000 int
scoreboard players operation sstemp_iy int /= 10000 int
scoreboard players operation sstemp_iz int /= 10000 int

scoreboard players operation sstemp_jx int = jvec_x int
scoreboard players operation sstemp_jy int = jvec_y int
scoreboard players operation sstemp_jz int = jvec_z int
scoreboard players operation sstemp_jx int *= v int
scoreboard players operation sstemp_jy int *= v int
scoreboard players operation sstemp_jz int *= v int
scoreboard players operation sstemp_jx int /= 10000 int
scoreboard players operation sstemp_jy int /= 10000 int
scoreboard players operation sstemp_jz int /= 10000 int

scoreboard players operation sstemp_ix int += sstemp_jx int
scoreboard players operation sstemp_iy int += sstemp_jy int
scoreboard players operation sstemp_iz int += sstemp_jz int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation sstemp_ix int += ssstemp0 int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation sstemp_iy int += ssstemp1 int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation sstemp_iz int += ssstemp2 int
data modify entity @s Pos set from storage math:io xyz
execute at @s run function math:rgb/_render_debug_2