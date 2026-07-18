#vve_examples:roll_head/_spectate_nearest
# 旁观视角
# 输入执行位置

tag @e[tag=input] remove input
tag @s add input
execute as @e[tag=vve_examples_roll_head,limit=1,sort=nearest] run function vve_examples:roll_head/_spectate