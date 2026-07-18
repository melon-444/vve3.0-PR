#vve_examples:roll_head/_update_display
# 更新展示设置
# 传入roll_head实例为执行者

data modify storage vve:io result set value {transformation:{scale:[0.0f,0.0f,0.0f],translation:[0.0f,0.0f,0.0f]}}

execute store result storage math:io scale[] float 0.0004 run scoreboard players get a int
data modify storage vve:io result.transformation.scale set from storage math:io scale

scoreboard players operation sstemp_jx int = jvec_x int
scoreboard players operation sstemp_jy int = jvec_y int
scoreboard players operation sstemp_jz int = jvec_z int
execute store result storage math:io translation[0] float 0.00000001 run scoreboard players operation sstemp_jx int *= a int
execute store result storage math:io translation[1] float 0.00000001 run scoreboard players operation sstemp_jy int *= a int
execute store result storage math:io translation[2] float 0.00000001 run scoreboard players operation sstemp_jz int *= a int
data modify storage vve:io result.transformation.translation set from storage math:io translation
data modify entity @s {} merge from storage vve:io result