#vve_examples:skip_stone/main_l
# vve_examples:skip_stone/tick调用
# 实体对象主程序

function vve_examples:skip_stone/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:point/_iter_motion
# 介质探测
function vve:point/_get_cpoint
scoreboard players operation c_mass int = mass int
execute as 0-0-0-0-0 run function vve:cpoint/_topos
# 获取水平速度模长
scoreboard players operation inp int = vx int
scoreboard players operation inp int *= inp int
scoreboard players operation temp int = vz int
scoreboard players operation temp int *= temp int
scoreboard players operation inp int += temp int
function math:_sqrt
scoreboard players operation vve_water_c int = res int
scoreboard players operation vve_water_c int *= 100 int
scoreboard players set buoyancy_h int 300
scoreboard players set buoyancy_area int 10
execute as 0-0-0-0-0 at @s run function vve:_detect_liquid
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
execute unless score vve_last_material int matches -7 if score material_response int matches -7 at @s run particle minecraft:bubble ~ ~ ~ 0.15 0.15 0.15 0.1 25 force @a
execute as 0-0-0-0-0 run function vve:sound/main
function vve:sound/_store

# 坐标安全
execute unless score y int matches -640000..5120000 run function vve_examples:skip_stone/_del