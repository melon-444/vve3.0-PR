#vve_examples:impulse_lamp/test/this/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~-1 ~-2 ~3 ~-1 ~2 air

function vve_examples:impulse_lamp/_del