#vve_examples:dice_12/test/cp/start

function vve:_init
function vve_examples:dice_12/init

scoreboard players set vve_grab_friction int 9500
scoreboard players set vve_solid_friction int 9500
scoreboard players set vve_grab_friction_tan int 2500
scoreboard players set vve_solid_friction_tan int 2500
# 使用函数y=1/(x+1)对比例x进行映射后得到的值
scoreboard players set vve_solid_bounce_inv int 6896

kill @e[tag=test]

# 生成测试程序实体
data modify storage vve_examples:io input set from storage vve_examples:class dice_12_plate
function vve_examples:dice_12/_proj
execute positioned 193 -53 54 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve_examples:dice_12/_model
data modify storage vve_examples:io input set from storage vve_examples:io result
data modify entity @e[tag=math_marker,limit=1] Pos set from storage vve_examples:io input.center
execute at @e[tag=math_marker,limit=1] run function vve_examples:dice_12/_new
item replace entity @e[tag=result,limit=1] container.0 with minecraft:clay_ball[minecraft:item_model="dice:d12"]
tag @e[tag=result,limit=1] add test
tag @e[tag=result,limit=1] remove dice_12

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve_examples:dice_12/test/cp/main"
data modify storage marker_control:io result.del_func set value "vve_examples:dice_12/test/cp/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 10
scoreboard players set test int -1

# 设置旋转
#execute at @e[tag=result,limit=1] positioned ~55.0 ~55.0 ~55.0 run function vve_examples:dice_12/test/cp/rotate_here
scoreboard players set test_n int 0