#vve:cublock/test/inter_bounce/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve:cublock/_get
#function vve:cublock/_model
#execute store result storage vve:io frame int 1 run scoreboard players get test_n int
#function vve:cublock/test/inter_bounce/store_frame with storage vve:io {}

execute as @e[tag=vve_cublock,tag=test] run function vve:cublock/main_c

scoreboard players add test_n int 1