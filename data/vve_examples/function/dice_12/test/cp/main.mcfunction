#vve_examples:dice_12/test/cp/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

function vve_examples:dice_12/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion
# 介质探测
execute as 0-0-0-0-0 run function vve_examples:dice_12/_iter_cpoints_c
# 力学迭代
#scoreboard players operation vy int -= vve_gravity int
# 介质响应
execute if score shift_response int matches 1 run function vve:object/_apply_shift
execute if score impulse_response int matches 1 run function vve:object/_apply_impulse_f
execute if score couple_response int matches 1 as 0-0-0-0-0 run function vve:object/_apply_couple
function vve:object/_apply_friction
# 姿态角速度修正
execute if score grab_layer_response int matches 3.. if score grab_layer_receiver_v_norm int < grab_layer_regular_v int as 0-0-0-0-0 run function vve:object/_regular_angular
# 运动同步
function vve:object/_sync_motion
function vve_examples:dice_12/_store
scoreboard players add test_n int 1

execute at @s as 0-0-0-0-0 run function vve_examples:dice_12/_render_norm