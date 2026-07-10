#vve:test_coord/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage vve:io input

execute store result score vve_test_x int run data get storage vve:io input.center[0] 10000
execute store result score vve_test_y int run data get storage vve:io input.center[1] 10000
execute store result score vve_test_z int run data get storage vve:io input.center[2] 10000