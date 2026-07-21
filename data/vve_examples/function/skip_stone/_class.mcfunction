#vve_examples:skip_stone/_class
# 生成预设静态数据模板

function vve_examples:skip_stone/_zero
scoreboard players set inp int 0
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as 0-0-0-0-0 run function vve:point/_anchor_to
scoreboard players set mass int 1
function vve_examples:skip_stone/_model
data modify storage vve_examples:class skip_stone_plate set from storage vve_examples:io result