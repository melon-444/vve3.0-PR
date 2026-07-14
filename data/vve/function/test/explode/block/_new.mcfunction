#vve:test/explode/block/_new
# 使用数据模板生成实体对象
# 输入数据模板storage vve:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
summon interaction ~ ~ ~ {Tags:["vve_explode_block","vve_cube_box","vve_material_box","vve_impulse_receiver","result"],data:{impulse_receiver:[]},Passengers:[{id:"minecraft:block_display",Tags:["vve_explode_block_display"],CustomName:"vve_explode_block_display",teleport_duration:1,interpolation_duration:1,transformation:{right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[0.0f,0.0f,0.0f]},brightness:{sky:15,block:15}}]}
execute as @e[tag=result,limit=1] run function vve:test/explode/block/set
execute as @e[tag=result,limit=1] run function vve:test/explode/block/set_operation