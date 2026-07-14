#vve:test/point/start

function vve:_consts

# 测试坐标
# x:-193
# y:+57
# z:-53
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~6 grass_block
execute at @e[tag=math_marker,limit=1] run fill ~-1 ~ ~6 ~1 ~ ~6 slime_block

# 生成point_A
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
tag @e[tag=result] remove result
execute at @e[tag=math_marker,limit=1] run summon item_display ~0.0 ~2 ~ {Tags:["test", "point_test", "result"], CustomName:{"text":"point_test"},teleport_duration:1,brightness:{sky:15,block:15}}
item replace entity @e[tag=result,limit=1] container.0 with verdant_froglight
data modify entity @e[tag=result,limit=1] transformation.scale set value [0.075f,0.075f,0.075f]
scoreboard players set inp int 2000
execute at @e[tag=math_marker,limit=1] positioned ~0.0 ~2 ~ rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:point/_anchor_to
#function vve:point/_print
execute as @e[tag=result,limit=1] run function vve:point/_store

# 生成point_B
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
tag @e[tag=result] remove result
execute at @e[tag=math_marker,limit=1] run summon item_display ~0.0 ~2 ~ {Tags:["test", "point_test", "result"], CustomName:{"text":"point_test"},teleport_duration:1,brightness:{sky:15,block:15}}
item replace entity @e[tag=result,limit=1] container.0 with verdant_froglight
data modify entity @e[tag=result,limit=1] transformation.scale set value [0.075f,0.075f,0.075f]
scoreboard players set inp int 3000
execute at @e[tag=math_marker,limit=1] positioned ~0.0 ~2 ~ rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:point/_anchor_to
#function vve:point/_print
execute as @e[tag=result,limit=1] run function vve:point/_store

# 生成point_D
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
tag @e[tag=result] remove result
execute at @e[tag=math_marker,limit=1] run summon item_display ~0.0 ~2 ~ {Tags:["test", "point_test", "result"], CustomName:{"text":"point_test"},teleport_duration:1,brightness:{sky:15,block:15}}
item replace entity @e[tag=result,limit=1] container.0 with verdant_froglight
data modify entity @e[tag=result,limit=1] transformation.scale set value [0.075f,0.075f,0.075f]
scoreboard players set inp int 4000
execute at @e[tag=math_marker,limit=1] positioned ~0.0 ~2 ~ rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:point/_anchor_to
#function vve:point/_print
execute as @e[tag=result,limit=1] run function vve:point/_store

#kill @e[tag=point_test]

# 生成测试程序实体point_C
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
tag @e[tag=result] remove result
execute at @e[tag=math_marker,limit=1] run summon item_display ~0.0 ~2 ~ {Tags:["test", "point_test", "result"], CustomName:{"text":"point_test"},teleport_duration:1,brightness:{sky:15,block:15}}
item replace entity @e[tag=result,limit=1] container.0 with verdant_froglight
data modify entity @e[tag=result,limit=1] transformation.scale set value [0.075f,0.075f,0.075f]
scoreboard players set inp int 2500
execute at @e[tag=math_marker,limit=1] positioned ~0.0 ~2 ~ rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:point/_anchor_to
#function vve:point/_print
execute as @e[tag=result,limit=1] run function vve:point/_store

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/point/main"
data modify storage marker_control:io result.del_func set value "vve:test/point/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20
scoreboard players set test int -1
scoreboard players set test_n int 0