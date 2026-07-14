#vve:test/float/end

function vve:cublock/_del

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~2 ~-1 ~0 ~-2 ~-1 ~4 air
execute at @e[tag=math_marker,limit=1] run fill ~3 ~0 ~0 ~3 ~1 ~4 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~1 ~5 ~2 ~0 ~5 air
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~0 ~4 ~-3 ~1 ~0 air
execute at @e[tag=math_marker,limit=1] run fill ~2 ~1 ~-1 ~-2 ~0 ~-1 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~0 ~0 ~2 ~1 ~4 air