#vve_examples:skip_stone/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage vve_examples:io input

execute store result score mass int run data get storage vve_examples:io input.mass
execute store result score x int run data get storage vve_examples:io input.center[0] 10000
execute store result score y int run data get storage vve_examples:io input.center[1] 10000
execute store result score z int run data get storage vve_examples:io input.center[2] 10000
execute store result score vx int run data get storage vve_examples:io input.velocity[0] 10000
execute store result score vy int run data get storage vve_examples:io input.velocity[1] 10000
execute store result score vz int run data get storage vve_examples:io input.velocity[2] 10000