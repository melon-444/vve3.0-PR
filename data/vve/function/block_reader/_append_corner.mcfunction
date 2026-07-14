#vve:block_reader/_append_corner
# 根据对角线确定立方体添加任务
# 输入storage vve:io run_func
# 输入结束回调函数storage vve:io over_func
# over_func注意{<res,int>,<loop,int>}已被占用
# 输入执行坐标，世界实体坐标
# 需要以世界实体为执行者

data modify storage math:io xyz set from entity @s Pos
execute store result score x_max int run data get storage math:io xyz[0]
execute store result score y_max int run data get storage math:io xyz[1]
execute store result score z_max int run data get storage math:io xyz[2]
tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score x_min int run data get storage math:io xyz[0]
execute store result score y_min int run data get storage math:io xyz[1]
execute store result score z_min int run data get storage math:io xyz[2]

execute if score x_max int < x_min int run scoreboard players operation x_min int >< x_max int
execute if score y_max int < y_min int run scoreboard players operation y_min int >< y_max int
execute if score z_max int < z_min int run scoreboard players operation z_min int >< z_max int

scoreboard players operation y_start int = y_min int
scoreboard players operation y int = y_min int
execute if score y int <= y_max int run function vve:block_reader/append_loop

data modify storage vve:io block_reader_tasks[-1].over_func set from storage vve:io over_func

schedule function vve:block_reader/main 1t replace