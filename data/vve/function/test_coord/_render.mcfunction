#vve:test_coord/_render
# 渲染测试区域
# 传入世界实体为执行者

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get vve_test_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get vve_test_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get vve_test_z int
data modify entity @s Pos set from storage math:io xyz
execute at @s run particle minecraft:soul_fire_flame ~ ~ ~ 0.0 0.0 0.0 0.05 10 force @a