#vve:test/material_bounce/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

execute as @e[tag=vve_cublock,tag=test] run function vve:cublock/main_c