#vve:cublock/_sync_motion
# cublock同步运动方案
# 传入实例为执行者

data modify storage vve:io result set value {start_interpolation:0}
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