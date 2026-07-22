#vve_examples:domino/test/push_1/main

execute unless score test int matches -1 run return run scoreboard players operation @s killtime < 10 int
execute if score @s killtime matches ..1 run scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:domino/_get
#function vve_examples:domino/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:domino/test/push_1/store_frame with storage vve_examples:io {}

scoreboard players set inp int 7500
execute if score test_n int matches 30 as @e[tag=vve_examples_domino,tag=test,name="A",limit=1] at @s positioned ~-1 ~20.0 ~ rotated -90.0 0.0 run function vve_examples:domino/_poke_here_i_as

execute as @e[tag=vve_examples_domino,tag=test] run function vve_examples:domino/main_c
#scoreboard players set inp int 7500
#execute if score test_n int matches 60..72 at @s positioned ~-1 ~0.5 ~ rotated -90.0 0.0 run function vve_examples:domino/_poke_here_i_as
#execute as 0-0-0-0-0 run function vve:impulse/_render

scoreboard players add test_n int 1