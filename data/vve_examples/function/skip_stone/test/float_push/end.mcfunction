#vve_examples:skip_stone/test/float_push/end

# 测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~2 ~-1 ~-2 ~-2 ~-1 ~16 air
execute at @e[tag=math_marker,limit=1] run fill ~3 ~0 ~-2 ~3 ~1 ~16 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~1 ~17 ~2 ~0 ~17 air
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~0 ~16 ~-3 ~1 ~-2 air
execute at @e[tag=math_marker,limit=1] run fill ~2 ~1 ~-3 ~-2 ~0 ~-3 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~0 ~-2 ~2 ~1 ~16 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~2 ~-2 ~2 ~5 ~16 air

execute as @e[tag=vve_examples_skip_stone] run function vve_examples:skip_stone/_del