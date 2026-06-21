#vve:impulse/_print_f
# 打印临时对象数据

tellraw @a ["impulse: ", "{"]
tellraw @a ["    ", "vector: ", "[", {"score":{"name":"impulse_fx", "objective":"int"}}, ", " ,{"score":{"name":"impulse_fy", "objective":"int"}}, ", " ,{"score":{"name":"impulse_fz", "objective":"int"}}, "]"]
tellraw @a "}"