#vve_examples:car_simulator/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage vve_examples:io input

execute store result score global_sim_mod int run data get storage vve_examples:io input.global_sim_mod
execute store result score global_inv_dt int run data get storage vve_examples:io input.global_inv_dt
execute store result score global_set_inv_dt int run data get storage vve_examples:io input.global_set_inv_dt
execute store result score global_rate int run data get storage vve_examples:io input.global_rate
data modify storage vve:io tick_funcs set from storage vve_examples:io input.tick_funcs
data modify storage vve:io sync_funcs set from storage vve_examples:io input.sync_funcs