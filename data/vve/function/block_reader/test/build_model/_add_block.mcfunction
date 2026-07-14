#vve:block_reader/test/build_model/_add_block
# 骑乘一个新的方块展示实体
# 输入{<u,int>,<v,int>,<w,int>}
# 输入storage vve:io result
# 以实例为执行者

tag @e[tag=result] remove result
execute at @s run summon block_display ~ ~ ~ {Tags:["result","vve_build_model_display"],CustomName:"vve_build_model_display",teleport_duration:1,interpolation_duration:1,brightness:{sky:15,block:15},transformation:{right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.2f,0.2f,0.2f],left_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[0.0f,0.0f,0.0f]}}
execute as @e[tag=result,limit=1] run function vve:block_reader/test/build_model/add_operation
ride @e[tag=result,limit=1] mount @s