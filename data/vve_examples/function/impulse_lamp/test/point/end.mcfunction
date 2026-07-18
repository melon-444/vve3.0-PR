#vve_examples:impulse_lamp/test/point/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 air

function vve_examples:impulse_lamp/_del
kill @e[tag=point_test]