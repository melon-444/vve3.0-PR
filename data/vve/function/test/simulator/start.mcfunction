#vve:test/simulator/start

function vve:_init

execute as @e[tag=vve_cublock] run function vve:cublock/_del
# 生成测试物理方块
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute positioned 193 -53 53 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute positioned 193 -53 53 run function vve:cublock/_new
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight
scoreboard players set inp int 65000
execute as @e[tag=result,limit=1] at @s positioned ~ ~0.5 ~-1.0 rotated 0.0 0.0 run function vve:object/_poke_here_i_as
data modify entity @e[tag=result,limit=1] CustomName set value "A"

data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute positioned 193 -53 55 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute positioned 193 -53 55 run function vve:cublock/_new
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight
data modify entity @e[tag=result,limit=1] CustomName set value "B"

# 生成测试程序实体
tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["test", "vve_test", "result"], CustomName:'{"text":"vve_test"}'}

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/simulator/main"
data modify storage marker_control:io result.del_func set value "vve:test/simulator/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

function vve:simulator/_get
scoreboard players set global_rate int 4
scoreboard players set global_set_inv_dt int 4
data modify storage vve:io input set value "vve:cublock/tick"
function vve:simulator/_append_tick_func
function vve:simulator/_store

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 10
scoreboard players set test int -1