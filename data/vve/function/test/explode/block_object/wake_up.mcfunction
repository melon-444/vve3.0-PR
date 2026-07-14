#vve:test/explode/block_object/wake_up
# vve:test/explode/tnt/_del调用

execute at @s run setblock ~ ~ ~ air
tag @s add vve_exploded
#data modify entity @s transformation.scale set value [1.0f,1.0f,1.0f]