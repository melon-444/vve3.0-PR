#vve_examples:roll_head/_del
# 销毁实体对象
# 输入执行实体

scoreboard players operation tempid int = @s vve_id
execute as @e[tag=vve_examples_roll_head_cam] if score @s int = tempid int run tag @s add tmp_1
execute as @e[tag=tmp_1] run function vve_examples:roll_head/cam_del
tag @e[tag=tmp_1] remove tmp_1

scoreboard players operation tempid int = @s int
execute as @a[tag=vve_id] if score @s vve_id = tempid int run tag @s add tmp
execute if entity @a[tag=tmp,limit=1] run function vve_examples:roll_head/exit_spectating

function vve:id/_return

kill @s