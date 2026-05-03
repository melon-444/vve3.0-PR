#vve:box_object/test/cp/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]
function vve:box_object/main
scoreboard players add test_n int 1