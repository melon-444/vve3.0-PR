#vve_examples:test_car/_regular
# 规整化姿态，消除法向角速度
# 输入nvec{...}
# 输入storage vve:io result
# 输入receiver{...}
# 需要传入世界实体为执行者

# 补充列表
execute store result score temp_surface int if data storage vve:io shift_points[2]
data modify storage vve:io shift_points append from storage vve:io not_shift_points[]
data modify storage vve:io shift_origins append from storage vve:io not_shift_origins[]

# 第一个碰撞点转局部坐标
execute store result score vec_x int run data get storage vve:io shift_origins[0][0] 10000
execute store result score vec_y int run data get storage vve:io shift_origins[0][1] 10000
execute store result score vec_z int run data get storage vve:io shift_origins[0][2] 10000
function math:uvw/_vecto
scoreboard players operation stemp_u int = u int
scoreboard players operation stemp_v int = v int
scoreboard players operation stemp_w int = w int

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

# 平面四元数
function math:iquat/_nvec_to

# 转换为相对四元数
function math:quat/_relative
function math:rquat/_to_quat

# 四元数规整化
function math:quat/_touvw
function math:quat/_regular
function math:rquat/_to_quat

# 转换为世界坐标系
function math:quat/_mult
function math:rquat/_to_quat
function math:quat/_touvw

# 将旋转后的碰撞点对齐
scoreboard players operation u int = stemp_u int
scoreboard players operation v int = stemp_v int
scoreboard players operation w int = stemp_w int
function math:uvw/_tovec
execute store result score fvec_x int run data get storage vve:io shift_points[0][0] 10000
execute store result score fvec_y int run data get storage vve:io shift_points[0][1] 10000
execute store result score fvec_z int run data get storage vve:io shift_points[0][2] 10000
scoreboard players operation vec_x int -= fvec_x int
scoreboard players operation vec_y int -= fvec_y int
scoreboard players operation vec_z int -= fvec_z int
scoreboard players operation x int -= vec_x int
scoreboard players operation y int -= vec_y int
scoreboard players operation z int -= vec_z int

# 消除nvec方向的位移并施加
scoreboard players operation stemp_x int = shift_x int
scoreboard players operation stemp_y int = shift_y int
scoreboard players operation stemp_z int = shift_z int
scoreboard players operation stemp_x int *= nvec_x int
scoreboard players operation stemp_y int *= nvec_y int
scoreboard players operation stemp_z int *= nvec_z int
scoreboard players operation stemp_x int += stemp_y int
scoreboard players operation stemp_x int += stemp_z int
execute store result score stemp_y int store result score stemp_z int run scoreboard players operation stemp_x int /= 10000 int
scoreboard players operation stemp_x int *= nvec_x int
scoreboard players operation stemp_y int *= nvec_y int
scoreboard players operation stemp_z int *= nvec_z int
scoreboard players operation stemp_x int /= 10000 int
scoreboard players operation stemp_y int /= 10000 int
scoreboard players operation stemp_z int /= 10000 int
scoreboard players operation shift_x int -= stemp_x int
scoreboard players operation shift_y int -= stemp_y int
scoreboard players operation shift_z int -= stemp_z int
scoreboard players operation x int += shift_x int
scoreboard players operation y int += shift_y int
scoreboard players operation z int += shift_z int

# 消除角速度
execute if score temp_surface int matches 0 run return fail
execute if score angular_x int matches ..-1 run scoreboard players add angular_x int 99
execute if score angular_y int matches ..-1 run scoreboard players add angular_y int 99
execute if score angular_z int matches ..-1 run scoreboard players add angular_z int 99
scoreboard players operation angular_x int /= 100 int
scoreboard players operation angular_y int /= 100 int
scoreboard players operation angular_z int /= 100 int

scoreboard players operation angular_x int *= nvec_x int
scoreboard players operation angular_y int *= nvec_y int
scoreboard players operation angular_z int *= nvec_z int
scoreboard players operation angular_x int += angular_y int
scoreboard players operation angular_x int += angular_z int
execute if score angular_x int matches ..-1 run scoreboard players add angular_x int 9999
execute store result score angular_y int store result score angular_z int run scoreboard players operation angular_x int /= 10000 int

scoreboard players operation angular_x int *= nvec_x int
scoreboard players operation angular_y int *= nvec_y int
scoreboard players operation angular_z int *= nvec_z int
execute if score angular_x int matches ..-1 run scoreboard players add angular_x int 99
execute if score angular_y int matches ..-1 run scoreboard players add angular_y int 99
execute if score angular_z int matches ..-1 run scoreboard players add angular_z int 99
scoreboard players operation angular_x int /= 100 int
scoreboard players operation angular_y int /= 100 int
scoreboard players operation angular_z int /= 100 int

function vve:object/_set_angular