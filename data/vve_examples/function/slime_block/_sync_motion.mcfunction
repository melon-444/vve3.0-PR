#vve_examples:slime_block/_sync_motion
# 提供slime_block实体运动同步方案
# 传入执行实体(非玩家)

scoreboard players operation damp_x int > -9000 int
data modify storage vve:io result set value {start_interpolation:0,transformation:{scale:[1.0f,1.0f,1.0f]}}
execute if score @s damp_x = damp_x int run data remove storage vve:io result

scoreboard players operation scale_v int = damp_x int
execute store result storage vve:io result.transformation.scale[1] float 0.0001 run scoreboard players add scale_v int 10000
scoreboard players operation inp int = scale_v int
scoreboard players operation inp int *= 10000 int
function math:_sqrt
scoreboard players operation inp int = res int
scoreboard players set res int 100000
function math:_3div
execute store result storage vve:io result.transformation.scale[0] float 0.0001 run scoreboard players operation scale_u int = res int
execute store result storage vve:io result.transformation.scale[2] float 0.0001 run scoreboard players operation scale_w int = res int

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get z int
data modify storage vve:io result.Pos set from storage math:io xyz

data modify entity @s {} merge from storage vve:io result