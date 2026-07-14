#vve_examples:dice_4/_update_display
# 更新展示设置
# 传入dice_4实例为执行者

execute store result storage math:io scale[] float 0.00014 run scoreboard players get a int
data modify entity @s transformation.scale set from storage math:io scale