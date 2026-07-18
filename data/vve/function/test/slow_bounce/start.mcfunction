#vve:test/slow_bounce/start

function vve:_consts

# 获取测试坐标，生成测试场地
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~0 ~-2 ~2 ~4 ~2 air
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~3 glass

execute as @e[tag=vve_cublock] run function vve:cublock/_del
# 生成测试物理方块
data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute at @e[tag=math_marker,limit=1] positioned ~ ~4 ~-2 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~ ~4 ~-2 run function vve:cublock/_new
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight
scoreboard players set inp int 65000
execute as @e[tag=result,limit=1] at @s positioned ~ ~0.5 ~-1.0 rotated 0.0 0.0 run function vve:object/_poke_here_i_as
data modify entity @e[tag=result,limit=1] CustomName set value "A"

data modify storage vve:io input set from storage vve:class cublock_plate
function vve:cublock/_proj
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~ ~4 ~ rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:cublock/_model
data modify storage vve:io input set from storage vve:io result
execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] positioned ~ ~4 ~ run function vve:cublock/_new
execute as @e[tag=result,limit=1] on passengers run item replace entity @s container.0 with minecraft:ochre_froglight
data modify entity @e[tag=result,limit=1] CustomName set value "B"

# 生成测试程序实体
tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["test", "vve_test", "result"], CustomName:'{"text":"vve_test"}'}

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:test/slow_bounce/main"
data modify storage marker_control:io result.del_func set value "vve:test/slow_bounce/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 10

scoreboard players set test int -1
scoreboard players set test_n int 0
scoreboard players set vve_sim_mod int 0
scoreboard players set inv_dt int 5
execute if score inv_dt int matches 1 run title @s subtitle {"text":"正常倍速"}
execute if score inv_dt int matches 1 run return run title @s title ""
title @s subtitle [{"score":{"name":"inv_dt","objective":"int"}},{"text":"倍速慢放"}]
title @s title ""