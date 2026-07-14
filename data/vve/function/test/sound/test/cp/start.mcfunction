#vve:test/sound/test/cp/start

function vve:_consts
function vve:test/sound/init

kill @e[tag=test]

# 测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 grass_block
execute at @e[tag=math_marker,limit=1] run setblock ~ ~-1 ~ soul_sand
execute at @e[tag=math_marker,limit=1] run setblock ~1 ~-1 ~ deepslate

# 生成测试程序实体
data modify storage vve:io input set from storage vve:class sound_plate
function vve:test/sound/_proj
execute at @e[tag=math_marker,limit=1] positioned ~1.05 ~3 ~ rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:test/sound/_model
data modify storage vve:io input set from storage vve:io result
data modify entity @e[tag=math_marker,limit=1] Pos set from storage vve:io input.center
execute at @e[tag=math_marker,limit=1] run function vve:test/sound/_new
tag @e[tag=result,limit=1] add test
tag @e[tag=result,limit=1] remove sound

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/sound/test/cp/main"
data modify storage marker_control:io result.del_func set value "vve:test/sound/test/cp/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 10
scoreboard players set test int -1

# 设置旋转
execute at @e[tag=result,limit=1] positioned ~5.0 ~5.0 ~5.0 run function vve:test/sound/test/cp/rotate_here