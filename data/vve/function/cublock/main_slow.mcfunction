#vve:cublock/main_slow
# vve:cublock/tick调用
# 实体对象慢倍速主程序
# 输入simulator{...}

scoreboard players operation inv_dt int = global_inv_dt int
execute if score global_sim_mod int < inv_dt int run function vve:cublock/main_slow_mov
execute if score global_sim_mod int = inv_dt int run function vve:cublock/main_slow_key
execute if score global_sim_mod int = inv_dt int run function vve:cublock/main_force
function vve:cublock/main_sync