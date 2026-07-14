#vve:cublock/test/cp/end

kill @e[tag=test_tracker]
function vve:cublock/_del

# 测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 air