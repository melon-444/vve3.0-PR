#vve:cpoint/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage vve:io input

execute store result score c_x int run data get storage vve:io input.center[0] 10000
execute store result score c_y int run data get storage vve:io input.center[1] 10000
execute store result score c_z int run data get storage vve:io input.center[2] 10000
execute store result score c_vx int run data get storage vve:io input.velocity[0] 10000
execute store result score c_vy int run data get storage vve:io input.velocity[1] 10000
execute store result score c_vz int run data get storage vve:io input.velocity[2] 10000
execute store result score c_mass int run data get storage vve:io input.c_mass