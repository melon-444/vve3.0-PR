#vve:block_reader/test/build_model/_new
# 使用数据模板生成实体对象
# 输入数据模板storage vve:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon item_display ~ ~ ~ {Tags:["vve_build_model", "result"],CustomName:"vve_build_model",teleport_duration:1,interpolation_duration:1}
execute as @e[tag=result,limit=1] run function vve:block_reader/test/build_model/set
execute as @e[tag=result,limit=1] run function vve:block_reader/test/build_model/set_operation