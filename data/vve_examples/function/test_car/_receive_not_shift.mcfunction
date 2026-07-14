#vve_examples:test_car/_receive_not_shift
# 接收无位移响应
# 迭代storage vve:io not_shift_points
# 迭代storage vve:io not_shift_origins

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get c_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get c_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get c_z int
data modify storage vve:io not_shift_origins append from storage math:io xyz
data modify storage vve:io not_shift_points append from storage math:io xyz