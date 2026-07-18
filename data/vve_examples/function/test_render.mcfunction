#vve_examples:test_render
# vve_examples:test调用

execute store result score x int run data get storage vve_examples:io temp[0][0] 10000
execute store result score y int run data get storage vve_examples:io temp[0][1] 10000
execute store result score z int run data get storage vve_examples:io temp[0][2] 10000
execute store result score line_dx int run data get storage vve_examples:io temp[1][0] 10000
execute store result score line_dy int run data get storage vve_examples:io temp[1][1] 10000
execute store result score line_dz int run data get storage vve_examples:io temp[1][2] 10000
scoreboard players operation line_dx int -= x int
scoreboard players operation line_dy int -= y int
scoreboard players operation line_dz int -= z int

#function math:line/_print
#execute as 0-0-0-0-0 run function math:line/_render