#vve_examples:impulse_lamp/light/set_operation
# vve_examples:impulse_lamp/light/_new调用

tag @s remove vve_examples_light
execute at @s if entity @e[tag=vve_examples_light,distance=..0.1] run return run kill @s
tag @s add vve_examples_light

execute at @s if block ~ ~ ~ #minecraft:air run setblock ~ ~ ~ light

function marker_control:data/_get
data modify storage marker_control:io result.del_func set value "vve_examples:impulse_lamp/light/_del"
function marker_control:data/_store
tag @s add entity_todel

scoreboard players set @s killtime 3