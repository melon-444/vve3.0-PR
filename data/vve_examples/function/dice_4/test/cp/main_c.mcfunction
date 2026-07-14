#vve_examples:dice_4/test/cp/main_c

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

function vve_examples:dice_4/_get
# 运动学迭代
#execute as 0-0-0-0-0 run function vve:object/_iter_motion
# 面向玩家
data modify storage math:io render_command set from storage math:class particle_commands.red_dust
execute at @s facing entity @n[type=cow] eyes as 0-0-0-0-0 run function math:facing/_render
execute at @s facing entity @n[type=cow] eyes as 0-0-0-0-0 run function math:quat/_facing_to
function math:quat/_to_uvw
# 介质探测
execute as 0-0-0-0-0 run function vve_examples:dice_4/_iter_cpoints_c
# 力学迭代
#scoreboard players operation vy int -= vve_gravity int
# 介质响应
execute if score shift_response int matches 1 run function vve:object/_apply_shift
execute if score impulse_response int matches 1 run function vve:object/_apply_impulse_f
execute if score couple_response int matches 1 as 0-0-0-0-0 run function vve:object/_apply_couple
function vve:object/_apply_friction
# 姿态角速度修正
execute if score grab_layer_response int matches 3.. if score grab_layer_receiver_v_norm int < grab_layer_regular_v int as 0-0-0-0-0 run function vve_examples:dice_4/_regular
#execute if score grab_layer_response int matches 3.. if score grab_layer_receiver_v_norm int < grab_layer_regular_v int as 0-0-0-0-0 run function vve:object/_regular_angular
# 运动同步
function vve:object/_sync_motion
function vve_examples:dice_4/_store