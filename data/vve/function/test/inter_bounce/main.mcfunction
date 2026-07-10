#vve:test/inter_bounce/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

execute as @e[tag=vve_cublock] run function vve:cublock/main_c

scoreboard players add test_n int 1