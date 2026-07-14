#vve:test/switch_model/start

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos

# 生成测试程序实体
tag @e[tag=result] remove result
execute at @e[tag=math_marker,limit=1] run summon item_display ~ ~ ~ {Tags:["test", "vve_test", "result"], CustomName:'{"text":"vve_test"}'}

item replace entity @e[tag=vve_test,limit=1] container.0 with minecraft:gold_block
data modify entity @e[tag=result,limit=1] interpolation_duration set value 40
data modify entity @e[tag=result,limit=1] brightness set value {sky:15,block:15}

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/switch_model/main"
data modify storage marker_control:io result.del_func set value "vve:test/switch_model/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 40