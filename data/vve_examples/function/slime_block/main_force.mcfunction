#vve_examples:slime_block/main_force
# vve_examples:slime_block/tick调用
# 实体对象力学迭代主程序

function vve_examples:slime_block/_get
# 介质探测
execute as 0-0-0-0-0 run function vve_examples:slime_block/_iter_cpoints_c
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
# 介质响应
execute if score shift_response int matches 1 run function vve:object/_apply_shift
execute if score impulse_response int matches 1 run function vve:object/_apply_impulse_f
function vve:object/_apply_friction
function vve_examples:slime_block/_store