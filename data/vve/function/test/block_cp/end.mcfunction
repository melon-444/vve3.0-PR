#vve:test/block_cp/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-1 ~-1 ~-1 ~1 ~-1 ~1 air