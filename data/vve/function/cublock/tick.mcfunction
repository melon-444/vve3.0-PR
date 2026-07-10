#vve:cublock/tick

scoreboard players operation inv_dt int = global_inv_dt int
execute if score global_sim_mod int < inv_dt int as @e[tag=vve_cublock] run function vve:cublock/main_slow_mov
execute if score global_sim_mod int = inv_dt int as @e[tag=vve_cublock] run function vve:cublock/main_slow_key
execute as @e[tag=vve_cublock] run function vve:cublock/main_sync
execute if score global_sim_mod int = inv_dt int as @e[tag=vve_cublock] run function vve:cublock/main_force