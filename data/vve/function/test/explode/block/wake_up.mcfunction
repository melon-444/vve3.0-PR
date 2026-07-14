#vve:test/explode/block/wake_up
# vve:test/explode/tnt/_del调用

execute at @s run setblock ~ ~ ~ air
tag @s add vve_exploded
#execute on passengers run data modify entity @s transformation.scale set value [1.0f,1.0f,1.0f]