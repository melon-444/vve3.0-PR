#vve_examples:car_simulator/_print
# 打印临时对象数据

tellraw @a ["_this: ", "{"]
tellraw @a ["    ", "global_sim_mod: ", {"score":{"name":"global_sim_mod", "objective":"int"}}, ","]
tellraw @a ["    ", "global_inv_dt: ", {"score":{"name":"global_inv_dt", "objective":"int"}}, ","]
tellraw @a ["    ", "global_set_inv_dt: ", {"score":{"name":"global_set_inv_dt", "objective":"int"}}, ","]
tellraw @a ["    ", "global_rate: ", {"score":{"name":"global_rate", "objective":"int"}}, ","]
tellraw @a ["    ", "tick_funcs: ", {"nbt":"tick_funcs", "storage":"vve:io"}, ","]
tellraw @a ["    ", "sync_funcs: ", {"nbt":"sync_funcs", "storage":"vve:io"}]
tellraw @a "}"