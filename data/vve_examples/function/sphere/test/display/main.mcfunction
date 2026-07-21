#vve_examples:sphere/test/display/main

execute unless score test int matches -1 run return run scoreboard players operation @s killtime < 10 int
execute if score @s killtime matches ..2 run function vve_examples:sphere/test/display/summon_d6
execute if score @s killtime matches ..2 run scoreboard players set @s killtime 30

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:sphere/_get
#function vve_examples:sphere/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:sphere/test/display/store_frame with storage vve_examples:io {}

execute as @e[tag=dice_6,tag=test] run function vve_examples:sphere/test/display/main_large
execute as @e[tag=dice_6,tag=test] run function vve_examples:sphere/test/display/main_large
execute as @e[tag=dice_6,tag=test] run function vve_examples:sphere/test/display/main_large
execute as @e[tag=dice_6,tag=test] run function vve_examples:sphere/test/display/main_large
execute as @e[tag=dice_6,tag=test] run function vve_examples:sphere/test/display/main_large

function vve_examples:sphere/main
#scoreboard players set inp int 7500
#execute if score test_n int matches 60..72 at @s positioned ~-1 ~0.5 ~ rotated -90.0 0.0 run function vve_examples:sphere/_poke_here_i_as
#execute as 0-0-0-0-0 run function vve:impulse/_render

scoreboard players add test_n int 1