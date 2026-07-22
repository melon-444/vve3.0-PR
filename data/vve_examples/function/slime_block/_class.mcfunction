#vve_examples:slime_block/_class
# 生成预设静态数据模板

function vve_examples:slime_block/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set scale_u int 10000
scoreboard players set scale_v int 10000
scoreboard players set scale_w int 10000
scoreboard players set mass int 17
scoreboard players set inp int 120
function vve:box_object/_calc_tensor_i
scoreboard players set damp_k int 17
scoreboard players set damp_b int 20
scoreboard players set damp_f int 100
function vve_examples:slime_block/_model
data modify storage vve_examples:class slime_block_plate set from storage vve_examples:io result