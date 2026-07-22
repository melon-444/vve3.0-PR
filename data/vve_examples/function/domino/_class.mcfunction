#vve_examples:domino/_class
# 生成预设静态数据模板

function vve_examples:domino/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set scale_u int 10000
scoreboard players set scale_v int 1000
scoreboard players set scale_w int 20000
scoreboard players set mass int 50
function vve:cubox/_calc_shift
scoreboard players set inp int 120
function vve:cubox/_calc_tensor_i
function vve_examples:domino/_model
data modify storage vve_examples:class domino_plate set from storage vve_examples:io result