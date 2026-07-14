#vve_examples:dice_6/_new
# 使用数据模板生成实体对象
# 输入数据模板storage vve_examples:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon item_display ~ ~ ~ {Tags:["dice_6", "result"],CustomName:"dice_6",brightness:{sky:15,block:15},teleport_duration:1,interpolation_duration:1,transformation:{right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[0.0f,0.0f,0.0f]}}
execute as @e[tag=result,limit=1] run function vve_examples:dice_6/set
execute as @e[tag=result,limit=1] run function vve_examples:dice_6/set_operation