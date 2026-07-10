#vve:point/main
# vve:point/tick调用
# 实体对象主程序

function vve:point/_get
# 运动学迭代
function vve:point/_iter_motion
# 介质探测
function vve:point/_get_cpoint
scoreboard players set c_mass int 1
execute as 0-0-0-0-0 run function vve:cpoint/_topos
execute as 0-0-0-0-0 at @s run function vve:_detect_material
# 接收响应
execute if score shift_response int matches 1 run function vve:point/_receive_shift
execute if score impulse_response int matches 1 run function vve:point/_receive_impulse
# 力学迭代
scoreboard players operation vy int -= vve_gravity int
# 摩擦响应
function vve:point/_receive_friction
# 运动同步
function vve:point/_sync_motion
function vve:point/_store