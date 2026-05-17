#vve:seat/_update_display
# 更新展示设置
# 传入vve_seat实例为执行者

data modify storage vve:io result set value {}
execute store result storage vve:io result.width float 0.0001 run scoreboard players get width int
execute store result storage vve:io result.height float 0.0001 run scoreboard players get height int
data modify entity @s {} merge from storage vve:io result