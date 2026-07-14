#vve_examples:test_car/test/frame

tellraw @a "---"
$tellraw @a "frame: $(frame)"
$data modify storage vve_examples:io input set from storage vve_examples:io test_frames.$(frame)
function vve_examples:test_car/_new
execute as @e[tag=result,limit=1] run function marker_control:data/_get
# 设置销毁函数
data modify storage marker_control:io result.del_func set value "vve_examples:test_car/_del"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_todel
scoreboard players set @e[tag=result,limit=1] killtime 50
execute as @e[tag=result,limit=1] run function vve_examples:test_car/main_c

return fail
tellraw @a "---next frame---"
#execute as @e[tag=result,limit=1] run function vve_examples:test_car/main_c
tag @e[tag=result,limit=1] remove vve_material_box
execute as @e[tag=result,limit=1] run function vve_examples:test_car/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion
# 介质探测
execute as 0-0-0-0-0 run function vve_examples:test_car/_iter_cpoints_c
# 运动同步
execute as @e[tag=result,limit=1] run function vve:cubox/_sync_motion
tag @e[tag=result,limit=1] add vve_material_box