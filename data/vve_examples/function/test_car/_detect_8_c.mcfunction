#vve_examples:test_car/_detect_8_c
# 使用尺寸为8的盒子探测cube实例并进行介质探测
# 输出介质响应(各模块的临时对象)
# 需要传入世界实体为执行者

execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get z int
data modify entity @s Pos set from storage math:io xyz
execute at @s positioned ~-4.0 ~-4.0 ~-4.0 as @e[dx=7,dy=7,dz=7,tag=vve_cube_box,tag=vve_material_box] run function vve_examples:test_car/detect_point_c