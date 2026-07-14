#vve:test/explode/block/test

function vve:test/explode/block/init

data modify storage vve:io input set from storage vve:class explode_block_plate
function vve:test/explode/block/_proj
execute rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:test/explode/block/_model
data modify storage vve:io input set from storage vve:io result
function vve:test/explode/block/_new

execute as @e[tag=result,limit=1] on passengers run data modify entity @s block_state set value {Name:"minecraft:emerald_block"}

execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.del_func set value "vve:test/explode/block/_del"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_todel

scoreboard players set @e[tag=result,limit=1] killtime 100