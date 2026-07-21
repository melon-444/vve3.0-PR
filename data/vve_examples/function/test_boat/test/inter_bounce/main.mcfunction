#vve_examples:test_boat/test/inter_bounce/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:test_boat/_get
#function vve_examples:test_boat/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:test_boat/test/inter_bounce/store_frame with storage vve_examples:io {}

execute as @e[tag=vve_examples_test_boat,tag=test] run function vve_examples:test_boat/main_c

scoreboard players add test_n int 1