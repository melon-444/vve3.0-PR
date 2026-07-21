#vve_examples:test_boat/test/pool/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-6 ~-1 ~-3 ~6 ~ ~36 air
execute at @e[tag=math_marker,limit=1] run fill ~-6 ~-2 ~-3 ~6 ~-2 ~36 air
execute at @e[tag=math_marker,limit=1] run fill ~-7 ~-1 ~-3 ~-7 ~ ~36 air
execute at @e[tag=math_marker,limit=1] run fill ~7 ~-1 ~-3 ~7 ~ ~36 air
execute at @e[tag=math_marker,limit=1] run fill ~-6 ~-1 ~-4 ~6 ~ ~-4 air
execute at @e[tag=math_marker,limit=1] run fill ~-6 ~-1 ~37 ~6 ~ ~37 air

function vve_examples:test_boat/_del