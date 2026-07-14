#vve_examples:dice_8/_update_display
# 更新展示设置
# 传入dice_8实例为执行者

execute store result storage math:io scale[] float 0.0002 run scoreboard players get a int
data modify entity @s transformation.scale set from storage math:io scale