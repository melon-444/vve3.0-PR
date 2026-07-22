#vve_examples:dice_6/test/spring/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 air

execute as @e[tag=dice_6,tag=test] run function vve_examples:dice_6/_del