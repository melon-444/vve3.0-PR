#vve:box_object/_class
# 生成预设静态数据模板

function vve:box_object/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set scale_u int 10000
scoreboard players set scale_v int 10000
scoreboard players set scale_w int 20000
scoreboard players set mass int 17
function vve:box_object/_calc_tensor
function vve:box_object/_model
data modify storage vve:class box_object_plate set from storage vve:io result