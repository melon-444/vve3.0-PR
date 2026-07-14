#vve_examples:dice_12/_class
# 生成预设静态数据模板

function vve_examples:dice_12/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set a int 2400
scoreboard players set mass int 17
scoreboard players set inertia int 500
function vve_examples:dice_12/_model
data modify storage vve_examples:class dice_12_plate set from storage vve_examples:io result