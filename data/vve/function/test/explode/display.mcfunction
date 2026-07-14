#vve:test/explode/display

execute as @e[tag=vve_cube,tag=test] run function vve:cube/_del
function vve:cube/_zero
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~-3 ~-10 ~ rotated 0.0 0.0 as 0-0-0-0-0 run function vve:object/_anchor_to
scoreboard players set scale_u int 400000
scoreboard players set scale_v int 60000
scoreboard players set scale_w int 400000
function vve:cube/_model
data modify storage vve:io input set from storage vve:io result
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~-3 ~-10 ~ run function vve:cube/_new
tag @e[tag=result,limit=1] add test
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with glass
scoreboard players set @e[tag=result,limit=1] killtime 500

data modify entity @e[tag=result,limit=1] response set value 1b

execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.del_func set value "vve:cube/_del"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_todel