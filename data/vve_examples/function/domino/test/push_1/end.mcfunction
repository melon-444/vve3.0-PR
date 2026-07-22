#vve_examples:domino/test/push_1/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~-1 ~-3 ~10 ~-1 ~3 air

execute as @e[tag=vve_examples_domino,tag=test] run function vve_examples:domino/_del