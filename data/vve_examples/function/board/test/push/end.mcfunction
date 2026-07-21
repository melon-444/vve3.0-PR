#vve_examples:board/test/push/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~-1 ~-2 ~6 ~-1 ~2 air

function vve_examples:board/_del