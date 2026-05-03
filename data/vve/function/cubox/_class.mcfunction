#vve:cubox/_class
# 生成预设静态数据模板

function vve:cubox/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set scale_u int 2500
scoreboard players set scale_v int 2500
scoreboard players set scale_w int 5000
scoreboard players set mass int 17
function vve:cubox/_calc_shift
function vve:cubox/_calc_tensor
function vve:cubox/_model
data modify storage vve:class cubox_plate set from storage vve:io result