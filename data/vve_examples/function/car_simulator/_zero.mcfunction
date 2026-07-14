#vve_examples:car_simulator/_zero
# 把临时对象的全部数据置0

scoreboard players set global_sim_mod int 0
scoreboard players set global_inv_dt int 0
scoreboard players set global_set_inv_dt int 0
scoreboard players set global_rate int 0
data modify storage vve:io tick_funcs set value []
data modify storage vve:io sync_funcs set value []