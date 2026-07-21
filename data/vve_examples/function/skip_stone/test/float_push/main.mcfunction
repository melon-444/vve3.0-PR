#vve_examples:skip_stone/test/float_push/main

execute unless score test int matches -1 run return run scoreboard players operation @s killtime < 10 int
execute if score @s killtime matches ..9 run scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:skip_stone/_get
#function vve_examples:skip_stone/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:skip_stone/test/float_push/store_frame with storage vve_examples:io {}

execute if score @s killtime matches 30 run function vve_examples:skip_stone/test/float_push/summon_high

execute as @e[tag=vve_examples_skip_stone] run function vve_examples:skip_stone/main_l
#scoreboard players set inp int 7500
#execute if score test_n int matches 60..72 at @s positioned ~-1 ~0.5 ~ rotated -90.0 0.0 run function vve_examples:skip_stone/_poke_here_i_as
#execute as 0-0-0-0-0 run function vve:impulse/_render

scoreboard players add test_n int 1