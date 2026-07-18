#vve_examples:dice_10/render_line
# vve_examples:dice_10/_render调用

execute store result score u int run data get storage vve_examples:io temp[0][0] 10000
execute store result score v int run data get storage vve_examples:io temp[0][1] 10000
execute store result score w int run data get storage vve_examples:io temp[0][2] 10000
function math:uvw/_tofvec
scoreboard players operation x int = fvec_x int
scoreboard players operation y int = fvec_y int
scoreboard players operation z int = fvec_z int
execute store result score u int run data get storage vve_examples:io temp[1][0] 10000
execute store result score v int run data get storage vve_examples:io temp[1][1] 10000
execute store result score w int run data get storage vve_examples:io temp[1][2] 10000
function math:uvw/_tofvec
scoreboard players operation line_dx int = fvec_x int
scoreboard players operation line_dy int = fvec_y int
scoreboard players operation line_dz int = fvec_z int
scoreboard players operation x int *= a int
scoreboard players operation y int *= a int
scoreboard players operation z int *= a int
scoreboard players operation line_dx int *= a int
scoreboard players operation line_dy int *= a int
scoreboard players operation line_dz int *= a int
scoreboard players set scale_u int 11000
scoreboard players operation x int /= scale_u int
scoreboard players operation y int /= scale_u int
scoreboard players operation z int /= scale_u int
scoreboard players operation line_dx int /= scale_u int
scoreboard players operation line_dy int /= scale_u int
scoreboard players operation line_dz int /= scale_u int
scoreboard players operation line_dx int -= x int
scoreboard players operation line_dy int -= y int
scoreboard players operation line_dz int -= z int

scoreboard players operation x int += x_start int
scoreboard players operation y int += y_start int
scoreboard players operation z int += z_start int

execute as 0-0-0-0-0 run function math:line/_render