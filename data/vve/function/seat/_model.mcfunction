#vve:seat/_model
# 使用临时对象构建数据模板
# 输出数据模板storage vve:io result

data modify storage vve:io result set value {width:0, height:0}

execute store result storage vve:io result.width double 0.0001 run scoreboard players get width int
execute store result storage vve:io result.height double 0.0001 run scoreboard players get height int