#vve:test/point/main_point

function vve:point/_get
function vve:point/_iter_motion
function vve:point/_get_cpoint
scoreboard players set c_mass int 1
execute as 0-0-0-0-0 run function vve:cpoint/_topos
execute as 0-0-0-0-0 at @s run function vve:_detect_material
execute if score shift_response int matches 1 run function vve:test/point/_receive_shift
execute if score impulse_response int matches 1 run function vve:test/point/_receive_impulse
scoreboard players operation vy int -= vve_gravity int
function vve:point/_receive_friction
function vve:point/_sync_motion
function vve:point/_store

# 声音程序
function vve:sound/_get
execute as 0-0-0-0-0 run function vve:sound/main
function vve:sound/_store