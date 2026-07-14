#vve:block_reader/task/_model
# 使用临时对象构建数据模板
# 输出数据模板storage vve:io result

data modify storage vve:io result set value {y_start:0, y:0, run_func:""}

execute store result storage vve:io result.y_start int 1 run scoreboard players get y_start int
execute store result storage vve:io result.y int 1 run scoreboard players get y int
execute store result storage vve:io result.x_min double 1 run scoreboard players get x_min int
execute store result storage vve:io result.z_min double 1 run scoreboard players get z_min int
execute store result storage vve:io result.x_max double 1 run scoreboard players get x_max int
execute store result storage vve:io result.z_max double 1 run scoreboard players get z_max int
data modify storage vve:io result.run_func set from storage vve:io run_func