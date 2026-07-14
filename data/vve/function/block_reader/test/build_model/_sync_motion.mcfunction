#vve:block_reader/test/build_model/_sync_motion
# 运动同步方案
# 输出storage vve:io result
# 以实例为执行者

data modify storage vve:io result set value {start_interpolation:0}
execute if predicate vve:quat_cmp run data remove storage vve:io result.start_interpolation
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get z int
data modify storage vve:io result.Pos set from storage math:io xyz
execute store result storage math:io xyzw[0] float 0.0001 run scoreboard players get quat_x int
execute store result storage math:io xyzw[1] float 0.0001 run scoreboard players get quat_y int
execute store result storage math:io xyzw[2] float 0.0001 run scoreboard players get quat_z int
execute store result storage math:io xyzw[3] float 0.0001 run scoreboard players get quat_w int
data modify storage vve:io result.transformation.left_rotation set from storage math:io xyzw
data modify entity @s {} merge from storage vve:io result

data remove storage vve:io result.Pos
execute on passengers run function vve:block_reader/test/build_model/sync_motion_display