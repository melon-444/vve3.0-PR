#vve:slope_block/detect_west
# vve:slope_block/detect调用

scoreboard players operation grab_depth int = stemp_x int
scoreboard players operation grab_depth int -= stemp_y int
execute if score grab_depth int matches -125.. run function vve:slope_block/response_west