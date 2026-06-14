#vve:cpoint/_model
# 使用临时对象构建数据模板
# 输出数据模板storage vve:io result

data modify storage vve:io result set value {center:[0.0d, 0.0d, 0.0d], velocity:[0.0d, 0.0d, 0.0d], c_mass:0}

execute store result storage vve:io result.center[0] double 0.0001 run scoreboard players get c_x int
execute store result storage vve:io result.center[1] double 0.0001 run scoreboard players get c_y int
execute store result storage vve:io result.center[2] double 0.0001 run scoreboard players get c_z int
execute store result storage vve:io result.velocity[0] double 0.0001 run scoreboard players get c_vx int
execute store result storage vve:io result.velocity[1] double 0.0001 run scoreboard players get c_vy int
execute store result storage vve:io result.velocity[2] double 0.0001 run scoreboard players get c_vz int
execute store result storage vve:io result.c_mass int 1 run scoreboard players get c_mass int