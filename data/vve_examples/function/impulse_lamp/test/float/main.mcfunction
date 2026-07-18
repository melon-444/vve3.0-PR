#vve_examples:impulse_lamp/test/float/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:impulse_lamp/_get
#function vve_examples:impulse_lamp/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:impulse_lamp/test/float/store_frame with storage vve_examples:io {}

function vve_examples:impulse_lamp/main_l

scoreboard players add test_n int 1