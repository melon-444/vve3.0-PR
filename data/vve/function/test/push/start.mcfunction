#vve:test/push/start

function vve:_init

scoreboard players set vve_grab_friction_tan int 9900
scoreboard players set vve_solid_friction_tan int 9900

execute as @e[tag=vve_cubox] run function vve:cubox/_del
# 生成测试物理方块
data modify storage vve:io input set from storage vve:class cubox_plate
function vve:cubox/_proj
execute positioned 193 -56.7625 53 rotated -90.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
scoreboard players set scale_u int 15000
scoreboard players set scale_v int 7500
scoreboard players set scale_w int 25000
scoreboard players set mass int 17
function vve:cubox/_calc_shift
function vve:cubox/_calc_tensor
function vve:cubox/_model
data modify storage vve:io input set from storage vve:io result
execute positioned 193 -56.7625 53 run function vve:cubox/_new
#execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:sea_lantern
data modify entity @e[tag=result,limit=1] CustomName set value "A"
#function vve:test/push/poke

#data modify storage vve:io input set from storage vve:class cubox_plate
#function vve:cubox/_proj
#execute positioned 193 -56.7625 55 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
#function vve:cubox/_model
#data modify storage vve:io input set from storage vve:io result
#execute positioned 193 -56.7625 55 run function vve:cubox/_new
#execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight
#data modify entity @e[tag=result,limit=1] CustomName set value "B"

# 生成测试程序实体
tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["test", "vve_test", "result"], CustomName:'{"text":"vve_test"}'}

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/push/main"
data modify storage marker_control:io result.del_func set value "vve:test/push/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20
scoreboard players set test int -1
scoreboard players set test_n int 0