#vve_examples:dice_6_s/_class
# 生成预设静态数据模板

function vve_examples:dice_6_s/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
execute store result score scale_u int run scoreboard players set a int 2500
scoreboard players set mass int 17
scoreboard players set inertia int 458
execute store result score scale_w int store result score scale_v int run scoreboard players operation scale_u int *= 2 int
function vve:cublock/_calc_shift
function vve_examples:dice_6_s/_model
data modify storage vve_examples:class dice_6_s_plate set from storage vve_examples:io result