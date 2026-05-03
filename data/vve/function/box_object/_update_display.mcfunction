#vve:box_object/_update_display
# 更新展示设置
# 传入box_object实例为执行者

execute store result storage math:io scale[0] float 0.0001 run scoreboard players get scale_u int
execute store result storage math:io scale[1] float 0.0001 run scoreboard players get scale_v int
execute store result storage math:io scale[2] float 0.0001 run scoreboard players get scale_w int
data modify entity @s transformation.scale set from storage math:io scale