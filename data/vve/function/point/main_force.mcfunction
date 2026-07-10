#vve:point/main_slow_force
# 实体对象力学迭代

function vve:point/_get
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
function vve:point/_store