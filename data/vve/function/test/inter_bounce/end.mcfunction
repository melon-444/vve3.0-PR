#vve:test/inter_bounce/end

execute as @e[tag=vve_cublock] run function vve:cublock/_del

# 获取测试坐标，生成测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-1 ~-1 ~-2 ~1 ~-1 ~2 air