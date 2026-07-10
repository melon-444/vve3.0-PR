#vve:test_coord/_print
# 打印临时对象数据

tellraw @a ["_this: ", "{"]
tellraw @a ["    ", "center: ", "[", {"score":{"name":"vve_test_x", "objective":"int"}}, ", " ,{"score":{"name":"vve_test_y", "objective":"int"}}, ", " ,{"score":{"name":"vve_test_z", "objective":"int"}}, "]"]
tellraw @a "}"