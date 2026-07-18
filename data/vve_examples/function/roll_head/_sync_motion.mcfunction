#vve_examples:roll_head/_sync_motion
# 提供实体运动同步方案
# 输出storage vve:io result
# 传入执行实体(非玩家)

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
scoreboard players operation sstemp_jx int = jvec_x int
scoreboard players operation sstemp_jy int = jvec_y int
scoreboard players operation sstemp_jz int = jvec_z int
execute store result storage math:io translation[0] float 0.00000001 run scoreboard players operation sstemp_jx int *= a int
execute store result storage math:io translation[1] float 0.00000001 run scoreboard players operation sstemp_jy int *= a int
execute store result storage math:io translation[2] float 0.00000001 run scoreboard players operation sstemp_jz int *= a int
data modify storage vve:io result.transformation.translation set from storage math:io translation
data modify entity @s {} merge from storage vve:io result