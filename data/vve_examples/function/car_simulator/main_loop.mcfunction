#vve_examples:car_simulator/main_loop
# vve_examples:car_simulator/main调用

# 慢速时钟转动
scoreboard players add global_sim_mod int 1

# 手动添加要执行的tick函数
execute as @e[tag=vve_test_car] run function vve_examples:test_car/main_c

# 回调tick函数
execute if data storage vve:io tick_funcs[0] run function vve:simulator/_run_tick_funcs

# 慢速时钟回调
scoreboard players operation global_sim_mod int %= global_inv_dt int
execute if score global_sim_mod int matches 0 run scoreboard players operation global_inv_dt int = global_set_inv_dt int

scoreboard players remove global_rate int 1
execute if score global_rate int matches 1.. run function vve_examples:car_simulator/main_loop
scoreboard players add global_rate int 1