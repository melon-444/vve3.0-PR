#vve_examples:slime_block/test/float/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~2 ~-1 ~-2 ~-2 ~-1 ~2 air
execute at @e[tag=math_marker,limit=1] run fill ~3 ~0 ~-2 ~3 ~1 ~2 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~1 ~3 ~2 ~0 ~3 air
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~0 ~2 ~-3 ~1 ~-2 air
execute at @e[tag=math_marker,limit=1] run fill ~2 ~1 ~-3 ~-2 ~0 ~-3 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~0 ~-2 ~2 ~1 ~2 air

function vve_examples:slime_block/_del