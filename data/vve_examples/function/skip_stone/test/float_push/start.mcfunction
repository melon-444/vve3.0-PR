#vve_examples:skip_stone/test/float_push/start
# 需要安装math3.1_gelib

function vve:_consts
function vve_examples:skip_stone/init
scoreboard players set vve_air_friction int 9950
scoreboard players set vve_water_friction int 9500
scoreboard players set vve_water_c int 300000

# 测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~2 ~-1 ~-2 ~-2 ~-1 ~16 oak_log
execute at @e[tag=math_marker,limit=1] run fill ~3 ~0 ~-2 ~3 ~1 ~16 oak_log
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~1 ~17 ~2 ~0 ~17 oak_log
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~0 ~16 ~-3 ~1 ~-2 oak_log
execute at @e[tag=math_marker,limit=1] run fill ~2 ~1 ~-3 ~-2 ~0 ~-3 oak_log
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~0 ~-2 ~2 ~1 ~16 water
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~2 ~-2 ~2 ~5 ~16 air

tag @e[tag=test] remove test

# 生成测试程序实体
data modify storage vve_examples:io input set from storage vve_examples:class skip_stone_plate
function vve_examples:skip_stone/_proj
scoreboard players set inp int 4150
execute as @e[tag=math_marker,limit=1] at @s positioned ~ ~2 ~-4 rotated 0.0 0.0 run function vve:point/_anchor_to
function vve_examples:skip_stone/_model
data modify storage vve_examples:io input set from storage vve_examples:io result
data modify entity @e[tag=math_marker,limit=1] Pos set from storage vve_examples:io input.center
execute at @e[tag=math_marker,limit=1] run function vve_examples:skip_stone/_new
tag @e[tag=result,limit=1] add test

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve_examples:skip_stone/test/float_push/main"
data modify storage marker_control:io result.del_func set value "vve_examples:skip_stone/test/float_push/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 100
scoreboard players set test int -1
scoreboard players set test_n int 0

# 设置旋转
#execute as @e[tag=result,limit=1] at @s positioned ~5.0 ~5.0 ~5.0 run function vve:object/_rotate_here_as