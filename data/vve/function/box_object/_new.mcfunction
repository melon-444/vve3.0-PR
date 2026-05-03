#vve:box_object/_new
# 使用数据模板生成实体对象
# 输入数据模板storage vve:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon item_display ~ ~ ~ {Tags:["vve_box_object", "result"],CustomName:"vve_box_object",teleport_duration:1,interpolation_duration:1,brightness:{sky:15,block:15}}
execute as @e[tag=result,limit=1] run function vve:box_object/set
execute as @e[tag=result,limit=1] run function vve:box_object/set_operation