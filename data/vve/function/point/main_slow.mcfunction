#vve:point/main_slow
# vve:point/tick调用
# 实体对象慢倍速主程序
# 输入simulator{...}

scoreboard players operation inv_dt int = global_inv_dt int
execute if score global_sim_mod int < inv_dt int run function vve:point/main_slow_mov
execute if score global_sim_mod int = inv_dt int run function vve:point/main_slow_key
execute if score global_sim_mod int = inv_dt int run function vve:point/main_force
function vve:point/main_sync