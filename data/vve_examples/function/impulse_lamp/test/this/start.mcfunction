#vve_examples:impulse_lamp/test/this/start
# 需要安装math3.1_gelib

function vve:_consts
function vve_examples:impulse_lamp/init

# 上tick末尾姿态是C
# 同一个函数的上下文
data modify entity @s transformation set value A
data modify entity @s transformation set value B
data modify entity @s interpolation_start set value 0

# 测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~ ~-2 ~3 ~5 ~2 air
execute at @e[tag=math_marker,limit=1] run fill ~-3 ~-1 ~-2 ~3 ~-1 ~2 glass

tag @e[tag=test] remove test

# 生成测试程序实体
data modify storage vve_examples:io input set from storage vve_examples:io test_plate
data modify entity @e[tag=math_marker,limit=1] Pos set from storage vve_examples:io input.center
execute at @e[tag=math_marker,limit=1] run function vve_examples:impulse_lamp/_new
tag @e[tag=result,limit=1] add test
tag @e[tag=result,limit=1] remove impulse_lamp

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve_examples:impulse_lamp/test/this/main"
data modify storage marker_control:io result.del_func set value "vve_examples:impulse_lamp/test/this/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 10
scoreboard players set test int -1
scoreboard players set test_n int 0

# 设置旋转
#execute as @e[tag=result,limit=1] at @s positioned ~5.0 ~5.0 ~5.0 run function vve:object/_rotate_here_as