#vve_examples:dice_4/_class
# 生成预设静态数据模板

function vve_examples:dice_4/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set a int 4500
scoreboard players set mass int 17
scoreboard players set inertia int 814
function vve_examples:dice_4/_model
data modify storage vve_examples:class dice_4_plate set from storage vve_examples:io result