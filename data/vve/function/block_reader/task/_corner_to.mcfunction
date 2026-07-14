#vve:block_reader/task/_corner_to
# 对角线确定任务区域
# 输入执行坐标，世界实体坐标
# 需要以世界实体为执行者

data modify storage math:io xyz set from entity @s Pos
execute store result score x_max int run data get storage math:io xyz[0]
execute store result score z_max int run data get storage math:io xyz[2]
tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score y_start int store result score y int run data get storage math:io xyz[1]
execute store result score x_min int run data get storage math:io xyz[0]
execute store result score z_min int run data get storage math:io xyz[2]

execute if score x_max int < x_min int run scoreboard players operation x_min int >< x_max int
execute if score z_max int < z_min int run scoreboard players operation z_min int >< z_max int