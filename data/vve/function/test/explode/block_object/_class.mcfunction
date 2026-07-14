#vve:test/explode/block_object/_class
# 生成预设静态数据模板

function vve:test/explode/block_object/_zero
execute positioned 0.0 0.0 0.0 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
scoreboard players set a int 5000
scoreboard players set mass int 8
scoreboard players set inertia int 2000
function vve:test/explode/block_object/_model
data modify storage vve:class explode_block_object_plate set from storage vve:io result