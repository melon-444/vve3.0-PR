#vve_examples:impulse_lamp/main_force
# vve_examples:impulse_lamp/tick调用
# 实体对象力学迭代主程序

tag @s remove vve_material_box
function vve_examples:impulse_lamp/_get
# 介质探测
execute as 0-0-0-0-0 run function vve_examples:impulse_lamp/_iter_cpoints_c
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
# 介质响应
execute if score shift_response int matches 1 run function vve:object/_apply_shift
execute if score impulse_response int matches 1 run function vve:object/_apply_impulse_f
execute if score couple_response int matches 1 as 0-0-0-0-0 run function vve:object/_apply_couple
# 外部冲量
data modify storage vve:io result set from entity @s data.impulse_receiver
execute if data storage vve:io result[0] run function vve:cublock/_outer_impulse
function vve:object/_apply_friction
# 姿态角速度修正
tag @s[tag=vve_surface] remove vve_surface
execute if score grab_layer_response int matches 3.. if score grab_layer_receiver_v_norm int < grab_layer_regular_v int run function vve_examples:impulse_lamp/_regular
function vve_examples:impulse_lamp/_store
tag @s add vve_material_box