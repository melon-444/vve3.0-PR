#vve_examples:dice_6/get_value_loop
# vve_examples:dice_6/_get_value调用

execute store result score u int run data get storage vve_examples:io result[0][0] 10000
execute store result score v int run data get storage vve_examples:io result[0][1] 10000
execute store result score w int run data get storage vve_examples:io result[0][2] 10000
function math:uvw/_tofvec
execute if score fvec_y int > temp_max int store result score res int run data get storage vve_examples:io temp_values[0]
scoreboard players operation temp_max int > fvec_y int

data remove storage vve_examples:io temp_values[0]
data remove storage vve_examples:io result[0]
execute if data storage vve_examples:io result[0] run function vve_examples:dice_6/get_value_loop