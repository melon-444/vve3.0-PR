#vve_examples:dice_10/test/cp/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:dice_10/_get
#function vve_examples:dice_10/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:dice_10/test/cp/store_frame with storage vve_examples:io {}

function vve_examples:dice_10/_get
# 运动学迭代
execute as 0-0-0-0-0 run function vve:object/_iter_motion
# 介质探测
scoreboard players set res int 0
data modify storage math:io render_command set value "function vve_examples:dice_10/label/_teleport_here"
scoreboard players set temp_cnt int 0
execute store result score inp int run scoreboard players operation tempid int = @s vve_id
execute at @s as @e[tag=dice_10_text_render,distance=..20] if score @s int = tempid int run scoreboard players add temp_cnt int 1
execute unless score temp_cnt int matches 12 run data modify storage math:io render_command set value "function vve_examples:dice_10/label/_summon_here"
execute as 0-0-0-0-0 run function vve_examples:dice_10/_iter_cpoints_render
# 运动同步
function vve:object/_sync_motion
function vve_examples:dice_10/_store
function vve_examples:dice_10/_render

scoreboard players add test_n int 1