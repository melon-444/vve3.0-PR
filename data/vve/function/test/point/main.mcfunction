#vve:test/point/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

execute as @e[tag=point_test] run function vve:test/point/main_point

scoreboard players add test_n int 1