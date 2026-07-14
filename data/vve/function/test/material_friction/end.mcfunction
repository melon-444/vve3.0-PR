#vve:test/material_friction/end

execute as @e[tag=vve_cublock,tag=test] run function vve:cublock/_del

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~1 ~0 ~3 ~1 ~1 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~1 ~2 ~3 ~1 ~3 air
execute at @e[tag=math_marker,limit=1] run fill ~4 ~1 ~0 ~4 ~3 ~3 air