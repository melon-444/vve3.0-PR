#vve_examples:impulse_lamp/_sync_motion
# 运动同步方案
# 传入实例为执行者

data modify storage vve:io result set value {start_interpolation:0}

# 计算局部坐标
scoreboard players operation u int = a int
scoreboard players operation v int = a int
scoreboard players operation w int = a int
function math:uvw/_tofvec
execute store result storage math:io translation[0] float -0.0001 run scoreboard players get fvec_x int
execute store result storage math:io translation[1] float -0.0001 run scoreboard players operation fvec_y int += cube_shift_y int
execute store result storage math:io translation[2] float -0.0001 run scoreboard players get fvec_z int
data modify storage vve:io result.transformation.translation set from storage math:io translation

execute if predicate vve:quat_cmp run data remove storage vve:io result.start_interpolation
execute store result storage math:io xyzw[0] float 0.0001 run scoreboard players get quat_x int
execute store result storage math:io xyzw[1] float 0.0001 run scoreboard players get quat_y int
execute store result storage math:io xyzw[2] float 0.0001 run scoreboard players get quat_z int
execute store result storage math:io xyzw[3] float 0.0001 run scoreboard players get quat_w int
data modify storage vve:io result.transformation.left_rotation set from storage math:io xyzw
execute on passengers run data modify entity @s {} merge from storage vve:io result

scoreboard players operation sstemp_y int = y int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation sstemp_y int -= cube_shift_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get z int
data modify entity @s Pos set from storage math:io xyz