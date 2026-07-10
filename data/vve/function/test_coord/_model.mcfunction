#vve:test_coord/_model
# 使用临时对象构建数据模板
# 输出数据模板storage vve:io result

data modify storage vve:io result.center set value [0.0d, 0.0d, 0.0d]

execute store result storage vve:io result.center[0] double 0.0001 run scoreboard players get vve_test_x int
execute store result storage vve:io result.center[1] double 0.0001 run scoreboard players get vve_test_y int
execute store result storage vve:io result.center[2] double 0.0001 run scoreboard players get vve_test_z int