#vve_examples:slime_block/main
# vve_examples:slime_block/tick调用
# 实体对象主程序

function vve_examples:slime_block/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:point/_iter_motion
# 介质探测
execute as 0-0-0-0-0 run function vve_examples:slime_block/_iter_cpoints
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
# 介质响应
execute if score shift_response int matches 1 run function vve:object/_apply_shift
# 形变迭代
scoreboard players set res int 1
execute if score damp_x int matches 0 if score damp_v int matches 0 run scoreboard players set res int 0
execute if score impulse_response int matches 1 run scoreboard players set res int 1
execute if score res int matches 1 run function vve_examples:slime_block/main_scale
# 着陆判定
tag @s[tag=vve_surface] remove vve_surface
execute if score grab_layer_response int matches 3.. if score grab_layer_receiver_v_norm int < grab_layer_regular_v int if score @s killtime matches 1.. run tag @s add vve_surface
# 运动同步
function vve_examples:slime_block/_sync_motion
function vve_examples:slime_block/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_examples:slime_block/_del