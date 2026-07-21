#vve_examples:test_boat/test/pool/start
# 需要安装math3.1_gelib

function vve:_consts
function vve_examples:test_boat/init

# 测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-6 ~1 ~-3 ~6 ~5 ~36 air
execute at @e[tag=math_marker,limit=1] run fill ~-6 ~-1 ~-3 ~6 ~ ~36 water
execute at @e[tag=math_marker,limit=1] run fill ~-6 ~-2 ~-3 ~6 ~-2 ~36 grass_block
execute at @e[tag=math_marker,limit=1] run fill ~-7 ~-1 ~-3 ~-7 ~ ~36 grass_block
execute at @e[tag=math_marker,limit=1] run fill ~7 ~-1 ~-3 ~7 ~ ~36 grass_block
execute at @e[tag=math_marker,limit=1] run fill ~-6 ~-1 ~-4 ~6 ~ ~-4 grass_block
execute at @e[tag=math_marker,limit=1] run fill ~-6 ~-1 ~37 ~6 ~ ~37 grass_block

tag @e[tag=test] remove test

# 生成测试程序实体
data modify storage vve_examples:io input set from storage vve_examples:class test_boat_plate
function vve_examples:test_boat/_proj
execute as @e[tag=math_marker,limit=1] at @s positioned ~ ~4 ~ rotated 0.0 0.0 run function vve:object/_anchor_to
function vve_examples:test_boat/_model
data modify storage vve_examples:io input set from storage vve_examples:io result
data modify entity @e[tag=math_marker,limit=1] Pos set from storage vve_examples:io input.center
execute at @e[tag=math_marker,limit=1] run function vve_examples:test_boat/_new
tag @e[tag=result,limit=1] add test
execute as @p run function vve_examples:test_boat/_ride_on_nearest
tag @e[tag=result,limit=1] remove vve_examples_test_boat

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve_examples:test_boat/test/pool/main"
data modify storage marker_control:io result.del_func set value "vve_examples:test_boat/test/pool/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 10
scoreboard players set test int -1
scoreboard players set test_n int 0

# 设置旋转
#execute as @e[tag=result,limit=1] at @s positioned ~5.0 ~5.0 ~5.0 run function vve:object/_rotate_here_as