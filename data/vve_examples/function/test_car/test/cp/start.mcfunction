#vve_examples:test_car/test/cp/start

function vve:_init
function vve_examples:_init

scoreboard players set vve_grab_friction int 9500
scoreboard players set vve_solid_friction int 9500
scoreboard players set vve_grab_friction_tan int 9500
scoreboard players set vve_solid_friction_tan int 9500
# 使用函数y=1/(x+1)对比例x进行映射后得到的值
scoreboard players set vve_solid_bounce_inv int 6896

# 生成测试程序实体
data modify storage vve_examples:io input set from storage vve_examples:class test_car_plate
function vve_examples:test_car/_proj
execute positioned 193 -56.7125 53 rotated -90.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve_examples:test_car/_model
data modify storage vve_examples:io input set from storage vve_examples:io result
execute positioned 193 -56.7125 53 run function vve_examples:test_car/_new
data modify entity @e[tag=result,limit=1] CustomName set value "A"
#function vve_examples:test_car/test/cp/poke
tag @e[tag=input] remove input
tag @p add input
execute as @e[tag=result,limit=1] run function vve_examples:test_car/_seat_on

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve_examples:test_car/test/cp/main"
data modify storage marker_control:io result.del_func set value "vve_examples:test_car/test/cp/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20
scoreboard players set test int -1
scoreboard players set test_n int 0

data modify storage vve_examples:io test_frames set value {}

#execute positioned 193 -53 53 positioned ~15 ~15 ~15 as @e[tag=result,limit=1] run function vve:object/_rotate_here_as