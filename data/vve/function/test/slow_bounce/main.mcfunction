#vve:test/slow_bounce/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

scoreboard players add vve_sim_mod int 1
execute if score vve_sim_mod int < inv_dt int as @e[tag=vve_cublock] run function vve:cublock/main_slow_mov
execute if score vve_sim_mod int = inv_dt int as @e[tag=vve_cublock] run function vve:cublock/main_slow_key
execute as @e[tag=vve_cublock] run function vve:cublock/main_sync
execute if score vve_sim_mod int = inv_dt int as @e[tag=vve_cublock] run function vve:cublock/main_force
scoreboard players operation vve_sim_mod int %= inv_dt int

scoreboard players add test_n int 1