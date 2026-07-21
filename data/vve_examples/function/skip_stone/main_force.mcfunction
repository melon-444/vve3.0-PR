#vve_examples:skip_stone/main_force
# vve_examples:skip_stone/tick调用
# 实体对象力学迭代主程序

function vve_examples:skip_stone/_get
# 介质探测
function vve:point/_get_cpoint
scoreboard players operation c_mass int = mass int
execute as 0-0-0-0-0 run function vve:cpoint/_topos
execute as 0-0-0-0-0 at @s run function vve:_detect_material
# 介质响应
execute if score shift_response int matches 1 run function vve:point/_receive_shift
execute if score impulse_response int matches 1 run function vve:point/_apply_impulse
function vve:point/_receive_friction
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
function vve_examples:skip_stone/_store