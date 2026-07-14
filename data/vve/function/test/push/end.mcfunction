#vve:test/push/end

execute as @e[tag=vve_cubox] run function vve:cubox/_del

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~ ~-3 ~2 ~ ~6 air