#vve_examples:board/_class
# 生成预设静态数据模板

function vve_examples:board/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set scale_u int 10000
scoreboard players set scale_v int 1000
scoreboard players set scale_w int 20000
scoreboard players set mass int 1
scoreboard players set inp int 120
function vve:box_object/_calc_tensor_i
function vve_examples:board/_model
data modify storage vve_examples:class board_plate set from storage vve_examples:io result