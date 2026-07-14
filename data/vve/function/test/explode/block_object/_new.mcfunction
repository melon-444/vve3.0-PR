#vve:test/explode/block_object/_new
# 使用数据模板生成实体对象
# 输入数据模板storage vve:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon block_display ~ ~ ~ {Tags:["vve_explode_block_object", "result"],CustomName:"vve_explode_block_object",brightness:{sky:15,block:15},teleport_duration:1,interpolation_duration:1,transformation:{right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[-0.5f,-0.5f,-0.5f]}}
execute as @e[tag=result,limit=1] run function vve:test/explode/block_object/set
execute as @e[tag=result,limit=1] run function vve:test/explode/block_object/set_operation