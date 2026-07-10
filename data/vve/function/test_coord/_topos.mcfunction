#vve:test_coord/_topos
# 使用执行实体获取测试坐标
# 传入执行实体

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get vve_test_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get vve_test_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get vve_test_z int
data modify entity @s Pos set from storage math:io xyz