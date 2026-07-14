#vve_examples:dice_simulator/_model
# 使用临时对象构建数据模板
# 输出数据模板storage vve_examples:io result

data modify storage vve_examples:io result set value {global_sim_mod:0, global_inv_dt:0, global_set_inv_dt:0, global_rate:0, tick_funcs:[], sync_funcs:[]}

execute store result storage vve_examples:io result.global_sim_mod int 1 run scoreboard players get global_sim_mod int
execute store result storage vve_examples:io result.global_inv_dt int 1 run scoreboard players get global_inv_dt int
execute store result storage vve_examples:io result.global_set_inv_dt int 1 run scoreboard players get global_set_inv_dt int
execute store result storage vve_examples:io result.global_rate int 1 run scoreboard players get global_rate int
data modify storage vve_examples:io result.tick_funcs set from storage vve:io tick_funcs
data modify storage vve_examples:io result.sync_funcs set from storage vve:io sync_funcs