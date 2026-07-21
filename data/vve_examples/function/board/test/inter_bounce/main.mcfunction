#vve_examples:board/test/inter_bounce/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:board/_get
#function vve_examples:board/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:board/test/inter_bounce/store_frame with storage vve_examples:io {}

execute as @e[tag=vve_examples_board,tag=test] run function vve_examples:board/main_c

#execute if score test_n int matches 16 run scoreboard players set test int 1
scoreboard players add test_n int 1