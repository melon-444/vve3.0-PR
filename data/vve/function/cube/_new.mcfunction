#vve:cube/_new
# 使用数据模板生成实体对象
# 输入数据模板storage vve:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon interaction ~ ~ ~ {Tags:["vve_cube", "result"],CustomName:"vve_cube",Passengers:[{id:"minecraft:item_display",Tags:["vve_cube_display"],teleport_duration:1,interpolation_duration:1,brightness:{sky:15,block:15}}]}
execute as @e[tag=result,limit=1] run function vve:cube/set
execute as @e[tag=result,limit=1] run function vve:cube/set_operation