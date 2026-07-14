#vve_examples:test_car/regular_cross

# 叉乘计算表面法向量
execute store result score stemp_x int run data get storage vve:io shift_points[1][0] 10000
execute store result score stemp_y int run data get storage vve:io shift_points[1][1] 10000
execute store result score stemp_z int run data get storage vve:io shift_points[1][2] 10000
execute store result score vec_x int run data get storage vve:io shift_points[0][0] 10000
execute store result score vec_y int run data get storage vve:io shift_points[0][1] 10000
execute store result score vec_z int run data get storage vve:io shift_points[0][2] 10000
execute store result score fvec_x int run data get storage vve:io shift_points[2][0] 10000
execute store result score fvec_y int run data get storage vve:io shift_points[2][1] 10000
execute store result score fvec_z int run data get storage vve:io shift_points[2][2] 10000
scoreboard players operation vec_x int -= stemp_x int
scoreboard players operation vec_y int -= stemp_y int
scoreboard players operation vec_z int -= stemp_z int
scoreboard players operation fvec_x int -= stemp_x int
scoreboard players operation fvec_y int -= stemp_y int
scoreboard players operation fvec_z int -= stemp_z int
function math:vec/_cross_fvec_high
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get vec_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get vec_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get vec_z int
data modify entity @s Pos set from storage math:io xyz
execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score vec_x int run data get storage math:io xyz[0] 10000
execute store result score vec_y int run data get storage math:io xyz[1] 10000
execute store result score vec_z int run data get storage math:io xyz[2] 10000
scoreboard players operation nvec_x int *= vec_x int
scoreboard players operation nvec_y int *= vec_y int
scoreboard players operation nvec_z int *= vec_z int
scoreboard players operation nvec_x int += nvec_y int
scoreboard players operation nvec_x int += nvec_z int
scoreboard players set stemp_s int 1
execute if score nvec_x int matches ..-1 run scoreboard players set stemp_s int -1
scoreboard players operation nvec_x int = vec_x int
scoreboard players operation nvec_y int = vec_y int
scoreboard players operation nvec_z int = vec_z int
scoreboard players operation nvec_x int *= stemp_s int
scoreboard players operation nvec_y int *= stemp_s int
scoreboard players operation nvec_z int *= stemp_s int