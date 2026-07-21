#vve_examples:sphere/test/display_1/main

execute unless score test int matches -1 run return run scoreboard players operation @s killtime < 10 int
#execute if score @s killtime matches ..2 run function vve_examples:sphere/test/display_1/summon_d6
execute if score @s killtime matches ..2 run scoreboard players set @s killtime 60

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:sphere/_get
#function vve_examples:sphere/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:sphere/test/display_1/store_frame with storage vve_examples:io {}

execute as @e[tag=dice_6,tag=test] run function vve_examples:sphere/test/display_1/main_large

function vve_examples:sphere/_get

scoreboard players set inp int 500
data modify storage math:io render_command set from storage math:class particle_commands.end_rod
execute as 0-0-0-0-0 run function math:sphere/_render_cnt

function vve_examples:sphere/_store

execute if score test_n int matches 2 run function vve_examples:sphere/test/display_1/summon_5
execute if score test_n int matches 4 run function vve_examples:sphere/test/display_1/summon_5
scoreboard players add test_n int 1