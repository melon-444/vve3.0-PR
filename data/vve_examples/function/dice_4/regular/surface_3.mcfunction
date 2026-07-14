#vve_examples:dice_4/regular/surface_3
# vve_examples:dice_4/_regular调用

function math:quat/_to_iquat

# 变换cos
scoreboard players operation inp int = cos int
scoreboard players add inp int 10000
scoreboard players operation inp int > 0 int
scoreboard players operation inp int *= 5000 int
function math:_sqrt
scoreboard players operation quat_w int = res int

# 计算从sstemp_n1到uvw的旋转四元数
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation sstemp_n3_x int += u int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation sstemp_n3_y int += v int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation sstemp_n3_z int += w int
data modify entity @s Pos set from storage math:io xyz
execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage math:io xyz set from entity @s Pos
execute store result score vec_x int run data get storage math:io xyz[0] 10000
execute store result score vec_y int run data get storage math:io xyz[1] 10000
execute store result score vec_z int run data get storage math:io xyz[2] 10000
scoreboard players operation fvec_x int = u int
scoreboard players operation fvec_y int = v int
scoreboard players operation fvec_z int = w int
function math:vec/_cross_fvec
scoreboard players operation quat_x int = vec_x int
scoreboard players operation quat_y int = vec_y int
scoreboard players operation quat_z int = vec_z int

function math:quat/_mult
function math:rquat/_to_quat

# 消除法向角速度
function vve:object/_regular_angular