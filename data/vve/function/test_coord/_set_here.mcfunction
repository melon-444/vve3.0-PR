#vve:test_coord/_set_here
# 传入执行位置
# 传入世界实体(或玩家)为执行者

tp @s ~ ~ ~
data modify storage math:io xyz set from entity @s Pos
execute store result score vve_test_x int run data get storage math:io xyz[0] 10000
execute store result score vve_test_y int run data get storage math:io xyz[1] 10000
execute store result score vve_test_z int run data get storage math:io xyz[2] 10000