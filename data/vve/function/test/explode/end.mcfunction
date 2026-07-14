#vve:test/explode/end

kill @e[type=item,tag=]
kill @e[tag=vve_tnt]
kill @e[tag=vve_explode_block]
kill @e[tag=vve_explode_block_object]
kill @e[tag=vve_explode_block_display]
execute as @e[tag=vve_cube,tag=test] run function vve:cube/_del

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~0.0 ~-3.5 ~0.0 ~-6.0 ~3.5 ~6.0 air
#execute at @e[tag=math_marker,limit=1] run fill ~13.0 ~-4.5 ~-13.0 ~-23.0 ~-5.5 ~23.0 minecraft:air