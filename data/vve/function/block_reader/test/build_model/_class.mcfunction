#vve:block_reader/test/build_model/_class
# 生成预设静态数据模板

function vve:block_reader/test/build_model/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set scale_u int 10000
scoreboard players set scale_v int 10000
scoreboard players set scale_w int 20000
scoreboard players set mass int 17
function vve:box_object/_calc_tensor
function vve:block_reader/test/build_model/_model
data modify storage vve:class build_model_plate set from storage vve:io result