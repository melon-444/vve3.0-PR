#vve_examples:sphere/_class
# 生成预设静态数据模板

function vve_examples:sphere/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set r int 10000
function vve_examples:sphere/_calc_scale
function vve_examples:sphere/_model
data modify storage vve_examples:class sphere_plate set from storage vve_examples:io result