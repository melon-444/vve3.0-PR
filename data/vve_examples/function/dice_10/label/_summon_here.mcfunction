#vve_examples:dice_10/label/_summon_here
# 输入<inp,int>
# 迭代<res,int>

tag @e[tag=result,limit=1] remove result
summon text_display ~ ~ ~ {Tags:["dice_10_text_render","result"],billboard:"center",brightness:{sky:15,block:15},teleport_duration:1}
execute as @e[tag=result,limit=1] run function vve_examples:dice_10/label/set_operation

scoreboard players add res int 1