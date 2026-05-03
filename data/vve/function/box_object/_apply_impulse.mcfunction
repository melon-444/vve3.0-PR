#vve:box_object/_apply_impulse
# 应用冲量响应
# 输入impulse{...}
# 传入世界实体为执行者

# 输入位矢向量
scoreboard players operation vec_x int = impulse_x int
scoreboard players operation vec_y int = impulse_y int
scoreboard players operation vec_z int = impulse_z int
scoreboard players operation vec_x int -= x int
scoreboard players operation vec_y int -= y int
scoreboard players operation vec_z int -= z int
# 输入冲量向量
scoreboard players operation fvec_x int = impulse_fx int
scoreboard players operation fvec_y int = impulse_fy int
scoreboard players operation fvec_z int = impulse_fz int
# 计算叉乘
function math:vec/_cross_fvec_high

# 获取转动惯量
function math:uvw/_vecto_f
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get u int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get v int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get w int
data modify entity @s Pos set from storage math:io xyz
execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score u int run data get storage math:io xyz[0] 10000
execute store result score v int run data get storage math:io xyz[1] 10000
execute store result score w int run data get storage math:io xyz[2] 10000
function vve:tensor/_calc_inertia

# 改变角速度
scoreboard players operation sstemp_x int = vec_x int
scoreboard players operation sstemp_y int = vec_y int
scoreboard players operation sstemp_z int = vec_z int
scoreboard players operation vec_x int /= inertia int
scoreboard players operation vec_y int /= inertia int
scoreboard players operation vec_z int /= inertia int
scoreboard players operation sstemp_x int %= inertia int
scoreboard players operation sstemp_y int %= inertia int
scoreboard players operation sstemp_z int %= inertia int
scoreboard players operation vec_x int *= 10000 int
scoreboard players operation vec_y int *= 10000 int
scoreboard players operation vec_z int *= 10000 int
scoreboard players operation sstemp_x int *= 10000 int
scoreboard players operation sstemp_y int *= 10000 int
scoreboard players operation sstemp_z int *= 10000 int
scoreboard players operation sstemp_x int /= inertia int
scoreboard players operation sstemp_y int /= inertia int
scoreboard players operation sstemp_z int /= inertia int
scoreboard players operation vec_x int += sstemp_x int
scoreboard players operation vec_y int += sstemp_y int
scoreboard players operation vec_z int += sstemp_z int
scoreboard players operation angular_x int += vec_x int
scoreboard players operation angular_y int += vec_y int
scoreboard players operation angular_z int += vec_z int
function vve:object/_set_angular

# 改变速度
scoreboard players operation fvec_x int /= mass int
scoreboard players operation fvec_y int /= mass int
scoreboard players operation fvec_z int /= mass int
scoreboard players operation vx int += fvec_x int
scoreboard players operation vy int += fvec_y int
scoreboard players operation vz int += fvec_z int