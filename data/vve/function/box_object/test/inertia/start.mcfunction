#vve:box_object/test/inertia/start

function vve:_init

# 生成测试程序实体
data modify storage vve:io input set from storage vve:class box_object_plate
function vve:box_object/_proj
execute positioned 193 -53 53 rotated 0.0 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve:box_object/_model
data modify storage vve:io input set from storage vve:io result
execute positioned 193 -53 53 run function vve:box_object/_new
item replace entity @e[tag=result,limit=1] container.0 with minecraft:sea_lantern

execute as @e[tag=result,limit=1] run function marker_control:data/_get

# 设置测试程序主函数和销毁函数
data modify storage marker_control:io result.tick_func set value "vve:box_object/test/inertia/main"
data modify storage marker_control:io result.del_func set value "vve:box_object/test/inertia/end"

execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked
tag @e[tag=result,limit=1] add entity_todel

# 设置测试程序运行时间
scoreboard players set @e[tag=result,limit=1] killtime 20
scoreboard players set test int -1

data modify storage math:io input set value []
scoreboard players set r int 1000
scoreboard players set inp int 256
data modify storage math:io render_command set value "function vve:box_object/test/inertia/render_append"
execute as @e[tag=math_marker,limit=1] run function math:sphere/_render_cnt