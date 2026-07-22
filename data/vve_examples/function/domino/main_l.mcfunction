#vve_examples:domino/main_l
# vve_examples:domino/tick调用
# 实体对象主程序

tag @s remove vve_material_box
function vve_examples:domino/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion
# 介质探测
execute as 0-0-0-0-0 run function vve_examples:domino/_iter_cpoints_l
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
# 介质响应
execute if score shift_response int matches 1 run function vve:object/_apply_shift
execute if score impulse_response int matches 1 run function vve:object/_apply_impulse_f
execute if score couple_response int matches 1 as 0-0-0-0-0 run function vve:box_object/_apply_couple
# 外部冲量
data modify storage vve:io result set from entity @s data.impulse_receiver
execute if data storage vve:io result[0] run function vve:cubox/_outer_impulse
function vve:object/_apply_friction
# 姿态角速度修正
scoreboard players operation stemp_cnt_0 int > stemp_cnt_1 int
execute if score stemp_cnt_0 int matches 3.. if score grab_layer_receiver_v_norm int < grab_layer_regular_v int as 0-0-0-0-0 run function vve:object/_regular
# 运动同步
function vve:cubox/_sync_motion
function vve_examples:domino/_store
tag @s add vve_material_box

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_examples:domino/_del