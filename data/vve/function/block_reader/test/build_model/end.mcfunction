#vve:block_reader/test/build_model/end

function vve:block_reader/test/build_model/_del

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute as @e[tag=math_marker,limit=1] at @s run tp @s ~-4 ~-2 ~5
execute as @e[tag=math_marker,limit=1] at @s run fill ~ ~ ~ ~-4 ~8 ~-6 air

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~0.0 ~-1.0 ~-0.50 run setblock ~ ~ ~ air