#vve:test/simulator/end

execute as @e[tag=vve_cublock] run function vve:cublock/_del

function vve:simulator/_get
function vve:simulator/_clear_tick_funcs
function vve:simulator/_clear_sync_funcs
function vve:simulator/_store

# 获取测试坐标，生成测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 air