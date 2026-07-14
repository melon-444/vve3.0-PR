#vve:cube/test/display

function vve:cube/init

execute as @e[tag=vve_cube,tag=test] run function vve:cube/_del
function vve:cube/_zero
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~ ~-1 ~ rotated 45.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set scale_u int 40000
scoreboard players set scale_v int 10000
scoreboard players set scale_w int 40000
function vve:cube/_model
data modify storage vve:io input set from storage vve:io result
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~ ~-1 ~ run function vve:cube/_new
tag @e[tag=result,limit=1] add test
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with glass