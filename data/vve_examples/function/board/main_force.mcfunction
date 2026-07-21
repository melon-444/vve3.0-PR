#vve_examples:board/main_force
# vve_examples:board/tick调用
# 实体对象力学迭代主程序

function vve_examples:board/_get
# 介质探测
execute as 0-0-0-0-0 run function vve_examples:board/_iter_cpoints_c
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
# 介质响应
execute if score shift_response int matches 1 run function vve:object/_apply_shift
execute if score impulse_response int matches 1 run function vve:object/_apply_impulse_f
execute if score couple_response int matches 1 as 0-0-0-0-0 run function vve:box_object/_apply_couple
function vve:object/_apply_friction
# 姿态角速度修正
execute if score grab_layer_response int matches 3.. if score grab_layer_receiver_v_norm int < grab_layer_regular_v int as 0-0-0-0-0 run function vve:object/_regular
function vve_examples:board/_store