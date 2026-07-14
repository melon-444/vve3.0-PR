#vve_examples:dice_4/test/cp/start

function vve:_init
function vve_examples:_init

scoreboard players set vve_grab_friction int 9500
scoreboard players set vve_solid_friction int 9500
scoreboard players set vve_grab_friction_tan int 2500
scoreboard players set vve_solid_friction_tan int 2500
# 使用函数y=1/(x+1)对比例x进行映射后得到的值
scoreboard players set vve_solid_bounce_inv int 6896

kill @e[tag=test]

# 生成测试程序实体
tag @e[tag=result] remove result
summon item_display 191 -53 54 {Tags:["test", "dice_4_test", "result"], CustomName:{"text":"dice_4_test"},teleport_duration:1,interpolation_duration:1,brightness:{sky:15,block:15},item_display:"fixed"}
#item replace entity @e[tag=result,limit=1] container.0 with minecraft:pearlescent_froglight
item replace entity @e[tag=result,limit=1] container.0 with minecraft:clay_ball[minecraft:item_model="dice:d4"]
data modify entity @e[tag=result,limit=1] transformation.scale set value [0.35f,0.35f,0.35f]
scoreboard players set a int 5000
scoreboard players set mass int 8
scoreboard players set inertia int 500
execute at @e[tag=result,limit=1] rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
#execute as @e[tag=math_marker,limit=1] run function vve_examples:dice_4/_rand_quat
execute as @e[tag=result,limit=1] run function vve_examples:dice_4/_store
execute as @e[tag=result,limit=1] run function vve_examples:dice_4/_update_display

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve_examples:dice_4/test/cp/main_c"
data modify storage marker_control:io result.del_func set value "vve_examples:dice_4/test/cp/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 10
scoreboard players set test int -1

# 设置旋转
#execute as @e[tag=result,limit=1] at @s positioned ~25.0 ~25.0 ~25.0 run function vve_examples:dice_4/test/cp/rotate_here_as