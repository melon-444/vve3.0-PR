#vve_examples:skip_stone/main
# vve_examples:skip_stone/tick调用
# 实体对象主程序

function vve_examples:skip_stone/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:point/_iter_motion
# 介质探测
function vve:point/_get_cpoint
scoreboard players operation c_mass int = mass int
execute as 0-0-0-0-0 run function vve:cpoint/_topos
execute as 0-0-0-0-0 at @s run function vve:_detect_material
# 介质响应和重力
execute if score shift_response int matches 1 run function vve:point/_receive_shift
execute if score impulse_response int matches 1 run function vve:point/_apply_impulse
function vve:point/_receive_friction
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
# 运动同步
function vve:point/_sync_motion
function vve_examples:skip_stone/_store

# 声音程序
function vve:sound/_get
execute as 0-0-0-0-0 run function vve:sound/main
function vve:sound/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_examples:skip_stone/_del