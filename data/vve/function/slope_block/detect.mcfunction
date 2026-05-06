#vve:slope_block/detect
# vve:_detect_slope调用
# vve:slope_block/shift_detect调用

execute if block ~ ~ ~ minecraft:birch_trapdoor[facing=west] run function vve:slope_block/detect_west
execute if block ~ ~ ~ minecraft:birch_trapdoor[facing=east] run function vve:slope_block/detect_east
execute if block ~ ~ ~ minecraft:birch_trapdoor[facing=south] run function vve:slope_block/detect_south
execute if block ~ ~ ~ minecraft:birch_trapdoor[facing=north] run function vve:slope_block/detect_north