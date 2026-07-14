#vve_examples:test_car/_new
# 使用数据模板生成实体对象
# 输入数据模板storage vve_examples:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon interaction ~ ~ ~ {Tags:["vve_test_car","vve_cube_box","vve_material_box","vve_impulse_receiver","result"],data:{impulse_receiver:[]},Passengers:[{id:"minecraft:item_display",Tags:["test_car_display"],CustomName:"test_car_display",teleport_duration:1,interpolation_duration:1,brightness:{sky:15,block:15},Passengers:[{id:"minecraft:interaction",Tags:["test_car_interaction"]}]}]}
execute as @e[tag=result,limit=1] run function vve_examples:test_car/set
execute as @e[tag=result,limit=1] run function vve_examples:test_car/set_operation