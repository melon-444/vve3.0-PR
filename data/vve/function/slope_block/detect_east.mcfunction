#vve:slope_block/detect_east
# vve:slope_block/detect调用

scoreboard players set grab_depth int 9999
scoreboard players operation grab_depth int -= stemp_x int
scoreboard players operation grab_depth int -= stemp_y int
execute if score grab_depth int >= vve_slope_block_d int run function vve:slope_block/response_east