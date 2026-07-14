#vve:block_reader/test/build_model/sync_motion_display
# vve:block_reader/test/build_model/_sync_motion调用

scoreboard players operation u int = @s u
scoreboard players operation v int = @s v
scoreboard players operation w int = @s w
scoreboard players operation u int *= 1000 int
scoreboard players operation v int *= 1000 int
scoreboard players operation w int *= 1000 int
function math:uvw/_tofvec
execute store result storage math:io translation[0] float 0.0002 run scoreboard players get fvec_x int
execute store result storage math:io translation[1] float 0.0002 run scoreboard players get fvec_y int
execute store result storage math:io translation[2] float 0.0002 run scoreboard players get fvec_z int
data modify storage vve:io result.transformation.translation set from storage math:io translation
data modify entity @s {} merge from storage vve:io result