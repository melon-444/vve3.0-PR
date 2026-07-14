#vve:block_reader/task/_print
# 打印临时对象数据

tellraw @a ["_this: ", "{"]
tellraw @a ["    ", "start_y_layer: ", {"score":{"name":"y_start", "objective":"int"}}, ","]
tellraw @a ["    ", "y_layer: ", {"score":{"name":"y", "objective":"int"}}, ","]
tellraw @a ["    ", "area: ", "[", {"score":{"name":"x_min", "objective":"int"}}, ", " ,{"score":{"name":"z_min", "objective":"int"}}, ", " ,{"score":{"name":"x_max", "objective":"int"}}, ", " ,{"score":{"name":"z_max", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "callback: ", {"nbt":"run_func", "storage":"vve:io"}]
tellraw @a "}"