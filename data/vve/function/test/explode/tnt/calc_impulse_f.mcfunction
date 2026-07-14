#vve:test/explode/tnt/calc_impulse_f
# vve:test/explode/tnt/read_block_object调用

scoreboard players operation vec_x int = x int
scoreboard players operation vec_y int = y int
scoreboard players operation vec_z int = z int
scoreboard players operation vec_x int -= stemp_x int
scoreboard players operation vec_y int -= stemp_y int
scoreboard players operation vec_z int -= stemp_z int
scoreboard players operation vec_x int += fvec_x int
scoreboard players operation vec_y int += fvec_y int
scoreboard players operation vec_z int += fvec_z int
execute as 0-0-0-0-0 run function math:vec/_unit
scoreboard players set temp_min int 2400
scoreboard players operation res int > temp_min int
scoreboard players operation uvec_x int *= 10000 int
scoreboard players operation uvec_y int *= 10000 int
scoreboard players operation uvec_z int *= 10000 int
scoreboard players operation uvec_x int /= res int
scoreboard players operation uvec_y int /= res int
scoreboard players operation uvec_z int /= res int
scoreboard players operation impulse_fx int += uvec_x int
scoreboard players operation impulse_fy int += uvec_y int
scoreboard players operation impulse_fz int += uvec_z int