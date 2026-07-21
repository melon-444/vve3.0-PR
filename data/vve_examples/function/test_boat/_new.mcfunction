#vve_examples:test_boat/_new
# 使用数据模板生成实体对象
# 输入数据模板storage vve_examples:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon item_display ~ ~ ~ {Tags:["vve_examples_test_boat","result"],CustomName:"vve_examples_test_boat",teleport_duration:1,interpolation_duration:1,brightness:{sky:15,block:15},Passengers:[{id:"minecraft:interaction",Tags:["vve_examples_test_boat_interaction"]}]}
execute as @e[tag=result,limit=1] run function vve_examples:test_boat/set
execute as @e[tag=result,limit=1] run function vve_examples:test_boat/set_operation