#vve_examples:skip_stone/_model
# 使用临时对象构建数据模板
# 输出数据模板storage vve_examples:io result

data modify storage vve_examples:io result set value {mass:0, center:[0.0d, 0.0d, 0.0d], velocity:[0.0d, 0.0d, 0.0d]}

execute store result storage vve_examples:io result.mass int 1 run scoreboard players get mass int
execute store result storage vve_examples:io result.center[0] double 0.0001 run scoreboard players get x int
execute store result storage vve_examples:io result.center[1] double 0.0001 run scoreboard players get y int
execute store result storage vve_examples:io result.center[2] double 0.0001 run scoreboard players get z int
execute store result storage vve_examples:io result.velocity[0] double 0.0001 run scoreboard players get vx int
execute store result storage vve_examples:io result.velocity[1] double 0.0001 run scoreboard players get vy int
execute store result storage vve_examples:io result.velocity[2] double 0.0001 run scoreboard players get vz int