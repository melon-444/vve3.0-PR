#vve_examples:test_car/_ride_on_nearest
# 聊天栏快捷乘坐
# 输入执行位置
# 以乘坐者为执行者

tag @e[tag=input] remove input
tag @s add input
execute as @e[tag=vve_test_car,limit=1,sort=nearest] run function vve_examples:test_car/_seat_on