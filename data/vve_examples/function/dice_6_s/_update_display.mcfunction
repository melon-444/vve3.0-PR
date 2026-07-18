#vve_examples:dice_6_s/_update_display
# 更新展示设置
# 传入dice_6_s实例为执行者

function vve:cublock/_update_display

execute store result storage math:io scale[] float 0.0003 run scoreboard players get a int
execute on passengers run data modify entity @s transformation.scale set from storage math:io scale