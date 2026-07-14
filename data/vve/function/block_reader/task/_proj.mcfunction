#vve:block_reader/task/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage vve:io input

execute store result score y_start int run data get storage vve:io input.y_start
execute store result score y int run data get storage vve:io input.y
execute store result score x_min int run data get storage vve:io input.x_min
execute store result score z_min int run data get storage vve:io input.z_min
execute store result score x_max int run data get storage vve:io input.x_max
execute store result score z_max int run data get storage vve:io input.z_max
data modify storage vve:io run_func set from storage vve:io input.run_func