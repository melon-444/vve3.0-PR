#vve_examples:impulse_lamp/test/this/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

execute if score test_n int matches 0..4 run return run scoreboard players add test_n int 1
#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:impulse_lamp/_get
#function vve_examples:impulse_lamp/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:impulse_lamp/test/this/store_frame with storage vve_examples:io {}

function vve_examples:impulse_lamp/main_c
#scoreboard players set inp int 7500
#execute if score test_n int matches 60..72 at @s positioned ~-1 ~0.5 ~ rotated -90.0 0.0 run function vve_examples:impulse_lamp/_poke_here_i_as
#execute as 0-0-0-0-0 run function vve:impulse/_render

scoreboard players add test_n int 1