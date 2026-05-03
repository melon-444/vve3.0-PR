#vve:cublock/outer_impulse_loop
# vve:cublock/_outer_impulse调用

data modify storage vve:io input set from storage vve:io result[0]
function vve:impulse/_proj
scoreboard players operation impulse_fx int /= res int
scoreboard players operation impulse_fy int /= res int
scoreboard players operation impulse_fz int /= res int
function vve:object/_apply_impulse

data remove storage vve:io result[0]
execute if data storage vve:io result[0] run function vve:cublock/outer_impulse_loop